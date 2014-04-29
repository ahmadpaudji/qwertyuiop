using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class satuanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/satuan/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_satuan.ToList());
        }

        //
        // GET: /admin/satuan/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_satuan t_satuan = db.t_satuan.Find(id);
            if (t_satuan == null)
            {
                return HttpNotFound();
            }
            return View(t_satuan);
        }

        //
        // GET: /admin/satuan/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/satuan/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_satuan t_satuan)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_satuan.Create();

                    create.satuan = t_satuan.satuan;
                    create.tanggal = DateTime.Now;

                    db.t_satuan.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(t_satuan);
        }

        //
        // GET: /admin/satuan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_satuan t_satuan = db.t_satuan.Find(id);
            if (t_satuan == null)
            {
                return HttpNotFound();
            }
            return View(t_satuan);
        }

        //
        // POST: /admin/satuan/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(t_satuan t_satuan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_satuan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(t_satuan);
        }

        //
        // GET: /admin/satuan/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_satuan t_satuan = db.t_satuan.Find(id);
            db.t_satuan.Remove(t_satuan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/satuan/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_satuan t_satuan = db.t_satuan.Find(id);
            db.t_satuan.Remove(t_satuan);
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