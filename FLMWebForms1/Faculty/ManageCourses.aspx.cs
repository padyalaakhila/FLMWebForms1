using FLMWebForms1.Data.Dao;
using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Faculty
{
    public partial class ManageCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            CourseDao courseDao = new CourseDao();
            CourseMaster course = new CourseMaster();
            course.CourseName = TxtCourseName.Text;
            course.Description = TxtDescription.Text;
            course.Modules = TxtModules.Text;
            course.Duration = int.Parse(TxtDuration.Text);

            int rowsEffected = courseDao.PerformInsertUpdateDelete(course, "save");
            if (rowsEffected > 0)
            {
                GvCourseList.DataBind();
            }
            else
            {
                LblError.Text = "Failed to add new course. Please try again!!";
            }
        }

        
    }
}