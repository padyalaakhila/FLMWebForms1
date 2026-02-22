using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Dao
{
    public class StudentAttemptDetailsDao : LmsDao
    {
        public override DataTable GetAllRecords()
        {
            throw new NotImplementedException();
        }

        public override DataTable GetOneRecord(int id)
        {
            throw new NotImplementedException();
        }

        public DataTable GetAttemptDetailsByTestAndStudId(int testid, int studid)
        {
            string query = "select tq.question, tq.answer1, tq.answer2, tq.answer3, tq.answer4, tq.correctans," +
                " sa.selectedans, sa.iscorrect, tq.explanation from testquestions tq, studentattemptdetails sa " +
                "where sa.fktestquestionid = tq.id and tq.fktestid= " + testid + " and sa.fkstudid=" + studid;
            return GetData(query);
        }

        public override int PerformInsertUpdateDelete(dynamic model, string operation)
        {
            string query = "";
            StudentAttemptDetails attempt = (StudentAttemptDetails)model;
            if (operation.ToLower() == "save")
            {
                query = "insert into studentattemptdetails (fkstudid, fktestquestionid, selectedans, iscorrect) " +
                    "values('" + attempt.FkStudentId + "','" + attempt.FkTestQuestionId + "','"
                    + attempt.SelectedAns + "','" + attempt.IsCorrect + "')";
            }

            return PerformInsertUpdateDelete(query);
        }
    }
}