using System.Data.Common;
using Microsoft.AspNetCore.Identity;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Configuration;
using TestProject.Application.Common.Interfaces;
using TestProject.Infrastructure.Data;
using TestProject.Infrastructure.Data.Interceptors;
using TestProject.Infrastructure.Identity;

namespace Microsoft.Extensions.DependencyInjection;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("DefaultConnection");

        services.AddScoped<ISaveChangesInterceptor, DispatchDomainEventsInterceptor>();

        services.AddDbContext<ApplicationDbContext>((sp, options) =>
        {
            options.AddInterceptors(sp.GetServices<ISaveChangesInterceptor>());

            options.UseSqlServer(connectionString);
        }, ServiceLifetime.Transient);

        services.AddTransient(typeof(DbConnection), (IServiceProvider) => InitializeDatabase(connectionString!));

        services.AddScoped<IApplicationDbContext>(provider => provider.GetRequiredService<ApplicationDbContext>());


        services.AddAuthentication()
            .AddBearerToken(IdentityConstants.BearerScheme);

        services.AddAuthorizationBuilder();

        services
            .AddIdentityCore<ApplicationUser>()
            .AddRoles<ApplicationRole>()
            .AddEntityFrameworkStores<ApplicationDbContext>()
            .AddDefaultTokenProviders()
            .AddApiEndpoints();

        services.AddSingleton(TimeProvider.System);
        services.AddTransient<IIdentityService, IdentityService>();



        return services;
    }


    private static object InitializeDatabase(string cconnectionString)
    {
        // [START sqlserver_connection]
        var connectionString = new SqlConnectionStringBuilder(cconnectionString);
        DbConnection connection = new SqlConnection(connectionString.ConnectionString);
        // [END sqlserver_connection]
        return connection;
    }
}
