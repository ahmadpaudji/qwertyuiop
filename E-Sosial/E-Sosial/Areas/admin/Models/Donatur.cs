using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Donatur
    {
        public long idDonatur { get; set; }
        public string nama { get; set; }
        public string wilayah { get; set; }
        public long donasi { get; set; }
        public string pembayaran { get; set; }
    }
}