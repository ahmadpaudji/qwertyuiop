using System;
using System.Collections.Generic;
using System.IO;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class bencanaController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/bencana/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var bencana = from table in db.t_report
                          join table2 in db.t_wilayah
                          on table.wil_id equals table2.wil_id
                          select new Models.Bencana
                          {
                              bencanaId = table.report_id,
                              pelapor = table.report_author,
                              wilayah = table2.wil_name,
                              tanggal = table.report_time
                          };
            return View(bencana.ToList());
        }

        //
        // GET: /admin/bencana/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(long id = 0)
        {
            t_report t_report = db.t_report.Find(id);
            var wilayah = (from table in db.t_report
                           where table.report_id == id
                           join table2 in db.t_wilayah
                           on table.wil_id equals table2.wil_id
                           select table2.wil_name).FirstOrDefault();
            ViewBag.wilayah = wilayah;
            var gambar = (from table in db.t_file where table.file_parent == id && table.file_category == "Bencana" select table.file_url).FirstOrDefault();
            ViewBag.gambar = gambar;
            if (t_report == null)
            {
                return HttpNotFound();
            }
            return View(t_report);
        }

        //
        // GET: /admin/bencana/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
            return View();
        }

        //
        // POST: /admin/bencana/Create

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.BencanaCreate t_report)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var valid = 0;
                    var create = db.t_report.Create();
                    var createFile = db.t_file.Create();

                    create.report_author = t_report.report_author;
                    create.phone = t_report.phone;
                    create.address = t_report.address;
                    create.wil_id = t_report.wil_id;
                    create.report_content = t_report.report_content;
                    create.report_time = DateTime.Now;

                    if (t_report.gambar != null)
                    {
                        if (t_report.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(t_report.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                t_report.gambar.SaveAs(path);

                                createFile.file_category = "Bencana";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();
                                valid = 1;
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                                return View(t_report);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                            return View(t_report);
                        }
                    }

                    db.t_report.Add(create);
                    db.SaveChanges();

                    if (valid == 1)
                    {
                        createFile.file_parent = (int)(from table in db.t_report select table.report_id).Max();
                        db.t_file.Add(createFile);
                        db.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                return View(t_report);
            }
        }

        //
        // GET: /admin/bencana/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(long id = 0)
        {
            var id_file = (from table in db.t_file where table.file_parent == id && table.file_category == "Bencana" select table.file_id).FirstOrDefault();
            t_file tfile = db.t_file.Find(id_file);

            if (tfile != null)
            {
                var bencana = (from table in db.t_report
                               join table2 in db.t_file
                               on table.report_id equals table2.file_parent
                               where table.report_id == id && table2.file_category == "Bencana"
                               select new admin.Models.BencanaCreate
                               {
                                   report_id = table.report_id,
                                   report_author = table.report_author,
                                   report_content = table.report_content,
                                   report_time = table.report_time,
                                   address = table.address,
                                   phone = table.phone,
                                   wil_id = table.wil_id

                               }).FirstOrDefault();

                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                if (bencana == null)
                {
                    return HttpNotFound();
                }

                return View(bencana);
            }
            else
            {
                var bencana = (from table in db.t_report
                               where table.report_id == id
                               select new admin.Models.BencanaCreate
                               {
                                   report_id = table.report_id,
                                   report_author = table.report_author,
                                   report_content = table.report_content,
                                   report_time = table.report_time,
                                   address = table.address,
                                   phone = table.phone,
                                   wil_id = table.wil_id

                               }).FirstOrDefault();

                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                if (bencana == null)
                {
                    return HttpNotFound();
                }

                return View(bencana);
            }
        }

        //
        // POST: /admin/bencana/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.BencanaCreate model)
        {
            if (ModelState.IsValid)
            {
                var id_file = (from table in db.t_file where table.file_parent == id && table.file_category == "Bencana" select table.file_id).FirstOrDefault();
                t_file tfile = db.t_file.Find(id_file);
                t_report report = db.t_report.Find(id);

                using (var bencana = new db_esosEntities())
                {
                    report.report_author = model.report_author;
                    report.phone = model.phone;
                    report.address= model.address;
                    report.report_content = model.report_content;
                    report.report_time = DateTime.Now;
                    report.wil_id = model.wil_id;

                    if (model.gambar != null)
                    {
                        if (model.gambar.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(model.gambar.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                model.gambar.SaveAs(path);

                                var createFile = db.t_file.Create();

                                createFile.file_category = "Bencana";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_parent = id;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                                db.t_file.Add(createFile);
                                db.SaveChanges();

                                if (tfile != null)
                                {
                                    db.t_file.Remove(tfile);
                                    db.SaveChanges();
                                }
                            }
                            else
                            {
                                ModelState.AddModelError("", "Gambar harus berformat (.jpg)");
                                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                                return View(model);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran gambar tidak boleh lebih dari 2 MB");
                            ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                            return View(model);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            else
            {
                ViewBag.wilayah = new SelectList((from table in db.t_wilayah where table.wil_type == "Kelurahan" select table).ToList(), "wil_id", "wil_name");
                return View(model);
            }
        }

        //
        // GET: /admin/bencana/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(long id = 0)
        {
            t_report t_report = db.t_report.Find(id);
            db.t_report.Remove(t_report);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/bencana/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(long id)
        {
            t_report t_report = db.t_report.Find(id);
            db.t_report.Remove(t_report);
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