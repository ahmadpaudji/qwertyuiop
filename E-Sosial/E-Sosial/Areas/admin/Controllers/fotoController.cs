﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace E_Sosial.Areas.admin.Controllers
{
    public class fotoController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/Foto/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var foto = from table in db.t_dokumentasi
                       where table.dokumentasi_type == "foto"
                       join table2 in db.t_album
                       on table.album_id equals table2.album_id
                       select new admin.Models.Foto
                       {
                           album = table2.album_title,
                           dokumentasi_date = table.dokumentasi_date,
                           dokumentasi_id = table.dokumentasi_id,
                           dokumentasi_title = table.dokumentasi_title,
                           dokumentasi_type = table.dokumentasi_type,
                           dokumentasi_path = table.dokumentasi_path
                       };
            return View(foto.ToList());
        }

        //
        // GET: /admin/Foto/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_dokumentasi t_dokumentasi = db.t_dokumentasi.Find(id);
            if (t_dokumentasi == null)
            {
                return HttpNotFound();
            }
            return View(t_dokumentasi);
        }

        //
        // GET: /admin/Foto/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
            return View();
        }

        //
        // POST: /admin/Foto/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.FotoCreate t_dokumentasi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_dokumentasi.Create();

                    create.album_id = t_dokumentasi.album_id;
                    create.dokumentasi_date = DateTime.Now;
                    create.dokumentasi_title = t_dokumentasi.dokumentasi_title;
                    create.dokumentasi_type = "foto";

                    if (t_dokumentasi.dokumentasi_path != null)
                    {
                        if (t_dokumentasi.dokumentasi_path.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_dokumentasi.dokumentasi_path.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_dokumentasi.dokumentasi_path.SaveAs(path);

                                create.dokumentasi_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (Jpg)");
                                ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                                return View(t_dokumentasi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                            return View(t_dokumentasi);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Foto harus diisi");
                        ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                        return View(t_dokumentasi);
                    }

                    db.t_dokumentasi.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                return View(t_dokumentasi);
            }
        }

        //
        // GET: /admin/Foto/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            var dokumentasi = (from table in db.t_dokumentasi
                               where table.dokumentasi_id == id && table.dokumentasi_type == "foto"
                               select new admin.Models.FotoCreate
                               {
                                   album_id = table.album_id,
                                   dokumentasi_date = table.dokumentasi_date,
                                   dokumentasi_id = table.dokumentasi_id,
                                   dokumentasi_title = table.dokumentasi_title,
                                   dokumentasi_type = table.dokumentasi_type
                               }).FirstOrDefault();
            ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
            if (dokumentasi == null)
            {
                return HttpNotFound();
            }
            return View(dokumentasi);
        }

        //
        // POST: /admin/Foto/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.FotoCreate dokumentasi)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_dokumentasi t_dokumentasi = db.t_dokumentasi.Find(id);

                    t_dokumentasi.album_id = dokumentasi.album_id;
                    t_dokumentasi.dokumentasi_date = DateTime.Now;
                    t_dokumentasi.dokumentasi_title = dokumentasi.dokumentasi_title;
                    
                    if (dokumentasi.dokumentasi_path != null)
                    {
                        if (dokumentasi.dokumentasi_path.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(dokumentasi.dokumentasi_path.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                dokumentasi.dokumentasi_path.SaveAs(path);

                                t_dokumentasi.dokumentasi_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (Jpg)");
                                ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                                return View(dokumentasi);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                            return View(dokumentasi);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.album_id = new SelectList(db.t_album.ToList(), "album_id", "album_title");
                return View(dokumentasi);
            }
        }

        //
        // GET: /admin/Foto/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_dokumentasi t_dokumentasi = db.t_dokumentasi.Find(id);
            db.t_dokumentasi.Remove(t_dokumentasi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/Foto/Delete/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_dokumentasi t_dokumentasi = db.t_dokumentasi.Find(id);
            db.t_dokumentasi.Remove(t_dokumentasi);
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