using FLMWebForms1.Data.Dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Student
{
    public partial class TestResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StudentAttemptDetailsDao detailsDao = new StudentAttemptDetailsDao();
                DataTable dt = detailsDao.GetAttemptDetailsByTestAndStudId (
                Convert.ToInt32(Session["testid"]), Convert.ToInt32(Session["studid"]));
                GvTestAttemptDetails.DataSource = dt;
                GvTestAttemptDetails.DataBind();

            }
        }
    }
}