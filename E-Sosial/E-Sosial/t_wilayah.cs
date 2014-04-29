//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Sosial
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;
    
    public partial class t_wilayah
    {
        [Key]
        public long wil_id { get; set; }
        public long parent_id { get; set; }
        [Required(ErrorMessage="Nama wilayah harus diisi")]
        public string wil_name { get; set; }
        public string wil_type { get; set; }
        [Required(ErrorMessage="Alamat harus diisi")]
        public string wil_address { get; set; }
        [Required(ErrorMessage="Telepon harus diisi")]
        [RegularExpression("^[0-9]{6,12}$", ErrorMessage = "No. telepon salah harus berupa 6-12 angka")]
        public string wil_phone { get; set; }
        [AllowHtml]
        public string geo_location { get; set; }
        [EmailAddress(ErrorMessage="Format E-Mail contoh@contoh.com")]
        public string wil_email { get; set; }
        [Url(ErrorMessage = "Alamat Url harus benar. Contoh : http://www.contoh.com")]
        public string web_url { get; set; }
    }
}