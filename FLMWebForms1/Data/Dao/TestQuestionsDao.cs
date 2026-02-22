using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Dao
{
    public class TestQuestionsDao : LmsDao
    {
        public override DataTable GetAllRecords()
        {
            string query = "SELECT * FROM testquestions";
            return GetData(query);
        }

        public override DataTable GetOneRecord(int id)
        {
            string query = "SELECT * FROM testquestions WHERE id=" + id;
            return GetData(query); 
        }

        public DataTable GetTestQuestionsByTestId(int fkTestId)
        {
            string query = "SELECT * FROM testquestions WHERE fktestid=" + fkTestId;
            return GetData(query);
        }

        public override int PerformInsertUpdateDelete(dynamic model, string operation)
        {
            string query = "";
            var testQuestion = (Data.Model.TestQuestions)model;

            if(operation == "save")
            {
                query = "insert into testquestions (fktestid, question,answer1, answer2, answer3, answer4, correctans, explanation)" +
                    "values ('" + testQuestion.FkTestId + "','" + testQuestion.Question + "'," +
                    "'" + testQuestion.Answer1 + "','" + testQuestion.Answer2 + "','" + testQuestion.Answer3 + "'," +
                    "'" + testQuestion.Answer4 + "','" + testQuestion.CorrectAns + "','" + testQuestion.Explanation + "');";

            }
            else if (operation == "update")
            {
                query = "update testquestions set " +
                    "fktestid='" + testQuestion.FkTestId + "', " +
                    "question='" + testQuestion.Question + "', " +
                    "answer1='" + testQuestion.Answer1 + "', " +
                    "answer2='" + testQuestion.Answer2 + "', " +
                    "answer3='" + testQuestion.Answer3 + "', " +
                    "answer4='" + testQuestion.Answer4 + "', " +
                    "correctans='" + testQuestion.CorrectAns + "', " +
                    "explanation='" + testQuestion.Explanation + "' " +
                    "where id=" + testQuestion.Id + ";";
            }
            else if (operation == "delete")
            {
                query = "delete from testquestions where id=" + testQuestion.Id + ";";
            }
            return PerformInsertUpdateDelete(query);
        }
    }
}