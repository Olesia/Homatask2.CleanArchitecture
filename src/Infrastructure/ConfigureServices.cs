﻿using Azure.Messaging.ServiceBus;

using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Entities;
using Homatask2.CleanArchitecture.Infrastructure.Persistence;

using InterfaceAdapter.Interfaces;
using InterfaceAdapter.Publishers;
using InterfaceAdapter.Repositories;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Microsoft.Extensions.DependencyInjection;

public static class ConfigureServices
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services, IConfiguration configuration)
    {
        if (configuration.GetValue<bool>("UseInMemoryDatabase"))
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseInMemoryDatabase("Homatask2.CleanArchitectureDb"));
        }
        else
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"),
                    builder => builder.MigrationsAssembly(typeof(ApplicationDbContext).Assembly.FullName)));
        }

        services.AddScoped<IApplicationDbContext>(provider => provider.GetRequiredService<ApplicationDbContext>());

        services.AddScoped<ApplicationDbContextInitialiser>();

        services.AddScoped<IRepository<Item>, ItemRepository>();
        services.AddScoped<IRepository<Category>, CategoryRepository>();
        services.AddScoped<IMessagePublisher, MessagePublisher>();
        services.AddSingleton((s) =>
        {
            return new ServiceBusClient(configuration.GetConnectionString("AzureConnection"), new ServiceBusClientOptions() { TransportType = ServiceBusTransportType.AmqpWebSockets });
        });

        return services;
    }
}
