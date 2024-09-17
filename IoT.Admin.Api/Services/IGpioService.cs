namespace IoT.Admin.Api.Services;

public interface IGpioService
{
    void OpenPin(int pinNumber);
    void ClosePin(int pinNumber);
    void CloseAllPins();
}