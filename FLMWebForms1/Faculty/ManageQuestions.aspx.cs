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
    public partial class ManageQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            TestQuestions question = new TestQuestions();
            question.FkTestId = Convert.ToInt32(DdlTests.SelectedValue);
            question.Question = TxtQuestion.Text;
            question.Answer1 = TxtAnswer1.Text;
            question.Answer2 = TxtAnswer2.Text;
            question.Answer3 = TxtAnswer3.Text;
            question.Answer4 = TxtAnswer4.Text;
            question.CorrectAns = DdlCorrectAnswer.SelectedValue;
            question.Explanation = TxtExplanation.Text;

            TestQuestionsDao dao = new TestQuestionsDao();

            int result = dao.PerformInsertUpdateDelete(question, "save");  
            if (result > 0)
            {
                GvQuestions.DataBind();
            }
            else
            {
                LblError.Text = "Error saving question.";
            }




        }
    }
}