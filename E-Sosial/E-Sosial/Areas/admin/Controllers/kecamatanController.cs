using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class kecamatanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/kecamatan/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_wilayah.ToList());
        }

        //
        // GET: /admin/kecamatan/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            if (t_wilayah == null)
            {
                return HttpNotFound();
            }
            return View(t_wilayah);
        }

        //
        // GET: /admin/kecamatan/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/kecamatan/Create

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
                    create.parent_id = 0;
                    create.web_url = t_wilayah.web_url;
                    create.wil_address = t_wilayah.wil_address;
                    create.wil_name = t_wilayah.wil_name;
                    create.wil_phone = t_wilayah.wil_phone;
                    create.wil_type = "Kecamatan";
                    create.wil_email = t_wilayah.wil_email;

                    db.t_wilayah.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(t_wilayah);
        }

        //
        // GET: /admin/kecamatan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            if (t_wilayah == null)
            {
                return HttpNotFound();
            }
            return View(t_wilayah);
        }

        //
        // POST: /admin/kecamatan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(t_wilayah t_wilayah)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_wilayah).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(t_wilayah);
        }

        //
        // GET: /admin/kecamatan/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_wilayah t_wilayah = db.t_wilayah.Find(id);
            db.t_wilayah.Remove(t_wilayah);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/kecamatan/Delete/5

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