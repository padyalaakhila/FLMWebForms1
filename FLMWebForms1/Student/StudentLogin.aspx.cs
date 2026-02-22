using FLMWebForms1.Data.Dao;
using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Student
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string username = TxtUserName.Text;
            string password = TxtPassword.Text;

            StudentMaster student = new StudentMaster();
            student.EmailId = username;
            student.Password = password;

            StudentMasterDao studentDao = new StudentMasterDao();
            student = studentDao.CheckUserLogin(student);

            if (student.Id > 0)
            {
                Session["studid"] = student.Id;
                Session["studname"] = student.StudName;
                Session["fkcourseid"] = student.FkCourseId;

                Response.Redirect("StudentHome.aspx");
            }
            else
            {
                LblError.Text = "Invalid username or password";
            }
        }
    }
}