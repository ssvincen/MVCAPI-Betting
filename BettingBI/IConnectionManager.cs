using System.Data;

namespace BettingBI
{
    public interface IConnectionManager
    {
        IDbConnection DefaultConnection();
    }
}
