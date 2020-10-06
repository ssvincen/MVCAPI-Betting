using System;

namespace BettingBO
{
    public class Event
    {
        public long EventID { get; set; }
        public long TournamentID { get; set; }
        public string EventName { get; set; }
        public int EventNumber { get; set; }
        public DateTime EventDateTime { get; set; }
        public DateTime EventEndDateTime { get; set; }
        public bool AutoClose { get; set; }
    }
}
