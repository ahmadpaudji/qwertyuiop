using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class BeritaCreate
    {

        [Key]
        public int news_id { get; set; }
        public int user_id { get; set; }
        public System.DateTime news_date { get; set; }
        [Required(ErrorMessage = "Judul harus diisi")]
        public string news_title { get; set; }
        [Required(ErrorMessage = "Konten harus diisi")]
        [AllowHtml]
        public string news_content { get; set; }
        [Required(ErrorMessage = "Status harus diisi")]
        public string news_status { get; set; }
        public System.DateTime news_modified { get; set; }
        public int news_parent { get; set; }
        [Required(ErrorMessage = "Tipe harus diisi")]
        public string news_type { get; set; }
        
        public string news_url { get; set; }
        [Required(ErrorMessage = "Kategori harus diisi")]
        public int news_category { get; set; }

        public HttpPostedFileBase gambar { get; set; }
    }
}