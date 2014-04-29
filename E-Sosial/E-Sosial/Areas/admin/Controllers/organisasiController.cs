using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace E_Sosial.Areas.admin.Controllers
{
    public class organisasiController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/organisasi/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_organisasi.ToList());
        }

        //
        // GET: /admin/organisasi/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_organisasi t_organisasi = db.t_organisasi.Find(id);
            if (t_organisasi == null)
            {
                return HttpNotFound();
            }
            return View(t_organisasi);
        }

        //
        // GET: /admin/organisasi/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/organisasi/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.organisasiCreate t_organisasi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_organisasi.Create();

                    create.t_nama = t_organisasi.t_nama;
                    create.t_jabatan = t_organisasi.t_jabatan;

                    if (t_organisasi.t_path != null)
                    {
                        if (t_organisasi.t_path.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_organisasi.t_path.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_organisasi.t_path.SaveAs(path);

                                create.t_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                return View(t_organisasi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            return View(t_organisasi);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Foto harus diisi");
                        return View(t_organisasi);
                    }

                    db.t_organisasi.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_organisasi);
        }

        //
        // GET: /admin/organisasi/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_organisasi t_organisasi = db.t_organisasi.Find(id);
            var organisasi = (from table in db.t_organisasi
                              where table.t_organisasi1 == id
                              select new admin.Models.organisasiCreate
                              {
                                  t_organisasi1 = table.t_organisasi1,
                                  t_nama = table.t_nama,
                                  t_jabatan = table.t_jabatan
                              }).FirstOrDefault();
            if (organisasi == null)
            {
                return HttpNotFound();
            }
            return View(organisasi);
        }

        //
        // POST: /admin/organisasi/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.organisasiCreate organisasi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_organisasi t_organisasi = db.t_organisasi.Find(id);

                    t_organisasi.t_nama = organisasi.t_nama;
                    t_organisasi.t_jabatan = organisasi.t_jabatan;

                    if (organisasi.t_path != null)
                    {
                        if (organisasi.t_path.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(organisasi.t_path.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                organisasi.t_path.SaveAs(path);

                                t_organisasi.t_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                return View(organisasi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            return View(organisasi);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(organisasi);
        }

        //
        // GET: /admin/organisasi/Delete/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Delete(int id = 0)
        {
            t_organisasi t_organisasi = db.t_organisasi.Find(id);
            db.t_organisasi.Remove(t_organisasi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/organisasi/Delete/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_organisasi t_organisasi = db.t_organisasi.Find(id);
            db.t_organisasi.Remove(t_organisasi);
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