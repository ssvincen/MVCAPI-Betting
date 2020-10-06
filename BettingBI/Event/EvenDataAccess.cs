using BettingBO;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BettingBI
{
    public class EvenDataAccess: IEvenDataAccess
    {
        private readonly IConnectionManager connectionManager;
        public EvenDataAccess(IConnectionManager connection)
        {
            connectionManager = connection;
        }

        public async Task<IEnumerable<Event>> GetEventsAsync()
        {
            using (var db = connectionManager.DefaultConnection())
            {
                return await db.QueryAsync<Event>("dbo.pr_GetEvent",
                   commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<int> AddEventAsync(Event model)
        {
            int Id = 0;
            var param = new DynamicParameters();
            param.Add("@Id", dbType: DbType.Int32, value: Id, direction: ParameterDirection.Output);
            param.Add("@TournamentID", dbType: DbType.Int64, value: model.TournamentID, direction: ParameterDirection.Input);
            param.Add("@EventName", dbType: DbType.String, value: model.EventName, direction: ParameterDirection.Input);
            param.Add("@EventNumber", dbType: DbType.Int16, value: model.EventNumber, direction: ParameterDirection.Input);
            param.Add("@EventDateTime", dbType: DbType.DateTime2, value: model.EventDateTime, direction: ParameterDirection.Input);
            param.Add("@EventEndDateTime", dbType: DbType.DateTime2, value: model.EventEndDateTime, direction: ParameterDirection.Input);
            param.Add("@AutoClose", dbType: DbType.Boolean, value: model.AutoClose, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<int>("dbo.pr_AddEvent",
                   commandType: CommandType.StoredProcedure, param: param);
                return param.Get<int>("@Id");
            }
        }

        public async Task<bool> UpdateEventAsync(Event model)
        {
            bool IsUpdated = false;
            var param = new DynamicParameters();
            param.Add("@IsUpdated", dbType: DbType.Boolean, value: IsUpdated, direction: ParameterDirection.Output);
            param.Add("@EventID", dbType: DbType.Int32, value: model.EventID, direction: ParameterDirection.Output);
            param.Add("@TournamentID", dbType: DbType.Int64, value: model.TournamentID, direction: ParameterDirection.Input);
            param.Add("@EventName", dbType: DbType.String, value: model.EventName, direction: ParameterDirection.Input);
            param.Add("@EventNumber", dbType: DbType.Int16, value: model.EventNumber, direction: ParameterDirection.Input);
            param.Add("@EventDateTime", dbType: DbType.DateTime2, value: model.EventDateTime, direction: ParameterDirection.Input);
            param.Add("@EventEndDateTime", dbType: DbType.DateTime2, value: model.EventEndDateTime, direction: ParameterDirection.Input);
            param.Add("@AutoClose", dbType: DbType.Boolean, value: model.AutoClose, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_UpdateEvent",
                    commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsUpdated");
            }
        }

        public async Task<bool> DeleteEventAsync(int eventID)
        {
            bool IsUpdated = false;
            var param = new DynamicParameters();
            param.Add("@IsDeleted", dbType: DbType.Boolean, value: IsUpdated, direction: ParameterDirection.Output);
            param.Add("@EventID", dbType: DbType.String, value: eventID, direction: ParameterDirection.Input);

            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_DeleteEvent",
                     commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsDeleted");
            }
        }

        
    }
}
