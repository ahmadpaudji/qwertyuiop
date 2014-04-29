using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class adminModel
    {
        [Required(ErrorMessage="Username harus diisi.")]
        [StringLength(45,ErrorMessage="Maksimal username 45")]
        public string username { get; set; }

        [Required(ErrorMessage="Password harus diisi.")]
        [DataType(DataType.Password)]
        [StringLength(15, MinimumLength = 6,ErrorMessage="Minimum password 6 dan masksimal 15")]
        public string password { get; set; }

        [Required(ErrorMessage = "Retype password harus diisi.")]
        [DataType(DataType.Password)]
        [StringLength(15, MinimumLength = 6, ErrorMessage = "Minimum password 6 dan masksimal 15")]
        public string retype_password { get; set; }

        [Required(ErrorMessage="Nama harus diisi")]
        [StringLength(47)]
        public string nama { get; set; }

        [Required(ErrorMessage="E-Mail harus diisi")]
        [EmailAddress]
        public string email { get; set; }

        [Required(ErrorMessage="Alamat harus diisi")]
        [StringLength(99)]
        public string alamat { get; set; }

        [Required(ErrorMessage = "No. Hp harus diisi")]
        [RegularExpression("^[0-9]{12}$", ErrorMessage = "No. Hp salah harus 12 dan berupa angka")]
        public string hp { get; set; }

        public int id_roles { get; set; }
    }
}