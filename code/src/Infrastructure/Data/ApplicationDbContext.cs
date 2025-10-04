using System.Reflection;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TestProject.Application.Common.Interfaces;
using TestProject.Infrastructure.Identity;

namespace TestProject.Infrastructure.Data;

public class ApplicationDbContext : IdentityDbContext<ApplicationUser, ApplicationRole, int>, IApplicationDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

        builder.Entity<ApplicationUser>().ToTable("asp_net_user");
        builder.Entity<IdentityUserToken<int>>().ToTable("asp_net_user_token");
        builder.Entity<IdentityUserLogin<int>>().ToTable("asp_net_user_login");
        builder.Entity<IdentityUserClaim<int>>().ToTable("asp_net_user_claim");
        builder.Entity<ApplicationRole>().ToTable("asp_net_role");
        builder.Entity<IdentityUserRole<int>>().ToTable("asp_net_user_role");
        builder.Entity<IdentityRoleClaim<int>>().ToTable("asp_net_role_claim");
    }
}
