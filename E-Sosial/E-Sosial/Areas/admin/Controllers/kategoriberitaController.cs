using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class kategoriberitaController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/kategoriberita/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            return View(db.t_news_category.ToList());
        }

        //
        // GET: /admin/kategoriberita/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_news_category t_news_category = db.t_news_category.Find(id);
            if (t_news_category == null)
            {
                return HttpNotFound();
            }
            return View(t_news_category);
        }

        //
        // GET: /admin/kategoriberita/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/kategoriberita/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(t_news_category t_news_category)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_news_category.Create();

                    create.category_date = DateTime.Now;
                    create.category_title = t_news_category.category_title;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    
                    db.t_news_category.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(t_news_category);
        }

        //
        // GET: /admin/kategoriberita/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            t_news_category t_news_category = db.t_news_category.Find(id);
            if (t_news_category == null)
            {
                return HttpNotFound();
            }
            return View(t_news_category);
        }

        //
        // POST: /admin/kategoriberita/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(long id,t_news_category t_news_category)
        {
            if (ModelState.IsValid)
            {
                t_news_category news_category = db.t_news_category.Find(id);
                
                using (db)
                {
                    news_category.category_date = DateTime.Now;
                    news_category.category_title = t_news_category.category_title;
                    news_category.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(t_news_category);
        }

        //
        // GET: /admin/kategoriberita/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_news_category t_news_category = db.t_news_category.Find(id);
            db.t_news_category.Remove(t_news_category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/kategoriberita/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_news_category t_news_category = db.t_news_category.Find(id);
            db.t_news_category.Remove(t_news_category);
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