using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Modul
    {
        public long modulId { get; set; }
        public string tipe { get; set; }
        public string nama { get; set; }
        public string user { get; set; }
        public System.DateTime tanggal { get; set; }
    }
}