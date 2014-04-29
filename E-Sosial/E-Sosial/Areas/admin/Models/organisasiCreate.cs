using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace E_Sosial.Areas.admin.Models
{
    public class organisasiCreate
    {
        [Key]
        public int t_organisasi1 { get; set; }
        [Required(ErrorMessage="Nama harus diisi")]
        public string t_nama { get; set; }
        [Required(ErrorMessage = "Jabatan harus diisi")]
        public string t_jabatan { get; set; }
        public HttpPostedFileBase t_path { get; set; }
    }
}