using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace E_Sosial.Areas.admin.Controllers
{
    public class csractController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/csract/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var csract = (from table in db.t_csr_activity
                          join table2 in db.users
                          on table.user_id equals table2.id_user
                          join table3 in db.t_csr_ph
                          on table.csr_ph_id equals table3.csr_ph_id
                          select new Models.CSRact
                          {
                              csr_activity_id = table.csr_activity_id,
                              csr_activity_date = table.csr_activity_date,
                              csr_activity_name = table3.csr_ph_activity,
                              csr_name = table3.csr_ph_name,
                              user = table2.nama
                          });
            return View(csract.ToList());
        }

        //
        // GET: /admin/csract/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_csr_activity t_csr_activity = db.t_csr_activity.Find(id);
            var idAct = (from table in db.t_csr_activity where table.csr_activity_id == id select table).FirstOrDefault();
            ViewBag.user = (from table in db.users where table.id_user == idAct.user_id select table.nama).FirstOrDefault();
            var csr = (from table in db.t_csr_ph where table.csr_ph_id == idAct.csr_ph_id select table).FirstOrDefault();
            ViewBag.act_name = csr.csr_ph_activity;
            ViewBag.csr_ph = csr.csr_ph_name;
            if (t_csr_activity == null)
            {
                return HttpNotFound();
            }
            return View(t_csr_activity);
        }

        //
        // GET: /admin/csract/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            var list = (from table in db.t_csr_ph
                        select new 
                        {
                            ph_id = table.csr_ph_id,
                            keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                        }).ToList();
            ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
            return View();
        }

        //
        // POST: /admin/csract/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(Models.CSRactCreate t_csr_activity)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_csr_activity.Create();
                    
                    create.csr_ph_id = t_csr_activity.csr_ph_id;
                    create.csr_activity_date = DateTime.Now;
                    create.csr_activity_content = t_csr_activity.csr_activity_content;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                    if (t_csr_activity.gambar != null)
                    {
                        if (t_csr_activity.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_csr_activity.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_csr_activity.gambar.SaveAs(path);

                                create.csr_activity_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                var list = (from table in db.t_csr_ph
                                            select new
                                            {
                                                ph_id = table.csr_ph_id,
                                                keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                                            }).ToList();
                                ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                                return View(t_csr_activity);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            var list = (from table in db.t_csr_ph
                                        select new
                                        {
                                            ph_id = table.csr_ph_id,
                                            keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                                        }).ToList();
                            ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                            return View(t_csr_activity);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "Gambar harus diisi");
                        var list = (from table in db.t_csr_ph
                                    select new
                                    {
                                        ph_id = table.csr_ph_id,
                                        keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                                    }).ToList();
                        ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                        return View(t_csr_activity);
                    }

                    db.t_csr_activity.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                var list = (from table in db.t_csr_ph
                            select new
                            {
                                ph_id = table.csr_ph_id,
                                keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                            }).ToList();
                ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                return View(t_csr_activity);
            }
        }

        //
        // GET: /admin/csract/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            var csr = (from table in db.t_csr_activity
                       where table.csr_activity_id == id
                       select new Models.CSRactCreate
                       {
                           csr_activity_id = table.csr_activity_id,
                           csr_activity_content = table.csr_activity_content,
                           csr_ph_id = table.csr_ph_id
                       }).FirstOrDefault();
            ViewBag.csr_ph = new SelectList((from table in db.t_csr_ph select table).ToList(), "csr_ph_id", "csr_ph_name");
            if (csr == null)
            {
                return HttpNotFound();
            }
            return View(csr);
        }

        //
        // POST: /admin/csract/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,Models.CSRactCreate csr_activity)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_csr_activity t_csr_activity = db.t_csr_activity.Find(id);

                    t_csr_activity.csr_ph_id = csr_activity.csr_ph_id;
                    t_csr_activity.csr_activity_date = DateTime.Now;
                    t_csr_activity.csr_activity_content = csr_activity.csr_activity_content;
                    t_csr_activity.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                    if (csr_activity.gambar != null)
                    {
                        if (csr_activity.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(csr_activity.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                csr_activity.gambar.SaveAs(path);

                                t_csr_activity.csr_activity_path = "~/Content/Image/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                var list = (from table in db.t_csr_ph
                                            select new
                                            {
                                                ph_id = table.csr_ph_id,
                                                keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                                            }).ToList();
                                ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                                return View(csr_activity);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            var list = (from table in db.t_csr_ph
                                        select new
                                        {
                                            ph_id = table.csr_ph_id,
                                            keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                                        }).ToList();
                            ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                            return View(csr_activity);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                var list = (from table in db.t_csr_ph
                            select new
                            {
                                ph_id = table.csr_ph_id,
                                keg = table.csr_ph_name + " (" + table.csr_ph_activity + ")"
                            }).ToList();
                ViewBag.csr_ph = new SelectList(list, "ph_id", "keg");
                return View(csr_activity);
            }
        }

        //
        // GET: /admin/csract/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_csr_activity t_csr_activity = db.t_csr_activity.Find(id);
            db.t_csr_activity.Remove(t_csr_activity);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/csract/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_csr_activity t_csr_activity = db.t_csr_activity.Find(id);
            db.t_csr_activity.Remove(t_csr_activity);
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