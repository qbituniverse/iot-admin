namespace IoT.Admin.Domain.Modules.Gpio;

public class GpioModuleMock : IGpioModule
{
    public void OpenPin(int pinNumber)
    {
        Thread.Sleep(1000);
    }

    public void ClosePin(int pinNumber)
    {
        Thread.Sleep(1000);
    }

    public void CloseAllPins()
    {
        Thread.Sleep(1000);
    }
}