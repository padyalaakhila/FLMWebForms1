using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Model
{
    public class StudentMaster
    {
        public int Id { get; set; }
        public string StudName { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public bool Gender { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public DateTime Dob { get; set; }
        public string Photo { get; set; }
        public int FkCourseId { get; set; }
    }
}