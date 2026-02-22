using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Dao
{
    public class StudentMasterDao : LmsDao
    {
        public override DataTable GetAllRecords()
        {
            string query = "select * from studentmaster";
            return GetData(query);
        }

        public override DataTable GetOneRecord(int id)
        {
            string query = "select * from studentmaster where id=" + id;
            return GetData(query);
        }

        public override int PerformInsertUpdateDelete(dynamic model, string operation)
        {
            string query = " ";
            StudentMaster student = (StudentMaster)model;

            if(operation.ToLower() == "save")
            {
                query = "insert into studentmaster (studname, emailid, password, gender, state, city, mobile, address, " +
                    "dob, photo, fkcourseid)" + 
                    "values('"+student.StudName+"','"+student.EmailId+"','"+student.Password+"','"+student.Gender+"'," +
                    "'"+student.State+"','"+student.City+"','"+student.Mobile+"','"+student.Address+"','"+student.Dob+"'," +
                    "'"+student.Photo+"','"+student.FkCourseId+"')";
            }

            else if (operation.ToLower() == "update")
            {
                query = "update studentmaster set ";
            }
            else if (operation.ToLower() == "delete")
            {
                query = "delete from studentmaster where id=";
            }
            else
            {
                return 0;
            }

            return PerformInsertUpdateDelete(query);
        }

        public StudentMaster CheckUserLogin(StudentMaster student)
        {
            string query = "select * from studentmaster where emailid='" + 
                student.EmailId + "' and password='" + student.Password + "'";
            DataTable dt = GetData(query);
            if (dt != null && dt.Rows.Count > 0)
            {
                student.Id = Convert.ToInt32(dt.Rows[0]["id"]);
                student.StudName = Convert.ToString(dt.Rows[0]["studname"]);
                student.FkCourseId = Convert.ToInt32(dt.Rows[0]["fkcourseid"]);
            }
            return student;
            
        }
    }
}