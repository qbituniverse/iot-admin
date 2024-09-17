namespace IoT.Admin.Web.Services;

public interface IAdminService
{
    Task<bool> Ping();
    Task<string?> Config();
    Task<bool> OpenPin(int pinNumber);
    Task<bool> ClosePin(int pinNumber);
    Task<bool> CloseAllPins();
}