using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class donaturController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/donatur/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var donatur = from table in db.t_donatur
                          join table2 in db.t_report
                          on table.report_id equals table2.report_id
                          join table3 in db.t_wilayah
                          on table2.wil_id equals table3.wil_id
                          select new Models.Donatur
                          {
                              idDonatur = table.donatur_id,
                              nama = table.donatur_name,
                              wilayah = table3.wil_name,
                              donasi = table.donasi,
                              pembayaran = table.pembayaran
                          };
            return View(donatur.ToList());
        }

        //
        // GET: /admin/donatur/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_donatur t_donatur = db.t_donatur.Find(id);
            var reportId = (from table in db.t_donatur where table.donatur_id == id select table.report_id).FirstOrDefault();
            var wilayah = (from table in db.t_report
                           where table.report_id == reportId
                           join table2 in db.t_wilayah
                           on table.wil_id equals table2.wil_id
                           select table2.wil_name).FirstOrDefault();
            ViewBag.wilayah = wilayah;
            if (t_donatur == null)
            {
                return HttpNotFound();
            }
            return View(t_donatur);
        }

        //
        // GET: /admin/donatur/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.bencana = new SelectList(
                (from table in db.t_report 
                join table2 in db.t_wilayah 
                on table.wil_id equals table2.wil_id 
                select new 
                { 
                    table.report_id, 
                    table2.wil_name 
                }).ToList(), "report_id", "wil_name");
            return View();
        }

        //
        // POST: /admin/donatur/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_donatur t_donatur)
        {
            if (ModelState.IsValid)
            {
                db.t_donatur.Add(t_donatur);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.bencana = new SelectList(
                (from table in db.t_report
                join table2 in db.t_wilayah
                on table.wil_id equals table2.wil_id
                select new
                {
                    table.report_id,
                    table2.wil_name
                }).ToList(), "report_id", "wil_name");
                return View(t_donatur);
            }
        }

        //
        // GET: /admin/donatur/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            t_donatur t_donatur = db.t_donatur.Find(id);
            ViewBag.bencana = new SelectList(
                (from table in db.t_report
                join table2 in db.t_wilayah
                on table.wil_id equals table2.wil_id
                select new
                {
                    table.report_id,
                    table2.wil_name
                }).ToList(), "report_id", "wil_name");
            if (t_donatur == null)
            {
                return HttpNotFound();
            }
            return View(t_donatur);
        }

        //
        // POST: /admin/donatur/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(t_donatur t_donatur)
        {
            if (ModelState.IsValid)
            {
                db.Entry(t_donatur).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.bencana = new SelectList(
                (from table in db.t_report
                join table2 in db.t_wilayah
                on table.wil_id equals table2.wil_id
                select new
                {
                    table.report_id,
                    table2.wil_name
                }).ToList(), "report_id", "wil_name");
                return View(t_donatur);
            }
        }

        //
        // GET: /admin/donatur/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_donatur t_donatur = db.t_donatur.Find(id);
            db.t_donatur.Remove(t_donatur);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/donatur/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_donatur t_donatur = db.t_donatur.Find(id);
            db.t_donatur.Remove(t_donatur);
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