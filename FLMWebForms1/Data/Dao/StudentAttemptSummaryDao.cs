using FLMWebForms1.Data.Dao;
using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Dao
{
    public class StudentAttemptSummaryDao : LmsDao
    {
        public override DataTable GetAllRecords()
        {
            throw new NotImplementedException();
        }

        public override DataTable GetOneRecord(int id)
        {
            throw new NotImplementedException();
        }

        public override int PerformInsertUpdateDelete(dynamic model, string operation)
        {
            StudentAttemptSummary summary = (StudentAttemptSummary)model;
            string query = "";
            if (operation.ToLower() == "save")
            {
                //delete existing record, then add new record
                query = "delete from studentattemptsummary where " +
                    "fkstudid='" + summary.FkStudId + "' and fktestid='" + summary.FkTestId + "'";

                PerformInsertUpdateDelete(query);

                //attempt to save new record
                query = "insert into studentattemptsummary (fkstudid, fktestid, attemptdate, result) " +
                    "values('" + summary.FkStudId + "','" + summary.FkTestId + "',GETDATE(),'" + summary.Result + "')";
            }
            return PerformInsertUpdateDelete(query);
        }
    }
}