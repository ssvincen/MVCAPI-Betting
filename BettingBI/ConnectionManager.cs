using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BettingBI
{
    public class ConnectionManager : IConnectionManager
    {
        public IDbConnection DefaultConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        }
    }
}
