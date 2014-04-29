using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class relawanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/relawan/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_volunteer.ToList());
        }

        //
        // GET: /admin/relawan/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_volunteer t_volunteer = db.t_volunteer.Find(id);
            var idKeg = (from table in db.t_volunteer where table.vol_id == id select table.kegiatan_id).FirstOrDefault();
            ViewBag.kegiatan = (from table in db.t_kegiatan where table.kegiatan_id == idKeg select table.kegiatan_nama).FirstOrDefault();
            if (t_volunteer == null)
            {
                return HttpNotFound();
            }
            return View(t_volunteer);
        }

        //
        // GET: /admin/relawan/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.kegiatan = new SelectList((from table in db.t_kegiatan select table).ToList(), "kegiatan_id", "kegiatan_nama");
            return View();
        }

        //
        // POST: /admin/relawan/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_volunteer t_volunteer)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_volunteer.Create();

                    create.vol_card_id = t_volunteer.vol_card_id;
                    create.vol_name = t_volunteer.vol_name;
                    create.vol_phone = t_volunteer.vol_phone;
                    create.vol_address = t_volunteer.vol_address;
                    create.vol_occupation = t_volunteer.vol_occupation;
                    create.vol_email = t_volunteer.vol_email;
                    create.kegiatan_id = t_volunteer.kegiatan_id;

                    db.t_volunteer.Add(create);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.kegiatan = new SelectList((from table in db.t_kegiatan select table).ToList(), "kegiatan_id", "kegiatan_nama");
                return View(t_volunteer);
            }
        }

        //
        // GET: /admin/relawan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            t_volunteer t_volunteer = db.t_volunteer.Find(id);
            ViewBag.kegiatan = new SelectList((from table in db.t_kegiatan select table).ToList(), "kegiatan_id", "kegiatan_nama");
            if (t_volunteer == null)
            {
                return HttpNotFound();
            }
            return View(t_volunteer);
        }

        //
        // POST: /admin/relawan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,t_volunteer volunteer)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_volunteer t_volunteer = db.t_volunteer.Find(id);

                    t_volunteer.vol_card_id = volunteer.vol_card_id;
                    t_volunteer.vol_name = volunteer.vol_name;
                    t_volunteer.vol_phone = volunteer.vol_phone;
                    t_volunteer.vol_address = volunteer.vol_address;
                    t_volunteer.vol_occupation = volunteer.vol_occupation;
                    t_volunteer.vol_email = volunteer.vol_email;
                    t_volunteer.kegiatan_id = volunteer.kegiatan_id;

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.kegiatan = new SelectList((from table in db.t_kegiatan select table).ToList(), "kegiatan_id", "kegiatan_nama");
                return View(volunteer);
            }
        }

        //
        // GET: /admin/relawan/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_volunteer t_volunteer = db.t_volunteer.Find(id);
            db.t_volunteer.Remove(t_volunteer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/relawan/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_volunteer t_volunteer = db.t_volunteer.Find(id);
            db.t_volunteer.Remove(t_volunteer);
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