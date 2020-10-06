using BettingBO;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BettingBI
{
    public interface ITournamentDataAccess
    {
        Task<IEnumerable<Tournament>> GetTournamentAsync();
        Task<int> AddTournamentAsync(Tournament tournament);
        Task<bool> UpdateTournamentAsync(Tournament tournament);
        Task<bool> DeleteTournamentAsync(int tournamentID);

    }
}
