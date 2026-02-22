using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Faculty
{
    public partial class FacultyLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Session["faculityname"] = "Yoshitha";
            Response.Redirect("ManageCourses.aspx");
        }
    }
}