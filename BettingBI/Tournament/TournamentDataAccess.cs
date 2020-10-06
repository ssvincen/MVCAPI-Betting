using BettingBO;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace BettingBI
{
    public class TournamentDataAccess : ITournamentDataAccess
    {
        private readonly IConnectionManager connectionManager;
        public TournamentDataAccess(IConnectionManager connection)
        {
            connectionManager = connection;
        }

        public async Task<IEnumerable<Tournament>> GetTournamentAsync()
        {
            using (var db = connectionManager.DefaultConnection())
            {
                return await db.QueryAsync<Tournament>("dbo.pr_GetTournament",
                   commandType: CommandType.StoredProcedure);

            }
        }

        public async Task<int> AddTournamentAsync(Tournament tournament)
        {
            int Id = 0;
            var param = new DynamicParameters();
            param.Add("@Id", dbType: DbType.Int32, value: Id, direction: ParameterDirection.Output);
            param.Add("@TournamentName", dbType: DbType.String, value: tournament.TournamentName, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<int>("dbo.pr_AddTournament",
                   commandType: CommandType.StoredProcedure, param: param);
                return param.Get<int>("@Id");
            }
        }

        public async Task<bool> UpdateTournamentAsync(Tournament tournament)
        {
            bool IsUpdated = false;
            var param = new DynamicParameters();
            param.Add("@IsUpdated", dbType: DbType.Boolean, value: IsUpdated, direction: ParameterDirection.Output);
            param.Add("@TournamentID", dbType: DbType.Int64, value: tournament.TournamentID, direction: ParameterDirection.Input);
            param.Add("@TournamentName", dbType: DbType.String, value: tournament.TournamentName, direction: ParameterDirection.Input);
            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_UpdateTournament",
                    commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsUpdated");
            }
        }

        public async Task<bool> DeleteTournamentAsync(int tournamentID)
        {
            bool IsDeleted = false;
            var param = new DynamicParameters();
            param.Add("@IsDeleted", dbType: DbType.Boolean, value: IsDeleted, direction: ParameterDirection.Output);
            param.Add("@TournamentID", dbType: DbType.String, value: tournamentID, direction: ParameterDirection.Input);

            using (var db = connectionManager.DefaultConnection())
            {
                await db.QueryFirstOrDefaultAsync<bool>("dbo.pr_DeleteTournament",
                     commandType: CommandType.StoredProcedure, param: param);
                return param.Get<bool>("@IsDeleted");
            }
        }


    }
}
