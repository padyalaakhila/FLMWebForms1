using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Model
{
    public class TestQuestions
    {
        public int Id { set; get; }
        public int FkTestId { set; get; }
        public string Question { set; get; }
        public string Answer1 { set; get; }
        public string Answer2 { set; get; }
        public string Answer3 { set; get; }
        public string Answer4 { set; get; }
        public string CorrectAns { set; get; }
        public string Explanation { set; get; }
    }
}