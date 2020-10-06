using BettingBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BettingBI
{
    public interface IEvenDataAccess
    {
        Task<int> AddEventAsync(Event model );
        Task<bool> UpdateEventAsync(Event model);
        Task<bool> DeleteEventAsync(int eventID);
    }
}
