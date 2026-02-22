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
    public partial class ManageTests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAddTest_Click(object sender, EventArgs e)
        {
            TestMaster test = new TestMaster();
            test.FkCourseId = int.Parse(DdlCourse.SelectedValue);
            test.TestName = TxtTestName.Text;
            test.Duration = int.Parse(TxtDuration.Text);
            test.TotQuestions = int.Parse(TxtQuestions.Text);

            TestMasterDao dao = new TestMasterDao();
            int result = dao.PerformInsertUpdateDelete(test, "save");

            if (result > 0)
            {
                GridView1.DataBind();
            }
            else
            {
                LblError.Text = "Error adding test.";
            }
        }
    }
}