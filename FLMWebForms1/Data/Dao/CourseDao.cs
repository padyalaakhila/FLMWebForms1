using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FLMWebForms1.Data.Dao
{
    public class CourseDao : LmsDao
    {
        public override DataTable GetAllRecords()
        {
            string query = "select '0' as id, 'Select a Course' as coursename " +
                            "union select id, coursename from coursemaster";
            return GetData(query);
        }

        public override DataTable GetOneRecord(int id)
        {
            throw new NotImplementedException();
        }

        public override int PerformInsertUpdateDelete(dynamic model, string operation)
        {
            CourseMaster cm = (CourseMaster)model;
            string query = "";
            if (operation.ToLower() == "save")
            {
                query = "insert into coursemaster (coursename, description, modules, duration) " +
                    "values('" + cm.CourseName + "','" + cm.Description + "','" + cm.Modules + "','" + cm.Duration + "')";
            }
            else if (operation.ToLower() == "update")
            {
                query = "update coursemaster set ";
            }
            else if (operation.ToLower() == "delete")
            {
                query = "delete from coursemaster where id=";
            }
            else
            {
                return 0;
            }
            return base.PerformInsertUpdateDelete(query);

        }
    }
}