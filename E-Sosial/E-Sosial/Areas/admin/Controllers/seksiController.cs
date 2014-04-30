using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class seksiController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/seksi/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var seksi = from table in db.t_seksi
                        join table2 in db.users
                        on table.user_id equals table2.id_user
                        join table3 in db.t_bidang
                        on table.bidang_id equals table3.bidang_id
                        select new admin.Models.Seksi
                        {
                            seksi_id = table.seksi_id,
                            seksi_date = table.seksi_date,
                            seksi_name = table.seksi_name,
                            seksi_title = table.seksi_title,
                            bidang = table3.bidang_title,
                            user = table2.nama
                        };
            return View(seksi.ToList());
        }

        //
        // GET: /admin/seksi/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_seksi t_seksi = db.t_seksi.Find(id);
            var seksi = (from table in db.t_seksi where table.seksi_id == id
                        join table2 in db.users
                        on table.user_id equals table2.id_user
                        join table3 in db.t_bidang
                        on table.bidang_id equals table3.bidang_id
                        select new admin.Models.SeksiUpdate
                        {
                            seksi_id = table.seksi_id,
                            seksi_date = table.seksi_date,
                            seksi_name = table.seksi_name,
                            seksi_title = table.seksi_title,
                            bidang = table3.bidang_title,
                            user = table2.nama,
                            seksi_desc_foto = table.seksi_desc_foto,
                            seksi_description = table.seksi_description,
                            seksi_foto = table.seksi_foto
                        }).FirstOrDefault(); 
            if (seksi == null)
            {
                return HttpNotFound();
            }
            return View(seksi);
        }

        //
        // GET: /admin/seksi/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
            return View();
        }

        //
        // POST: /admin/seksi/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.SeksiCreate t_seksi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_seksi.Create();

                    create.seksi_date = DateTime.Now;
                    create.seksi_description = t_seksi.seksi_description;
                    create.seksi_name = t_seksi.seksi_name;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    create.seksi_title = t_seksi.seksi_title;
                    create.bidang_id = t_seksi.bidang_id;

                    if (t_seksi.seksi_foto != null)
                    {
                        if (t_seksi.seksi_foto.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_seksi.seksi_foto.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_seksi.seksi_foto.SaveAs(path);

                                create.seksi_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                                return View(t_seksi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                            return View(t_seksi);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Foto harus diisi");
                        ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                        return View(t_seksi);
                    }

                    if (t_seksi.seksi_desc_foto != null)
                    {
                        if (t_seksi.seksi_desc_foto.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_seksi.seksi_desc_foto.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_seksi.seksi_desc_foto.SaveAs(path);

                                create.seksi_desc_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                                return View(t_seksi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                            return View(t_seksi);
                        }
                    }
                    else
                    {
                        ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                        create.seksi_desc_foto = "Kosong";
                    }

                    db.t_seksi.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                return View(t_seksi);
            }
        }

        //
        // GET: /admin/seksi/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_seksi t_seksi = db.t_seksi.Find(id);
            var seksi = (from table in db.t_seksi
                         where table.seksi_id == id
                         join table2 in db.users
                         on table.user_id equals table2.id_user
                         join table3 in db.t_bidang
                         on table.bidang_id equals table3.bidang_id
                         select new admin.Models.SeksiUpdate
                         {
                             seksi_id = table.seksi_id,
                             seksi_date = table.seksi_date,
                             seksi_name = table.seksi_name,
                             seksi_title = table.seksi_title,
                             bidang = table3.bidang_name,
                             user = table2.nama,
                             seksi_desc_foto = table.seksi_desc_foto,
                             seksi_description = table.seksi_description,
                             seksi_foto = table.seksi_foto
                         }).FirstOrDefault();
            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
            if (seksi == null)
            {
                return HttpNotFound();
            }
            return View(seksi);
        }

        //
        // POST: /admin/seksi/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.SeksiCreate seksi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_seksi t_seksi = db.t_seksi.Find(id);

                    t_seksi.seksi_date = DateTime.Now;
                    t_seksi.seksi_description = seksi.seksi_description;
                    t_seksi.seksi_name = seksi.seksi_name;
                    t_seksi.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    t_seksi.seksi_title = seksi.seksi_title;
                    t_seksi.bidang_id = seksi.bidang_id;

                    if (seksi.seksi_foto != null)
                    {
                        if (seksi.seksi_foto.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(seksi.seksi_foto.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                seksi.seksi_foto.SaveAs(path);

                                t_seksi.seksi_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                                return View(seksi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2MB");
                            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                            return View(seksi);
                        }
                    }

                    if (seksi.seksi_desc_foto != null)
                    {
                        if (seksi.seksi_desc_foto.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(seksi.seksi_desc_foto.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                seksi.seksi_desc_foto.SaveAs(path);

                                t_seksi.seksi_desc_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                                return View(seksi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2MB");
                            ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                            return View(seksi);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.bidang_id = new SelectList(db.t_bidang.ToList(), "bidang_id", "bidang_title");
                return View(seksi);
            }
        }

        //
        // GET: /admin/seksi/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_seksi t_seksi = db.t_seksi.Find(id);
            db.t_seksi.Remove(t_seksi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/seksi/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_seksi t_seksi = db.t_seksi.Find(id);
            db.t_seksi.Remove(t_seksi);
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