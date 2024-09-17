using System.Net;

namespace IoT.Admin.Web.Services;

public class AdminService : IAdminService
{
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly ILogger<AdminService> _logger;

    public AdminService(
        IHttpClientFactory httpClientFactory,
        ILogger<AdminService> logger)
    {
        _httpClientFactory = httpClientFactory;
        _logger = logger;
    }

    public async Task<bool> Ping()
    {
        var httpClient = _httpClientFactory.CreateClient("AdminApi");
        var response = await httpClient.GetAsync("api/admin/ping");
        _logger.LogInformation("GPIO Ping");
        return response.StatusCode == HttpStatusCode.OK;
    }

    public async Task<string?> Config()
    {
        var httpClient = _httpClientFactory.CreateClient("AdminApi");
        var response = await httpClient.GetAsync("api/admin/config");
        _logger.LogInformation("GPIO Config");
        return await response.Content.ReadAsStringAsync();
    }

    public async Task<bool> OpenPin(int pinNumber)
    {
        var httpClient = _httpClientFactory.CreateClient("AdminApi");
        var response = await httpClient.PostAsync($"api/gpio/open?pinNumber={pinNumber}", null);
        _logger.LogInformation($"GPIO pin opened {pinNumber}");
        return response.StatusCode == HttpStatusCode.OK;
    }

    public async Task<bool> ClosePin(int pinNumber)
    {
        var httpClient = _httpClientFactory.CreateClient("AdminApi");
        var response = await httpClient.PostAsync($"api/gpio/close?pinNumber={pinNumber}", null);
        _logger.LogInformation($"GPIO pin closed {pinNumber}");
        return response.StatusCode == HttpStatusCode.OK;
    }

    public async Task<bool> CloseAllPins()
    {
        var httpClient = _httpClientFactory.CreateClient("AdminApi");
        var response = await httpClient.PostAsync("api/gpio/close-all", null);
        _logger.LogInformation("All GPIO pins closed");
        return response.StatusCode == HttpStatusCode.OK;
    }
}