using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class bidangController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/bidang/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var bidang = from table in db.t_bidang
                         join table2 in db.users
                         on table.user_id equals table2.id_user
                         select new admin.Models.Bidang
                         {
                             bidang_id = table.bidang_id,
                             bidang_date = table.bidang_date,
                             bidang_name = table.bidang_name,
                             bidang_title = table.bidang_title,
                             user = table2.nama
                         };
            return View(bidang.ToList());
        }

        //
        // GET: /admin/bidang/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_bidang t_bidang = db.t_bidang.Find(id);
            var userID = db.t_bidang.FirstOrDefault(i => i.bidang_id == id).user_id;
            ViewBag.userNama = db.users.FirstOrDefault(u => u.id_user == userID).nama;
            if (t_bidang == null)
            {
                return HttpNotFound();
            }
            return View(t_bidang);
        }

        //
        // GET: /admin/bidang/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/bidang/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.BidangCreate t_bidang)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_bidang.Create();

                    create.bidang_date = DateTime.Now;
                    create.bidang_desc = t_bidang.bidang_desc;
                    create.bidang_name = t_bidang.bidang_name;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    create.bidang_title = t_bidang.bidang_title;

                    if (t_bidang.gambar_pj != null)
                    {
                        if (t_bidang.gambar_pj.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_bidang.gambar_pj.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_bidang.gambar_pj.SaveAs(path);

                                create.bidang_person_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                return View(t_bidang);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            return View(t_bidang);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Foto harus diisi");
                        return View(t_bidang);
                    }

                    if (t_bidang.gambar_des != null)
                    {
                        if (t_bidang.gambar_des.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_bidang.gambar_des.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_bidang.gambar_des.SaveAs(path);

                                create.bidang_desc_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                return View(t_bidang);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            return View(t_bidang);
                        }
                    }
                    else
                    {
                        create.bidang_desc_foto = "Kosong";
                    }

                    db.t_bidang.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_bidang);
        }

        //
        // GET: /admin/bidang/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_bidang t_bidang = db.t_bidang.Find(id);
            var bidang = (from table in db.t_bidang
                         where table.bidang_id == id
                         select new admin.Models.BidangUpdate
                         {
                             bidang_id = table.bidang_id,
                             bidang_date = table.bidang_date,
                             bidang_desc = table.bidang_desc,
                             bidang_name = table.bidang_name,
                             bidang_title = table.bidang_title,
                             user_id = table.user_id,
                             gambar_des = table.bidang_desc_foto,
                             gambar_pj = table.bidang_person_foto
                         }).FirstOrDefault();
            if (bidang == null)
            {
                return HttpNotFound();
            }
            return View(bidang);
        }

        //
        // POST: /admin/bidang/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.BidangCreate bidang)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_bidang t_bidang = db.t_bidang.Find(id);

                    t_bidang.bidang_date = DateTime.Now;
                    t_bidang.bidang_desc = bidang.bidang_desc;
                    t_bidang.bidang_name = bidang.bidang_name;
                    t_bidang.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                    t_bidang.bidang_title = bidang.bidang_title;

                    if (bidang.gambar_pj != null)
                    {
                        if (bidang.gambar_pj.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(bidang.gambar_pj.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                bidang.gambar_pj.SaveAs(path);

                                t_bidang.bidang_person_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                return View(bidang);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            return View(t_bidang);
                        }
                    }

                    if (bidang.gambar_des != null)
                    {
                        if (bidang.gambar_des.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(bidang.gambar_des.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                bidang.gambar_des.SaveAs(path);

                                t_bidang.bidang_desc_foto = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                return View(bidang);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            return View(bidang);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(bidang);
        }

        //
        // GET: /admin/bidang/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_bidang t_bidang = db.t_bidang.Find(id);
            db.t_bidang.Remove(t_bidang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/bidang/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_bidang t_bidang = db.t_bidang.Find(id);
            db.t_bidang.Remove(t_bidang);
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