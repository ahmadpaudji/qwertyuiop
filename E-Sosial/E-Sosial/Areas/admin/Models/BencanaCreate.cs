using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class BencanaCreate
    {
        [Key]
        public long report_id { get; set; }
        [Required(ErrorMessage = "Pelapor harus diisi")]
        public string report_author { get; set; }
        public long wil_id { get; set; }
        [Required(ErrorMessage = "Alamat pelapor harus diisi")]
        public string address { get; set; }
        [Required(ErrorMessage = "Telepon pelapor harus diisi")]
        [RegularExpression("^[0-9]{6,12}$", ErrorMessage = "No. telepon salah harus berupa 6-12 angka")]
        public string phone { get; set; }
        [Required(ErrorMessage = "Konten bencana harus diisi")]
        [AllowHtml]
        public string report_content { get; set; }
        public System.DateTime report_time { get; set; }

        public HttpPostedFileBase gambar { get; set; }
    }
}