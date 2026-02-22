using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FLMWebForms1.Data.Dao
{
    internal interface ILmsDao
    {
        int PerformInsertUpdateDelete(dynamic model,string operation);
        DataTable GetAllRecords();
        DataTable GetOneRecord(int id);
    }
}
