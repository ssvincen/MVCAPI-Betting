using BettingBI;
using System.Web.Http;
using Unity;
using Unity.WebApi;

namespace Betting
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();
            container.RegisterType<IConnectionManager, ConnectionManager>();
            container.RegisterType<ITournamentDataAccess, TournamentDataAccess>();
            container.RegisterType<IEvenDataAccess, EvenDataAccess>();
            container.RegisterType<IEventDetailsDataAccess, EventDetailsDataAccess>();

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}