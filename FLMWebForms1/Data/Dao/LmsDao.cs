using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FLMWebForms1.Data.Dao
{
    public abstract class LmsDao : ILmsDao
    {
        private readonly string _connString;
        protected SqlConnection con;
        protected SqlCommand cmd;
        protected SqlDataAdapter da;

        public LmsDao()
        {
            _connString = "server=.;initial catalog=lms; integrated security=true;";
            con = new SqlConnection(_connString);
        }

        protected int PerformInsertUpdateDelete(string query)
        {
            try
            {
                cmd = new SqlCommand(query, con);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in executing query: " + ex.Message);
            }
            finally
            {
                if (con.State.ToString() == "Open") con.Close();
            }
            return 0;
        }

        protected DataTable GetData (string query)
        {
            DataTable dt = null;
            try
            {
                da = new SqlDataAdapter(query, con);
                dt = new DataTable();
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in executing query: " + ex.Message);
            }
            return dt;
        }

        public abstract int PerformInsertUpdateDelete(dynamic model, string operation);
        public abstract DataTable GetAllRecords();
        public abstract DataTable GetOneRecord(int id);
    }
}