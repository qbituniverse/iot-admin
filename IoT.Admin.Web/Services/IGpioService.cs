namespace IoT.Admin.Web.Services;

public interface IGpioService
{
    Task<bool> OpenPin(int pinNumber);
    Task<bool> ClosePin(int pinNumber);
    Task<bool> CloseAllPins();
}