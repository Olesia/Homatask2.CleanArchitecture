using Homatask2.CleanArchitecture.Domain.Entities;

using Microsoft.EntityFrameworkCore;

namespace InterfaceAdapter.Interfaces;

public interface IApplicationDbContext
{
    DbSet<Category> Categories { get; }

    DbSet<Item> Items { get; }

    Task<int> SaveChangesAsync(CancellationToken cancellationToken);
}
