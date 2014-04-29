using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Models
{
    public class beranda
    {
        //Berita
        public int id_berita { get; set; }
        public string user { get; set; }
        public System.DateTime date { get; set; }
        public string gambar { get; set; }
        public string konten { get; set; }
        public string judul { get; set; }

        //Bencana
        public int id_bencana { get; set; }
        public string keterangan { get; set; }
        public string wilayah { get; set; }

        //Dokumentasi
        public string gambar_dok { get; set; }
        public string judul_dok { get; set; }
        public string album { get; set; }
    }
}