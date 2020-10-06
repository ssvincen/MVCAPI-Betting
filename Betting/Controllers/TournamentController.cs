using BettingBI;
using BettingBO;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Betting.Controllers
{
    [Authorize]
    [RoutePrefix("Tournament")]
    public class TournamentController : ApiController
    {
        private readonly ITournamentDataAccess tournamentDataAccess;
        public TournamentController(ITournamentDataAccess tournamentData)
        {
            tournamentDataAccess = tournamentData;
        }

        [HttpGet]
        [Route("GetTournament")]
        public async Task<IEnumerable<Tournament>> GetTournamentAsync()
        {
            return await tournamentDataAccess.GetTournamentAsync();
        }

        /// <summary>
        /// Create a new Tournament.
        /// </summary>
        /// <param name="model">New device details.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("AddTournament")]
        public async Task<IHttpActionResult> AddTournament(Tournament model)
        {
            if (string.IsNullOrWhiteSpace(model.TournamentName) || model.TournamentName == "string")
            {
                return BadRequest($"{nameof(model.TournamentName)} cannot be null");
            }
            var data = await tournamentDataAccess.AddTournamentAsync(model);
            return Ok(data);
        }

        [HttpPatch]
        [Route("UpdateTournament")]
        public async Task<IHttpActionResult> UpdateTournament(Tournament model)
        {
            if (model.TournamentID <= 0)
            {
                return BadRequest($"{nameof(model.TournamentID)} cannot be null");
            }
            var data = await tournamentDataAccess.UpdateTournamentAsync(model);
            return Ok(data);
        }

        [HttpDelete]
        [Route("DeleteTournament")]
        public async Task<IHttpActionResult> DeleteTournament([FromBody] int tournamentId)
        {
            if (tournamentId <= 0)
            {
                return BadRequest($"{nameof(tournamentId)} cannot be null");
            }
            var data = await tournamentDataAccess.DeleteTournamentAsync(tournamentId);
            return Ok(data);
        }


    }
}
