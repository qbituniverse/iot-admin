using IoT.Admin.Web.Models;
using IoT.Admin.Web.Services;

namespace IoT.Admin.Web;

internal class Register
{
    public static void Services(WebConfiguration configuration, IServiceCollection services)
    {
        services.AddRazorPages();
        services.AddServerSideBlazor();

        services.AddHttpClient("AdminApi",
            httpClient => { httpClient.BaseAddress = new Uri(configuration.Api!.Url!); });

        services.AddSingleton<IAdminService, AdminService>();
        services.AddSingleton<IGpioService, GpioService>();

        services.AddSingleton(configuration);
    }
}