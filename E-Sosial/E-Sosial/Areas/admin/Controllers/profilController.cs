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
    public class profilController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/profil/

        public ActionResult Index()
        {
            var profil = from table in db.t_content where table.content_type == "Profil"
                         join table2 in db.users
                         on table.user_id equals table2.id_user
                         select new Models.Modul
                         {
                             modulId = table.content_id,
                             tipe = table.content_type,
                             nama = table.content_name,
                             user = table2.nama,
                             tanggal = table.content_time
                         };
            return View(profil.ToList());
        }

        //
        // GET: /admin/profil/Details/5

        public ActionResult Details(long id = 0)
        {
            t_content t_content = db.t_content.Find(id);
            var file = (from table in db.t_file where table.file_parent == id && table.file_category == "Profil" select table.file_url).FirstOrDefault();
            ViewBag.file = file;
            var iduser = (from table in db.t_content where table.content_id == id select table.user_id).FirstOrDefault();
            var user = (from table in db.users where table.id_user == iduser select table.nama).FirstOrDefault();
            ViewBag.user = user;
            if (t_content == null)
            {
                return HttpNotFound();
            }
            return View(t_content);
        }

        //
        // GET: /admin/profil/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/profil/Create

        [HttpPost]
        public ActionResult Create(admin.Models.ContentCreate t_content)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var valid = 0;
                    var create = db.t_content.Create();
                    var createFile = db.t_file.Create();

                    create.content_name = t_content.content_name;
                    create.content_type = "Profil";
                    create.content = t_content.content;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    create.content_time = DateTime.Now;
                    create.url = "kosong";

                    if (t_content.file != null)
                    {
                        if (t_content.file.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_content.file.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_content.file.SaveAs(path);

                                createFile.file_category = "Profil";
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
                                return View(t_content);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 3 MB");
                            return View(t_content);
                        }
                    }

                    db.t_content.Add(create);
                    db.SaveChanges();

                    if (valid == 1)
                    {
                        createFile.file_parent = ((int)(from table in db.t_content select table.content_id).Max());
                        db.t_file.Add(createFile);
                        db.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
            }

            return View(t_content);
        }

        //
        // GET: /admin/profil/Edit/5

        public ActionResult Edit(long id = 0)
        {
            var id_file = (from table in db.t_file where table.file_parent == id && table.file_category == "Profil" select table.file_id).FirstOrDefault();
            t_file tfile = db.t_file.Find(id_file);

            if (tfile != null)
            {
                var profil = (from table in db.t_content
                                join table2 in db.t_file
                                on table.content_id equals table2.file_parent
                                where table.content_id == id && table2.file_category == "Profil"
                                select new admin.Models.ContentCreate
                                {
                                    content_id = table.content_id,
                                    content = table.content,
                                    content_name = table.content_name,
                                    content_time = table.content_time,
                                    content_type = table.content_type,
                                    url = table.url,
                                    user_id = table.user_id

                                }).FirstOrDefault();

                if (profil == null)
                {
                    return HttpNotFound();
                }

                return View(profil);
            }
            else
            {
                var profil = (from table in db.t_content
                                where table.content_id == id
                                select new admin.Models.ContentCreate
                                {
                                    content_id = table.content_id,
                                    content = table.content,
                                    content_name = table.content_name,
                                    content_time = table.content_time,
                                    content_type = table.content_type,
                                    url = table.url,
                                    user_id = table.user_id

                                }).FirstOrDefault();

                if (profil== null)
                {
                    return HttpNotFound();
                }

                return View(profil);
            }
        }

        //
        // POST: /admin/profil/Edit/5

        [HttpPost]
        public ActionResult Edit(int id,admin.Models.ContentCreate t_content)
        {
            if (ModelState.IsValid)
            {
                var id_file = (from table in db.t_file where table.file_parent == id && table.file_category == "Profil" select table.file_id).FirstOrDefault();
                t_file tfile = db.t_file.Find(id_file);
                t_content content = db.t_content.Find(id);
          
                using (var konten = new db_esosEntities())
                {
                    content.content_name = t_content.content_name;
                    content.content_type = "Profil";
                    content.content = t_content.content;
                    content.user_id = (from table in konten.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    content.content_time = DateTime.Now;
                    content.url = "kosong";

                    if (t_content.file != null)
                    {
                        if (t_content.file.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_content.file.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_content.file.SaveAs(path);

                                var createFile = db.t_file.Create();

                                createFile.file_category = "Profil";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_parent = id;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                                db.t_file.Add(createFile);
                                db.SaveChanges();

                                if (tfile != null)
                                {
                                    db.t_file.Remove(tfile);
                                    db.SaveChanges();
                                }

                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                return View(t_content);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            return View(t_content);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_content);
        }

        //
        // GET: /admin/profil/Delete/5

        public ActionResult Delete(long id = 0)
        {
            t_content t_content = db.t_content.Find(id);
            db.t_content.Remove(t_content);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/profil/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_content t_content = db.t_content.Find(id);
            db.t_content.Remove(t_content);
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