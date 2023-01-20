using Microsoft.Extensions.DependencyInjection;
using WebApplication1.Application;
using WebApplication1.Domain;

namespace WebApplication1.Controllers
{
    public class DependencyInjection
    {
        public static void RegisterProfile(IServiceCollection services)
        {

            services.AddTransient<AvionDomainService>();
            services.AddTransient<AvionApplicationService>();
        }
    }
}
