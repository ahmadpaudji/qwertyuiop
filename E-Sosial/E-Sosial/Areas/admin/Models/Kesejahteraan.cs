using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Kesejahteraan
    {
        public int id { get; set; }
        public string nama { get; set; }
        public int jumlah { get; set; }
        public string tipe { get; set; }
        public string satuan { get; set; }
        public short year { get; set; }
    }
}