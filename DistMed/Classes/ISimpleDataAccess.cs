using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DistMed.Classes
{
    public interface ISimpleDataAccess
    {
        public DataTable ExecuteQuery(string Query);
        public Task<DataTable> ExecuteQueryAsync(string Query);
        public void ExecuteNonQuery(string Query);
        public Task ExecuteNonQueryAsync(string Query);
    }
}
