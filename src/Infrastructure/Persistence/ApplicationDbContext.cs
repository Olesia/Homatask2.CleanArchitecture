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

    public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return await base.SaveChangesAsync(cancellationToken);
    }
}