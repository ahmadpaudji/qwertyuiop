using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class BidangCreate
    {
        [Key]
        public int bidang_id { get; set; }
        public int user_id { get; set; }
        [Required(ErrorMessage="Nama bidang harus diisi")]
        public string bidang_title { get; set; }
        [Required(ErrorMessage="Nama Penanggung jawab bidang harus diisi")]
        public string bidang_name { get; set; }
        public HttpPostedFileBase gambar_pj { get; set; }
        [Required(ErrorMessage="Deskripsi bidang harus diisi")]
        [AllowHtml]
        public string bidang_desc { get; set; }
        public System.DateTime bidang_date { get; set; }
        public HttpPostedFileBase gambar_des { get; set; }
    }
}