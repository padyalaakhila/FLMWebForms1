using FLMWebForms1.Data;
using FLMWebForms1.Data.Dao;
using FLMWebForms1.Data.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlmWebFormsApp.Student
{
    public partial class AttemptTest : System.Web.UI.Page
    {
        static DataTable dtQuestions;
        static int currentQuestion = 0;
        static bool isLastQuestion = false;
        static List<StudentAttemptDetails> attemptDetails = new List<StudentAttemptDetails>();
        static int correctAnswersCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Lblwelcome.Text = "Welcome " + Session["studname"];
                LoadTestQuestions();
                DisplayQuestion();
            }
        }
        private void LoadTestQuestions()
        {
            TestQuestionsDao testQuestionsDao = new TestQuestionsDao();
            dtQuestions = testQuestionsDao.GetTestQuestionsByTestId(Convert.ToInt32(Session["testid"]));

        }
        private void DisplayQuestion()
        {
            DdlCorrectanswer.SelectedIndex = 0;
            if (dtQuestions != null && dtQuestions.Rows.Count > 0)
            {
                LblQuestion.Text = dtQuestions.Rows[currentQuestion]["question"].ToString();
                LblAnswer1.Text = dtQuestions.Rows[currentQuestion]["answer1"].ToString();
                LblAnswer2.Text = dtQuestions.Rows[currentQuestion]["answer2"].ToString();
                LblAnswer3.Text = dtQuestions.Rows[currentQuestion]["answer3"].ToString();
                LblAnswer4.Text = dtQuestions.Rows[currentQuestion]["answer4"].ToString();

                if (currentQuestion == dtQuestions.Rows.Count - 1)
                {
                    isLastQuestion = true;
                    BtnContinue.Text = "Finish";
                }
            }
        }

        protected void BtnContinue_Click(object sender, EventArgs e)
        {
            if (!isLastQuestion)
            {
                StudentAttemptDetails attemptDetail = new StudentAttemptDetails();
                attemptDetail.FkStudentId = Convert.ToInt32(Session["studid"]);
                attemptDetail.FkTestQuestionId = int.Parse(dtQuestions.Rows[currentQuestion]["id"].ToString());
                attemptDetail.SelectedAns = int.Parse(DdlCorrectanswer.SelectedValue);
                if (DdlCorrectanswer.SelectedValue == dtQuestions.Rows[currentQuestion]["correctans"].ToString())
                {
                    attemptDetail.IsCorrect = true;
                    correctAnswersCount++;
                }
                else attemptDetail.IsCorrect = false;
                attemptDetails.Add(attemptDetail);

                currentQuestion++;
                DisplayQuestion();
            }
            else
            {
                //code for saving student answers into details and summary tables
                //1. save student answers into student attempt details table
                StudentAttemptDetailsDao studentAttemptDetailsDao = new StudentAttemptDetailsDao();
                foreach (StudentAttemptDetails detail in attemptDetails)
                {
                    studentAttemptDetailsDao.PerformInsertUpdateDelete(detail, "save");
                }


                //2. calculate the result and store into student attempt summary table  
                StudentAttemptSummary summary = new StudentAttemptSummary();
                summary.FkStudId = Convert.ToInt32(Session["studid"]);
                summary.FkTestId = Convert.ToInt32(Session["testid"]);
                summary.AttemptDate = DateTime.Now;

                if (correctAnswersCount >= (dtQuestions.Rows.Count / 2))
                {
                    summary.Result = true;
                }
                else
                {
                    summary.Result = false;
                }
                StudentAttemptSummaryDao summaryDao = new StudentAttemptSummaryDao();
                summaryDao.PerformInsertUpdateDelete(summary, "save");

                Response.Redirect("TestResult.aspx");
            }

        }
    }
}