using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Model
{
    public class TestMaster
    {
        public int Id { set; get; }
        public int FkCourseId { set; get; }
        public string TestName { set; get; }
        public int Duration { set; get; }
        public int TotQuestions { set; get; }
    }
}