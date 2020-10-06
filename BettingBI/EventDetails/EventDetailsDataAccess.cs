using BettingBO;
using Dapper;
using System.Data;
using System.Threading.Tasks;

namespace BettingBI
{
    public class EventDetailsDataAccess : IEventDetailsDataAccess
    {
        private readonly IConnectionManager connectionManager;
        public EventDetailsDataAccess(IConnectionManager connection)
        {
            connectionManager = connection;
        }
        public async Task<int> AddEventDetailAsync(EvenDetail evenDetail)
        {
            int Id = 0;
            var param = new DynamicParameters();
            param.Add("@Id", dbType: DbType.Int32, value: Id, direction: ParameterDirection.Output);
            param.Add("@EventID", dbType: DbType.Int64, value: evenDetail.EventID, direction: ParameterDirection.Input);
            param.Add("@EventDetailStatusID", dbType: DbType.Int32, value: evenDetail.EventDetailStatusID, direction: ParameterDirection.Input);
            param.Add("@EventDetailName", dbType: DbType.String, value: evenDetail.EventDetailName, direction: ParameterDirection.Input);
            param.Add("@EventDetailNumber", dbType: DbType.Int32, value: evenDetail.EventDetailNumber, direction: ParameterDirection.Input);
            param.Add("@EventDetailsOdd", dbType: DbType.Decimal, value: evenDetail.EventDetailsOdd, direction: ParameterDirection.Input);
            param.Add("@FinishingPosition", dbType: DbType.Int32, value: evenDetail.FinishingPosition, direction: ParameterDirection.Input);
            param.Add("@FirstTimer", dbType: DbType.Boolean, value: evenDetail.FirstTimer, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<int>("dbo.pr_AddTournament",
                   commandType: CommandType.StoredProcedure, param: param);
                return param.Get<int>("@Id");
            }
        }

        public async Task<bool> UpdateEventDetailAsync(EvenDetail evenDetail)
        {
            bool IsUpdated = false;
            var param = new DynamicParameters();
            param.Add("@IsUpdated", dbType: DbType.Boolean, value: IsUpdated, direction: ParameterDirection.Output);
            param.Add("@EventDetailsID", dbType: DbType.Int32, value: evenDetail.EventDetailsID, direction: ParameterDirection.Output);
            param.Add("@EventID", dbType: DbType.Int64, value: evenDetail.EventID, direction: ParameterDirection.Input);
            param.Add("@EventDetailStatusID", dbType: DbType.Int32, value: evenDetail.EventDetailStatusID, direction: ParameterDirection.Input);
            param.Add("@EventDetailName", dbType: DbType.String, value: evenDetail.EventDetailName, direction: ParameterDirection.Input);
            param.Add("@EventDetailNumber", dbType: DbType.Int32, value: evenDetail.EventDetailNumber, direction: ParameterDirection.Input);
            param.Add("@EventDetailsOdd", dbType: DbType.Decimal, value: evenDetail.EventDetailsOdd, direction: ParameterDirection.Input);
            param.Add("@FinishingPosition", dbType: DbType.Int32, value: evenDetail.FinishingPosition, direction: ParameterDirection.Input);
            param.Add("@FirstTimer", dbType: DbType.Boolean, value: evenDetail.FirstTimer, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_UpdateEvenDetail",
                    commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsUpdated");
            }
        }

        public async Task<bool> DeleteEventDetailAsync(int evenDetailID)
        {
            bool IsDeleted = false;
            var param = new DynamicParameters();
            param.Add("@IsDeleted", dbType: DbType.Boolean, value: IsDeleted, direction: ParameterDirection.Output);
            param.Add("@EventDetailID", dbType: DbType.String, value: evenDetailID, direction: ParameterDirection.Input);

            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_DeleteEvenDetail",
                     commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsDeleted");
            }
        }


    }
}
