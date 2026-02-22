using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Model
{
    public class CourseMaster
    {
        public int Id { get; set; }
        public string CourseName { get; set; }
        public string Description { get; set; }
        public string Modules { get; set; }
        public int Duration { get; set; }
    }
}