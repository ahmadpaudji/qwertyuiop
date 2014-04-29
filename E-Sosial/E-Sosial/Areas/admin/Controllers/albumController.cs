using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class albumController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/album/

        public ActionResult Index()
        {
            var album = (from table in db.t_album
                         join table2 in db.users
                         on table.user_id equals table2.id_user
                         select new admin.Models.Album
                         {
                             album_id = table.album_id,
                             album_date = table.album_date,
                             album_desc = table.album_desc,
                             album_title = table.album_title,
                             user = table2.nama
                         });
            return View(album.ToList());
        }

        //
        // GET: /admin/album/Details/5

        public ActionResult Details(int id = 0)
        {
            t_album t_album = db.t_album.Find(id);
            var idUser = db.t_album.FirstOrDefault(i => i.album_id == id).user_id;
            ViewBag.userNama = db.users.FirstOrDefault(u => u.id_user == idUser).nama;
            if (t_album == null)
            {
                return HttpNotFound();
            }
            return View(t_album);
        }

        //
        // GET: /admin/album/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/album/Create

        [HttpPost]
        public ActionResult Create(t_album t_album)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_album.Create();

                    create.album_title = t_album.album_title;
                    create.album_date = DateTime.Now;
                    create.album_desc = t_album.album_desc;
                    create.user_id = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;
                    
                    db.t_album.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }

            return View(t_album);
        }

        //
        // GET: /admin/album/Edit/5

        public ActionResult Edit(int id = 0)
        {
            t_album t_album = db.t_album.Find(id);
            if (t_album == null)
            {
                return HttpNotFound();
            }
            return View(t_album);
        }

        //
        // POST: /admin/album/Edit/5

        [HttpPost]
        public ActionResult Edit(int id,t_album t_album)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_album album = db.t_album.Find(id);

                    album.album_title = t_album.album_title;
                    album.album_date = DateTime.Now;
                    album.album_desc = t_album.album_desc;
                    album.user_id = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_album);
        }

        //
        // GET: /admin/album/Delete/5

        public ActionResult Delete(int id = 0)
        {
            t_album t_album = db.t_album.Find(id);
            db.t_album.Remove(t_album);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/album/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_album t_album = db.t_album.Find(id);
            db.t_album.Remove(t_album);
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