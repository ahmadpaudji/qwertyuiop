using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace E_Sosial.Areas.admin.Models
{
    public class FotoAdmin
    {
        public int user_id { get; set; }
        public HttpPostedFileBase foto { get; set; }
    }
}