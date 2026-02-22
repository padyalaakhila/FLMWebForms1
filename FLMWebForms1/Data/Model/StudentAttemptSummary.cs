using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Model
{
    public class StudentAttemptSummary
    {
        public int Id { get; set; }
        public int FkStudId { get; set; }
        public int FkTestId { get; set; }
        public DateTime AttemptDate { get; set; }
        public bool Result { get; set; }
    }
}