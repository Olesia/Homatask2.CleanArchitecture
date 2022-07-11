using System.Linq.Expressions;
using Homatask2.CleanArchitecture.Application.Common;
using Homatask2.CleanArchitecture.Application.Common.Exceptions;
using Homatask2.CleanArchitecture.Domain.Entities;
using InterfaceAdapter.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace InterfaceAdapter.Repositories;

public class ItemRepository : IRepository<Item>
{
    private readonly IApplicationDbContext _dbContext;

    public ItemRepository(IApplicationDbContext dbContext)
    {
        _dbContext = dbContext;
    }
    
    public async Task<Item> GetById(int id, CancellationToken cancellationToken)
    {
        var result = await _dbContext.Items.SingleOrDefaultAsync(c => c.Id == id, cancellationToken);
        return result ?? throw new NotFoundEntityException("Item was not found", id);
    }

    public async Task<IEnumerable<Item>> List(CancellationToken cancellationToken)
    {
        return await _dbContext.Items.ToListAsync(cancellationToken);
    }

    public async Task<IEnumerable<Item>> List(Expression<Func<Item, bool>>? predicate, int? pageNumber, int? pageSize, CancellationToken cancellationToken)
    {
        IQueryable<Item> result;
        if (pageNumber != null && pageSize != null)
        {
            result = (predicate == null) ?
                _dbContext.Items.Skip((pageNumber.Value - 1) * pageSize.Value).Take(pageSize.Value) :
                _dbContext.Items.Where(predicate).Skip((pageNumber.Value - 1) * pageSize.Value).Take(pageSize.Value);
        }
        else
        {
            result = (predicate == null) ?
                _dbContext.Items :
                _dbContext.Items.Where(predicate);
        }
        return await result.ToListAsync(cancellationToken);
    }

    public async Task Insert(Item entity, CancellationToken cancellationToken)
    {
        _dbContext.Items.Add(entity);
        await _dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task Update(Item entity, CancellationToken cancellationToken)
    {
        var categoryToUpdate = await _dbContext.Items.SingleOrDefaultAsync(c => c.Id == entity.Id, cancellationToken);

        if (categoryToUpdate == null)
        {
            throw new NotFoundEntityException($"Item with name{entity.Name} was not found", entity.Id);
        }

        categoryToUpdate.Name = entity.Name;
        categoryToUpdate.Image = entity.Image;
        categoryToUpdate.Price = entity.Price;
        categoryToUpdate.Amount = entity.Amount;
        await _dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task Delete(int id, CancellationToken cancellationToken)
    {
        var entity = _dbContext.Items.Find(id);
        if (entity == null)
        {
            throw new NotFoundEntityException("Category was not found: ", id);
        }

        _dbContext.Items.Remove(entity);
        await _dbContext.SaveChangesAsync(cancellationToken);
    }
}
