using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BettingBO
{
    public class EvenDetail
    {
        public long EventDetailsID { get; set; }
        public long EventID { get; set; }
        public int EventDetailStatusID { get; set; }
        public string EventDetailName { get; set; }
        public int EventDetailNumber { get; set; }
        public decimal EventDetailsOdd { get; set; }
        public int FinishingPosition { get; set; }
        public bool FirstTimer { get; set; }

    }
}
