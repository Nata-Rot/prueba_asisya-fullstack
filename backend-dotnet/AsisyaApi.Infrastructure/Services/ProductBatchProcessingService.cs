using System.Threading.Channels;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using AsisyaApi.Application.DTOs.Product;
using AsisyaApi.Application.Interfaces;

namespace AsisyaApi.Infrastructure.Services;

public class ProductBatchProcessingService : BackgroundService
{
    private readonly Channel<ProductBatchRequest> _queue;
    private readonly IServiceProvider _serviceProvider;
    private readonly ILogger<ProductBatchProcessingService> _logger;

    public ProductBatchProcessingService(IServiceProvider serviceProvider, ILogger<ProductBatchProcessingService> logger)
    {
        _serviceProvider = serviceProvider;
        _logger = logger;
        
        // Create a channel for queuing batch requests
        var options = new BoundedChannelOptions(100)
        {
            SingleWriter = false,
            SingleReader = true,
            AllowSynchronousContinuations = false,
            FullMode = BoundedChannelFullMode.Wait
        };
        
        _queue = Channel.CreateBounded<ProductBatchRequest>(options);
    }

    public async Task<string> QueueBatchAsync(IEnumerable<CreateProductDto> products)
    {
        var requestId = Guid.NewGuid().ToString();
        var request = new ProductBatchRequest
        {
            RequestId = requestId,
            Products = products.ToList(),
            CreatedAt = DateTime.UtcNow
        };

        await _queue.Writer.WriteAsync(request);
        return requestId;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        await foreach (var request in _queue.Reader.ReadAllAsync(stoppingToken))
        {
            try
            {
                _logger.LogInformation("Processing batch request {RequestId} with {ProductCount} products", 
                    request.RequestId, request.Products.Count);

                using var scope = _serviceProvider.CreateScope();
                var productService = scope.ServiceProvider.GetRequiredService<IProductService>();
                
                await productService.CreateBatchAsync(request.Products);
                
                _logger.LogInformation("Successfully processed batch request {RequestId}", request.RequestId);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error processing batch request {RequestId}", request.RequestId);
            }
        }
    }

    public override async Task StopAsync(CancellationToken cancellationToken)
    {
        _queue.Writer.Complete();
        await base.StopAsync(cancellationToken);
    }
}

public class ProductBatchRequest
{
    public string RequestId { get; set; } = string.Empty;
    public List<CreateProductDto> Products { get; set; } = new();
    public DateTime CreatedAt { get; set; }
}