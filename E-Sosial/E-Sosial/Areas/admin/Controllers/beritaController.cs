using System;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class beritaController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/berita/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_news.ToList());
        }

        //
        // GET: /admin/berita/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_news t_news = db.t_news.Find(id);
            var iduser = (from table in db.t_news where table.news_id == id select table.user_id).FirstOrDefault();
            var user = (from table in db.users where table.id_user == iduser select table.nama).FirstOrDefault();
            ViewBag.userNama = user;
            var idkategori = (from table in db.t_news where table.news_id == id select table.news_category).FirstOrDefault();
            var kategori = (from table in db.t_news_category where table.news_category_id == idkategori select table.category_title).FirstOrDefault();
            var gambar = (from table in db.t_file where table.file_parent == id && table.file_category == "Berita" select table.file_url).FirstOrDefault();
            ViewBag.namaKategori = kategori ;
            ViewBag.gambar = gambar;
            if (t_news == null)
            {
                return HttpNotFound();
            }
            return View(t_news);
        }

        //
        // GET: /admin/berita/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
            return View();
        }

        //
        // POST: /admin/berita/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.BeritaCreate t_news)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var valid = 0;
                    var create = db.t_news.Create();
                    var createFile = db.t_file.Create();

                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    create.news_date = DateTime.Now;
                    create.news_title = t_news.news_title;
                    create.news_content = t_news.news_content;
                    create.news_status = t_news.news_status;
                    create.news_modified = DateTime.Now;
                    create.news_parent = 0;
                    create.news_type = t_news.news_type;
                    create.news_url = "Kosong";
                    create.news_category = t_news.news_category;
                    
                    if (t_news.gambar != null)
                    {
                        if (t_news.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_news.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_news.gambar.SaveAs(path);

                                createFile.file_category = "Berita";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                                valid = 1;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                                return View(t_news);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                            return View(t_news);
                        }
                    }

                    db.t_news.Add(create);
                    db.SaveChanges();

                    if (valid == 1)
                    {
                        createFile.file_parent = (from table in db.t_news select table.news_id).Max();
                        db.t_file.Add(createFile);
                        db.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                return View(t_news);
            }
        }

        //
        // GET: /admin/berita/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_news t_news = db.t_news.Find(id);
            ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
            if (t_news == null)
            {
                return HttpNotFound();
            }
            return View(t_news);
        }

        //
        // POST: /admin/berita/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost,ActionName("Edit")]
        public ActionResult EditConfirmed(int id,admin.Models.BeritaCreate model)
        {
            t_news t_news = db.t_news.Find(id);
            var file = (from table in db.t_file where table.file_parent == id select table.file_id).FirstOrDefault();
            t_file t_file = db.t_file.Find(file);

            if (ModelState.IsValid)
            {
                using (var news = new db_esosEntities())
                {
                    var valid = 0;
                    var create = news.t_news.Create();
                    var createFile = news.t_file.Create();

                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    create.news_date = (from table in db.t_news where table.news_id == t_news.news_id select table.news_date).FirstOrDefault();
                    create.news_title = model.news_title;
                    create.news_content = model.news_content;
                    create.news_status = model.news_status;
                    create.news_modified = DateTime.Now;
                    create.news_parent = t_news.news_id;
                    create.news_type = model.news_type;
                    create.news_url = "Kosong";
                    create.news_category = model.news_category;
                    
                    if (model.gambar != null)
                    {
                        if (model.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(model.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                model.gambar.SaveAs(path);

                                createFile.file_category = "Berita";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                                valid = 1;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                                return View(t_news);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                            return View(t_news);
                        }
                    }
                    else
                    {
                        if (file != 0)
                        {
                            valid = 2;
                        }
                    }

                    db.t_news.Add(create);
                    db.SaveChanges();

                    t_news.news_status = "tidak_aktif";
                    db.SaveChanges();

                    if (valid == 1)
                    {
                        createFile.file_parent = (from table in db.t_news select table.news_id).Max();
                        db.t_file.Add(createFile);
                        db.SaveChanges();
                    }
                    else if (valid == 2)
                    {
                        t_file.file_parent = (from table in db.t_news select table.news_id).Max();
                        db.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.news_category = new SelectList(db.t_news_category.ToList(), "news_category_id", "category_title");
                return View(t_news);
            }
        }

        //
        // GET: /admin/berita/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_news t_news = db.t_news.Find(id);
            db.t_news.Remove(t_news);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        //
        // POST: /admin/berita/Delete/5

        [HttpPost, ActionName("Index")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_news t_news = db.t_news.Find(id);
            db.t_news.Remove(t_news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}