using Homatask2.CleanArchitecture.Domain.Entities;

using InterfaceAdapter.Interfaces;

using Microsoft.EntityFrameworkCore;


namespace Homatask2.CleanArchitecture.Infrastructure.Persistence;

public class ApplicationDbContext : DbContext, IApplicationDbContext
{
    public ApplicationDbContext(
        DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Category> Categories => Set<Category>();

    public DbSet<Item> Items => Set<Item>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>()
            .HasOne(v => v.ParentCategory)
            .WithOne()
            .HasForeignKey<Category>(c => c.ParentCategoryId)
            .OnDelete(DeleteBehavior.ClientCascade);

        base.OnModelCreating(modelBuilder);
    }

    public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await base.SaveChangesAsync(cancellationToken);
    }
}
