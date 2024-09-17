using IoT.Admin.Domain.Modules.Gpio;

namespace IoT.Admin.Api.Services;

public class GpioService : IGpioService
{
    private readonly IGpioModule _gpioModule;
    private readonly ILogger<GpioService> _logger;

    public GpioService(IGpioModule gpioModule, ILogger<GpioService> logger)
    {
        _gpioModule = gpioModule;
        _logger = logger;
    }

    public void OpenPin(int pinNumber)
    {
        _gpioModule.OpenPin(pinNumber);
        _logger.LogInformation($"Gpio Open Pin: {pinNumber}");
    }

    public void ClosePin(int pinNumber)
    {
        _gpioModule.ClosePin(pinNumber);
        _logger.LogInformation($"Gpio Close Pin: {pinNumber}");
    }

    public void CloseAllPins()
    {
        _gpioModule.CloseAllPins();
        _logger.LogInformation("Gpio Close All Pins");
    }
}