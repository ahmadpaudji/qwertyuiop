using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class pmksController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/pmks/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var pmks = from table in db.t_kesejahteraan
                    join table2 in db.t_satuan
                    on table.ks_satuan equals table2.id_satuan
                    select new Models.Kesejahteraan
                    {
                        id = table.ks_id,
                        nama = table.ks_name,
                        jumlah = table.ks_jumlah,
                        tipe = table.ks_type,
                        satuan = table2.satuan,
                        year = table.ks_year.Value
                    };
            return View(pmks.ToList());
        }

        //
        // GET: /admin/pmks/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_kesejahteraan t_kesejahteraan = db.t_kesejahteraan.Find(id);
            if (t_kesejahteraan == null)
            {
                return HttpNotFound();
            }
            return View(t_kesejahteraan);
        }

        //
        // GET: /admin/pmks/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.satuan = new SelectList(db.t_satuan.ToList(), "id_satuan", "satuan");
            return View();
        }

        //
        // POST: /admin/pmks/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_kesejahteraan t_kesejahteraan)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_kesejahteraan.Create();

                    create.ks_name = t_kesejahteraan.ks_name;
                    create.ks_jumlah = t_kesejahteraan.ks_jumlah;
                    create.ks_type = "PMKS";
                    create.ks_satuan = t_kesejahteraan.ks_satuan;
                    create.ks_date = DateTime.Now;
                    create.ks_year = t_kesejahteraan.ks_year;

                    db.t_kesejahteraan.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.satuan = new SelectList(db.t_satuan.ToList(), "id_satuan", "satuan");
                return View(t_kesejahteraan);
            }
        }

        //
        // GET: /admin/pmks/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_kesejahteraan t_kesejahteraan = db.t_kesejahteraan.Find(id);
            ViewBag.satuan = new SelectList(db.t_satuan.ToList(), "id_satuan", "satuan");
            if (t_kesejahteraan == null)
            {
                return HttpNotFound();
            }
            return View(t_kesejahteraan);
        }

        //
        // POST: /admin/pmks/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(t_kesejahteraan t_kesejahteraan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_kesejahteraan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.satuan = new SelectList(db.t_satuan.ToList(), "id_satuan", "satuan");
                return View(t_kesejahteraan);
            }
        }

        //
        // GET: /admin/pmks/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_kesejahteraan t_kesejahteraan = db.t_kesejahteraan.Find(id);
            db.t_kesejahteraan.Remove(t_kesejahteraan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/pmks/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_kesejahteraan t_kesejahteraan = db.t_kesejahteraan.Find(id);
            db.t_kesejahteraan.Remove(t_kesejahteraan);
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