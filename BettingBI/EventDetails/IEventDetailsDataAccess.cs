using BettingBO;
using System.Threading.Tasks;

namespace BettingBI
{
    public interface IEventDetailsDataAccess
    {
        Task<int> AddEventDetailAsync(EvenDetail evenDetail);
        Task<bool> UpdateEventDetailAsync(EvenDetail evenDetail);
        Task<bool> DeleteEventDetailAsync(int evenDetailID);
    }
}
