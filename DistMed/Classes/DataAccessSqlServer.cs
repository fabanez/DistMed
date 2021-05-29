using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DistMed.Classes
{
    public class DataAccessSqlServer : ISimpleDataAccess, IServiceProvider, IDisposable
    {
        private SqlConnection Connection { get; set; }
        private SqlDataAdapter Da { get; set; }
        private SqlCommand SelectCommand { get; set; }

        public SqlCommand ExecuteCommand { get; set; }

        public DataAccessSqlServer(string ConnectionString)
        {
            Connection = new SqlConnection(ConnectionString);
            Da = new SqlDataAdapter();
            SelectCommand = new SqlCommand();
            ExecuteCommand = new SqlCommand();

            Da.AcceptChangesDuringFill = true;
        }

        public void Dispose()
        {
            if(!(Connection is null))
            {
                if (Connection.State == ConnectionState.Open)
                {
                    Connection.Close();
                }
            }
        }

        public void ExecuteNonQuery(string Query)
        {
            using (Connection)
            {
                Connection.Open();
                ExecuteCommand.Connection = Connection;
                ExecuteCommand.CommandText = Query;
                ExecuteCommand.CommandType = CommandType.Text;
                ExecuteCommand.ExecuteNonQuery();
            }
        }

        public DataTable ExecuteQuery(string Query)
        {
            DataTable dt = new DataTable();
            SelectCommand.Connection = Connection;
            SelectCommand.CommandText = Query;
            SelectCommand.CommandType = CommandType.Text;
            Da.SelectCommand = SelectCommand;
            Da.Fill(dt);
            return dt;
        }

        public async Task<DataTable> ExecuteQueryAsync(string Query)
        {
            DataTable dt = new DataTable();
            SelectCommand.Connection = Connection;
            SelectCommand.CommandText = Query;
            SelectCommand.CommandType = CommandType.Text;
            Da.SelectCommand = SelectCommand;

            await Task.Run(() =>
            {
                Da.Fill(dt);
                //this.Invoke(new Action(() => { dataGridView1.DataSource = ds.Table1; }));
            });

            return dt;
        }

        public async Task ExecuteNonQueryAsync(string Query)
        {
            using (Connection)
            {
                Connection.Open();
                ExecuteCommand.Connection = Connection;
                ExecuteCommand.CommandText = Query;
                ExecuteCommand.CommandType = CommandType.Text;
                _ = await ExecuteCommand.ExecuteNonQueryAsync();
            }
        }

        public object GetService(Type serviceType)
        {
            throw new NotImplementedException();
        }
    }
}
