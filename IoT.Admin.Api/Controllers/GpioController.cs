using IoT.Admin.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace IoT.Admin.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class GpioController : ControllerBase
{
    private readonly IGpioService _gpioService;

    public GpioController(IGpioService gpioService)
    {
        _gpioService = gpioService;
    }

    [HttpPost]
    [Route("open")]
    public void PostGpioOpen(int pinNumber)
    {
        _gpioService.OpenPin(pinNumber);
    }

    [HttpPost]
    [Route("close")]
    public void PostGpioClose(int pinNumber)
    {
        _gpioService.ClosePin(pinNumber);
    }

    [HttpPost]
    [Route("close-all")]
    public void PostGpioCloseAll()
    {
        _gpioService.CloseAllPins();
    }
}