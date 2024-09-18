namespace IoT.Admin.Web.Services;

public interface IAdminService
{
    Task<bool> Ping();
    Task<string?> Config();
}