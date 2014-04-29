using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace E_Sosial.Areas.admin.Controllers
{
    public class contentController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/content/

        [Authorize(Roles="super_admin,admin")]
        public ActionResult Index()
        {
            var user = (from table in db.users select table).Count();
            ViewBag.user = user;

            var berita = (from table in db.t_news select table).Count();
            ViewBag.berita = berita;

            var donatur = (from table in db.t_donatur select table).Count();
            ViewBag.donatur = donatur;

            var download = (from table in db.t_file where table.mime_type == ".pdf" select table).Count();
            ViewBag.download = download;

            string nama = HttpContext.User.Identity.Name;
            var userNama = (from table in db.users where (table.username == nama) select table.nama).FirstOrDefault();
            ViewBag.UserName = userNama;

            //Visitor
            ViewBag.today = (from table in db.t_visitor where table.date.Day == DateTime.Now.Day select table).Count();

            ViewBag.month = (from table in db.t_visitor where table.date.Month == DateTime.Now.Month select table).Count();

            ViewBag.year = (from table in db.t_visitor where table.date.Year == DateTime.Now.Year select table).Count();

            //Hit
            ViewBag.todayHit = (from table in db.t_visitor where table.date.Day == DateTime.Now.Day select table.hits).AsEnumerable().Sum();

            ViewBag.monthHit = (from table in db.t_visitor where table.date.Month == DateTime.Now.Month select table.hits).AsEnumerable().Sum();

            ViewBag.yearHit = (from table in db.t_visitor where table.date.Year == DateTime.Now.Year select table.hits).AsEnumerable().Sum();

            return View(db.t_kesejahteraan.ToList());
        }

        //
        // GET: /admin/content/Details/5

        public ActionResult Details(int id = 0)
        {
            user user = db.users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // GET: /admin/content/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/content/Create

        [HttpPost]
        public ActionResult Create(user user)
        {
            if (ModelState.IsValid)
            {
                db.users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(user);
        }

        //
        // GET: /admin/content/Edit/5

        public ActionResult Edit(int id = 0)
        {
            user user = db.users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // POST: /admin/content/Edit/5

        [HttpPost]
        public ActionResult Edit(user user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user);
        }

        //
        // GET: /admin/content/Delete/5

        public ActionResult Delete(int id = 0)
        {
            user user = db.users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // POST: /admin/content/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            user user = db.users.Find(id);
            db.users.Remove(user);
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