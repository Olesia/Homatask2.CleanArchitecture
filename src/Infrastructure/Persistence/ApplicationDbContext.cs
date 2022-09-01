using Homatask2.CleanArchitecture.Domain.Entities;

using InterfaceAdapter.Interfaces;

using MediatR;

using Microsoft.EntityFrameworkCore;


namespace Homatask2.CleanArchitecture.Infrastructure.Persistence;

public class ApplicationDbContext : DbContext, IApplicationDbContext
{
    private readonly IMediator _mediator;

    public ApplicationDbContext(
        IMediator mediator,
        DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
        _mediator = mediator;
    }

    public DbSet<Category> Categories => Set<Category>();

    public DbSet<Item> Items => Set<Item>();

    protected override void OnModelCreating(ModelBuilder builder)
    {
        builder.Entity<Category>()
            .HasOne(v => v.ParentCategory)
            .WithOne()
            .HasForeignKey<Category>(c => c.ParentCategoryId)
            .OnDelete(DeleteBehavior.ClientCascade);

        base.OnModelCreating(builder);
    }

    public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await base.SaveChangesAsync(cancellationToken);
    }
}
