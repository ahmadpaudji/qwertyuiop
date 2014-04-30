using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Models
{
    public class berita
    {
        public int id { get; set; }
        public string judul { get; set; }
        public string isi { get; set; }
        public string gambar { get; set; }
        public System.DateTime tanggal { get; set; }
        public string user { get; set; }
    }
}