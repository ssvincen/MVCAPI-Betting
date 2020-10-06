using BettingBI;
using BettingBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Betting.Controllers
{
    //[Authorize]
    [RoutePrefix("Event")]
    public class EventController : ApiController
    {
        private readonly IEvenDataAccess evenDataAccess;
        private readonly IEventDetailsDataAccess eventDetailsDataAccess;
        public EventController(IEvenDataAccess eventData, IEventDetailsDataAccess eventDetailsData)
        {
            evenDataAccess = eventData;
            eventDetailsDataAccess = eventDetailsData;
        }

        [HttpGet]
        [Route("GetEvent")]
        public async Task<IEnumerable<Event>> GetEvents()
        {
            var data = await evenDataAccess.GetEventsAsync();
            return data;
        }


        /// <summary>
        /// Create a new Tournament.
        /// </summary>
        /// <param name="model">New device details.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("AddEvent")]
        public async Task<IHttpActionResult> AddEvent(Event model)
        {
            if (model == null)
            {
                return BadRequest($"{nameof(model)} cannot be null");
            }
            var data = await evenDataAccess.AddEventAsync(model);
            return Ok(data);
        }

        [HttpPatch]
        [Route("UpdateEvent")]
        public async Task<IHttpActionResult> UpdateEvent(Event model)
        {
            if (model == null)
            {
                return BadRequest($"{nameof(model)} cannot be null");
            }
            var data = await evenDataAccess.UpdateEventAsync(model);
            return Ok(data);
        }

        [HttpDelete]
        [Route("DeleteEvent")]
        public async Task<IHttpActionResult> DeleteEvent([FromBody] int eventId)
        {
            if (eventId <= 0)
            {
                return BadRequest($"{nameof(eventId)} cannot be null");
            }
            var data = await evenDataAccess.DeleteEventAsync(eventId);
            return Ok(data);
        }

        /// <summary>
        /// Create a new Tournament.
        /// </summary>
        /// <param name="model">New device details.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("AddEventDetail")]
        public async Task<IHttpActionResult> AddEventDetail(EvenDetail model)
        {
            if (model == null)
            {
                return BadRequest($"{nameof(model)} cannot be null");
            }
            var data = await eventDetailsDataAccess.AddEventDetailAsync(model);
            return Ok(data);
        }

        [HttpPatch]
        [Route("UpdateEventDetail")]
        public async Task<IHttpActionResult> UpdateEventDetail(EvenDetail model)
        {
            if (model == null)
            {
                return BadRequest($"{nameof(model)} cannot be null");
            }
            var data = await eventDetailsDataAccess.UpdateEventDetailAsync(model);
            return Ok(data);
        }

        [HttpDelete]
        [Route("DeleteEventDetail")]
        public async Task<IHttpActionResult> DeleteTournament([FromBody] int tournamentId)
        {
            if (tournamentId <= 0)
            {
                return BadRequest($"{nameof(tournamentId)} cannot be null");
            }
            var data = await eventDetailsDataAccess.DeleteEventDetailAsync(tournamentId);
            return Ok(data);
        }




    }
}
