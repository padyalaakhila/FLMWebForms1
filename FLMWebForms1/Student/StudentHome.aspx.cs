using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Student
{
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               
        }

        protected void LnkAttemptTest_Click(object sender, EventArgs e)
        {
            Session["testid"] = DdlTestMaster.SelectedValue;
            Response.Redirect("AttemptTest.aspx");

        }
    }
}