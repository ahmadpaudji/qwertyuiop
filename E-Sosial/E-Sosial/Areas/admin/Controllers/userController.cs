using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.IO;

namespace E_Sosial.Areas.admin.Controllers
{
    public class userController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/user/

        [Authorize(Roles="super_admin")]
        public ActionResult Index()
        {
            return View(db.users.Where(u=>u.username != User.Identity.Name).ToList());
        }

        //
        // GET: /admin/user/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details()
        {
            var id_user = db.users.FirstOrDefault(idUser => idUser.username == User.Identity.Name).id_user;
            var foto = (from table in db.t_file where table.user_id == id_user && table.file_category == "FotoUser" select table.file_url).FirstOrDefault();
            if (foto != null)
            {
                ViewBag.fotoUser = foto;
            }
            else
            {
                ViewBag.fotoUser = "~/Content/Image/nofoto.jpg";
            }
            user user = db.users.Find(id_user);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // GET: /admin/user/Create

        [Authorize(Roles = "super_admin")]
        public ActionResult Create()
        {
            return RedirectToAction("Registration","admin");
        }

        //
        // POST: /admin/user/Create

        [Authorize(Roles = "super_admin")]
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
        // GET: /admin/user/EditFoto/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult EditFoto(int id)
        {
            var identifikasi = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;
            var foto = (from table in db.t_file
                        where table.user_id == id
                        select new admin.Models.FotoAdmin
                        {
                            user_id = (int)table.user_id
                        }).FirstOrDefault();

            return View(foto);
        }

        //
        // POST: /admin/user/EditFoto/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult EditFoto(int id,admin.Models.FotoAdmin fotoAdmin)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var ada = (from table in db.t_file where table.user_id == id && table.file_category == "FotoUser" select table.file_id).FirstOrDefault();
                    ViewBag.file = ada;

                    if (fotoAdmin.foto != null)
                    {
                        if (fotoAdmin.foto.ContentLength < 2048000)
                        {
                            var fileName = Path.GetFileName(fotoAdmin.foto.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".jpg")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                                fotoAdmin.foto.SaveAs(path);

                                var createFile = db.t_file.Create();

                                createFile.file_category = "FotoUser";
                                createFile.file_location = path;
                                createFile.file_name = fileName;
                                createFile.file_title = fileName;
                                createFile.file_url = "~/Content/Image/" + fileName;
                                createFile.mime_type = ex;
                                createFile.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                                db.t_file.Add(createFile);
                                db.SaveChanges();

                                if (ViewBag.file != 0)
                                {
                                    var hapusFoto = db.t_file.Find(ada);
                                    db.t_file.Remove(hapusFoto);
                                    db.SaveChanges();
                                }

                                return RedirectToAction("Details");
                            }
                            else
                            {
                                ModelState.AddModelError("", "Foto harus berformat (.jpg)");
                                return View(fotoAdmin);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran foto tidak boleh lebih dari 2 MB");
                            return View(fotoAdmin);
                        }
                    }
                }
            }
            return View(fotoAdmin);
        }

        //
        // GET: /admin/user/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            var identifikasi = db.users.FirstOrDefault(u => u.username == User.Identity.Name).id_user;
            if (id == identifikasi)
            {
                var user = (from table in db.users
                            where table.id_user == id
                            join table2 in db.detail_roles
                            on table.id_user equals table2.id_user
                            join table3 in db.roles
                            on table2.id_roles equals table3.id_roles
                            select new admin.Models.adminModel
                            {
                                username = table.username,
                                password = null,
                                nama = table.nama,
                                alamat = table.alamat,
                                email = table.email,
                                hp = table.hp,
                                id_roles = table2.id_roles.Value
                            }).FirstOrDefault();
                ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                if (user == null)
                {
                    return HttpNotFound();
                }
                return View(user);
            }
            else
            {
                return RedirectToAction("Details");
            }
        }

        //
        // POST: /admin/user/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,Models.adminModel admin)
        {
            if (ModelState.IsValid)
            {
                if (admin.password == admin.retype_password)
                {
                    var userUbah = db.users.FirstOrDefault(u => u.username == admin.username);
                    if (userUbah == null)
                    {
                        user user = db.users.Find(id);
                        using (db)
                        {
                            var crypto = new SimpleCrypto.PBKDF2();
                            var enkripPassword = crypto.Compute(admin.password);

                            user.username = admin.username;
                            user.user_password = enkripPassword;
                            user.user_passwordsalt = crypto.Salt;
                            user.nama = admin.nama;
                            user.hp = admin.hp;
                            user.email = admin.email;
                            user.alamat = admin.alamat;
                            user.tanggal = DateTime.Now;

                            db.SaveChanges();

                            FormsAuthentication.SetAuthCookie(admin.username, false);
                            return RedirectToAction("Details");
                        }
                    }
                    else
                    {
                        ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                        ViewBag.errorUsername = 'y';
                        return View(admin);
                    }
                }
                else
                {
                    ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                    ViewBag.errorPassword = 'y';
                    return View(admin);
                }
            }
            else
            {
                ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                ViewBag.error = 'y';
                return View(admin);
            }
        }


        //
        // GET: /admin/user/Edit/5

        [Authorize(Roles = "super_admin")]
        public ActionResult EditUser(int id = 0)
        {
            //user user = db.users.Find(id);
            var user = (from table in db.users
                        where table.id_user == id
                        join table2 in db.detail_roles
                        on table.id_user equals table2.id_user
                        join table3 in db.roles
                        on table2.id_roles equals table3.id_roles
                        select new admin.Models.adminModel
                        {
                            username = table.username,
                            password = null,
                            nama = table.nama,
                            alamat = table.alamat,
                            email = table.email,
                            hp = table.hp,
                            id_roles = table2.id_roles.Value
                        }).FirstOrDefault();
            ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        //
        // POST: /admin/user/Edit/5

        [Authorize(Roles = "super_admin")]
        [HttpPost]
        public ActionResult EditUser(int id, Models.adminModel admin)
        {
            if (ModelState.IsValid)
            {
                if (admin.password == admin.retype_password)
                {
                    var userUbah = db.users.FirstOrDefault(u => u.username == admin.username);
                    var idRole = db.detail_roles.FirstOrDefault(u => u.id_user == id).id_detail_roles;
                    detail_roles detail_roles = db.detail_roles.Find(idRole);
                    if (userUbah == null)
                    {
                        user user = db.users.Find(id);
                        using (db)
                        {
                            var crypto = new SimpleCrypto.PBKDF2();
                            var enkripPassword = crypto.Compute(admin.password);

                            user.username = admin.username;
                            user.user_password = enkripPassword;
                            user.user_passwordsalt = crypto.Salt;
                            user.nama = admin.nama;
                            user.hp = admin.hp;
                            user.email = admin.email;
                            user.alamat = admin.alamat;
                            user.tanggal = DateTime.Now;

                            detail_roles.id_roles = id;
                            detail_roles.id_roles = admin.id_roles;

                            db.SaveChanges();

                            return RedirectToAction("Index", "user");
                        }
                    }
                    else
                    {
                        ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                        ViewBag.errorUsername = 'y';
                        return View(admin);
                    }
                }
                else
                {
                    ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                    ViewBag.errorPassword = 'y';
                    return View(admin);
                }
            }
            else
            {
                ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                ViewBag.error = 'y';
                return View(admin);
            }
        }

        //
        // GET: /admin/user/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            user user = db.users.Find(id);
            db.users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/user/Delete/5

        [Authorize(Roles = "super_admin")]
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