using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class ProfileController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /Profile/

        public ActionResult Index()
        {
            return RedirectToAction("Index","Beranda");
        }

        public ActionResult visimisi()
        {
            var visi = (from table in db.t_content
                        where table.content_name == "Visi dan Misi" && table.content_type == "Profil"
                        join table2 in db.users
                        on table.user_id equals table2.id_user
                        select new Models.profile
                        {
                            judul = table.content_name,
                            tanggal = table.content_time,
                            user = table2.nama,
                            isi = table.content
                        }).FirstOrDefault();
            return View(visi);
        }

        public ActionResult program()
        {
            var proker = (from table in db.t_content
                          where table.content_name == "Program Kerja" && table.content_type == "Profil"
                        join table2 in db.users
                        on table.user_id equals table2.id_user
                        select new Models.profile
                        {
                            judul = table.content_name,
                            tanggal = table.content_time,
                            user = table2.nama,
                            isi = table.content
                        }).FirstOrDefault();
            return View(proker);
        }

        public ActionResult organisasi()
        {
            var organisasi = (from table in db.t_organisasi
                              select new Models.organisasi 
                              {
                                    gambar = table.t_path,
                                    jabatan = table.t_jabatan,
                                    nama = table.t_nama
                              }).ToList();
            return View(organisasi);
        }
    }
}
