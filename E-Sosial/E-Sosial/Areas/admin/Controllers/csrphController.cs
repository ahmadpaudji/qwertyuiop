using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class csrphController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/csrph/

        [Authorize(Roles="super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_csr_ph.ToList());
        }

        //
        // GET: /admin/csrph/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_csr_ph t_csr_ph = db.t_csr_ph.Find(id);
            if (t_csr_ph == null)
            {
                return HttpNotFound();
            }
            return View(t_csr_ph);
        }

        //
        // GET: /admin/csrph/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/csrph/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_csr_ph t_csr_ph)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_csr_ph.Create();

                    create.csr_ph_name = t_csr_ph.csr_ph_name;
                    create.csr_ph_address = t_csr_ph.csr_ph_address;
                    create.csr_ph_activity = t_csr_ph.csr_ph_activity;
                    create.csr_ph_date = DateTime.Now;

                    db.t_csr_ph.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                return View(t_csr_ph);
            }
        }

        //
        // GET: /admin/csrph/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_csr_ph t_csr_ph = db.t_csr_ph.Find(id);
            if (t_csr_ph == null)
            {
                return HttpNotFound();
            }
            return View(t_csr_ph);
        }

        //
        // POST: /admin/csrph/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,t_csr_ph t_csr_ph)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var csr = db.t_csr_ph.Find(id);

                    csr.csr_ph_name = t_csr_ph.csr_ph_name;
                    csr.csr_ph_address = t_csr_ph.csr_ph_address;
                    csr.csr_ph_activity = t_csr_ph.csr_ph_activity;

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                return View(t_csr_ph);
            }
        }

        //
        // GET: /admin/csrph/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_csr_ph t_csr_ph = db.t_csr_ph.Find(id);
            db.t_csr_ph.Remove(t_csr_ph);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/csrph/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_csr_ph t_csr_ph = db.t_csr_ph.Find(id);
            db.t_csr_ph.Remove(t_csr_ph);
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