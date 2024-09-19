using IoT.Admin.Api.Models;
using IoT.Admin.Api.Services;
using IoT.Admin.Domain.Modules.Gpio;

namespace IoT.Admin.Api;

internal class Register
{
    public static void Services(ApiConfiguration configuration, IServiceCollection services)
    {
        services.AddControllers();
        services.AddHealthChecks();
        services.AddSwaggerGen();

        switch (configuration.Modules!.Gpio!.Type)
        {
            case "Pi":
                services.AddSingleton<IGpioModule, GpioModulePi>();
                break;

            default:
                services.AddSingleton<IGpioModule, GpioModuleMock>();
                break;
        }

        services.AddSingleton<IGpioService, GpioService>();
    }
}