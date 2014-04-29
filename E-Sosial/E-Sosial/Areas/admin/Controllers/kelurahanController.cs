using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class kelurahanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/kelurahan/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
                return View(db.t_wilayah.ToList());
        }

        //
        // GET: /admin/kelurahan/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            var parent = (from table in db.t_wilayah where table.wil_id == id select table.parent_id).FirstOrDefault();
            ViewBag.kecamatan = (from table in db.t_wilayah where table.wil_id == parent select table.wil_name).FirstOrDefault();
            if (t_wilayah == null)
            {
                return HttpNotFound();
            }
            return View(t_wilayah);
        }

        //
        // GET: /admin/kelurahan/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.parent_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
            return View();
        }

        //
        // POST: /admin/kelurahan/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_wilayah t_wilayah)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_wilayah.Create();

                    create.geo_location = t_wilayah.geo_location;
                    create.parent_id = t_wilayah.parent_id;
                    create.web_url = t_wilayah.web_url;
                    create.wil_address = t_wilayah.wil_address;
                    create.wil_name = t_wilayah.wil_name;
                    create.wil_phone = t_wilayah.wil_phone;
                    create.wil_type = "Kelurahan";
                    create.wil_email = t_wilayah.wil_email;

                    db.t_wilayah.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.parent_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
                return View(t_wilayah);
            }
        }

        //
        // GET: /admin/kelurahan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            ViewBag.parent_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
            if (t_wilayah == null)
            {
                return HttpNotFound();
            }
            return View(t_wilayah);
        }

        //
        // POST: /admin/kelurahan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,t_wilayah wilayah)
        {
            if (ModelState.IsValid)
            {
                using (db)
                {
                    t_wilayah t_wilayah = db.t_wilayah.Find(id);

                    t_wilayah.geo_location = wilayah.geo_location;
                    t_wilayah.parent_id = wilayah.parent_id;
                    t_wilayah.web_url = wilayah.web_url;
                    t_wilayah.wil_address = wilayah.wil_address;
                    t_wilayah.wil_name = wilayah.wil_name;
                    t_wilayah.wil_phone = wilayah.wil_phone;
                    t_wilayah.wil_type = "Kelurahan";
                    t_wilayah.wil_email = wilayah.wil_email;

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.parent_id = new SelectList((from table in db.t_wilayah where table.wil_type == "Kecamatan" select table).ToList(), "wil_id", "wil_name");
                return View(wilayah);
            }
        }

        //
        // GET: /admin/kelurahan/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            db.t_wilayah.Remove(t_wilayah);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/kelurahan/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            db.t_wilayah.Remove(t_wilayah);
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