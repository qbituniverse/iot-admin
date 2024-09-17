namespace IoT.Admin.Domain.Modules.Gpio;

public interface IGpioModule
{
    void OpenPin(int pinNumber);
    void ClosePin(int pinNumber);
    void CloseAllPins();
}