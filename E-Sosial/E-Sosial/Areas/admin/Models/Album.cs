using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Album
    {
        public int album_id { get; set; }
        public string album_title { get; set; }
        public string album_desc { get; set; }
        public System.DateTime album_date { get; set; }
        public string user { get; set; }
    }
}