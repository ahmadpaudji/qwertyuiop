using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class kegiatanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/kegiatan/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_kegiatan.ToList());
        }

        //
        // GET: /admin/kegiatan/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_kegiatan t_kegiatan = db.t_kegiatan.Find(id);
            var idUser = (from table in db.t_kegiatan where table.kegiatan_id == id select table.user_id).FirstOrDefault();
            var idWil = (from table in db.t_kegiatan where table.kegiatan_id == id select table.wilayah_id).FirstOrDefault();
            ViewBag.user = (from table in db.users where table.id_user == idUser select table.nama).FirstOrDefault();
            ViewBag.wilayah = (from table in db.t_wilayah where table.wil_id == idWil select table.wil_name).FirstOrDefault();
            if (t_kegiatan == null)
            {
                return HttpNotFound();
            }
            return View(t_kegiatan);
        }

        //
        // GET: /admin/kegiatan/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.wilayah_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
            return View();
        }

        //
        // POST: /admin/kegiatan/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_kegiatan t_kegiatan)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_kegiatan.Create();

                    create.user_id = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;
                    create.wilayah_id = t_kegiatan.wilayah_id;
                    create.kegiatan_nama = t_kegiatan.kegiatan_nama;
                    create.kegiatan_deskripsi = t_kegiatan.kegiatan_deskripsi;
                    create.kegiatan_tgl_update = DateTime.Now;
                    create.kegiatan_tgl_acara = t_kegiatan.kegiatan_tgl_acara;

                    db.t_kegiatan.Add(create);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.wilayah_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
                return View(t_kegiatan);
            }
        }

        //
        // GET: /admin/kegiatan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_kegiatan t_kegiatan = db.t_kegiatan.Find(id);
            ViewBag.wilayah_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
            if (t_kegiatan == null)
            {
                return HttpNotFound();
            }
            return View(t_kegiatan);
        }

        //
        // POST: /admin/kegiatan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,t_kegiatan kegiatan)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_kegiatan t_kegiatan = db.t_kegiatan.Find(id);

                    t_kegiatan.user_id = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;
                    t_kegiatan.wilayah_id = kegiatan.wilayah_id;
                    t_kegiatan.kegiatan_nama = kegiatan.kegiatan_nama;
                    t_kegiatan.kegiatan_deskripsi = kegiatan.kegiatan_deskripsi;
                    t_kegiatan.kegiatan_tgl_update = DateTime.Now;
                    t_kegiatan.kegiatan_tgl_acara = kegiatan.kegiatan_tgl_acara;

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.wilayah_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
                return View(kegiatan);
            }
        }

        //
        // GET: /admin/kegiatan/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_kegiatan t_kegiatan = db.t_kegiatan.Find(id);
            db.t_kegiatan.Remove(t_kegiatan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/kegiatan/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_kegiatan t_kegiatan = db.t_kegiatan.Find(id);
            db.t_kegiatan.Remove(t_kegiatan);
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