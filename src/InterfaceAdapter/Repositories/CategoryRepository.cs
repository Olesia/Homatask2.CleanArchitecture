using Homatask2.CleanArchitecture.Application.Common.Exceptions;
using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using InterfaceAdapter.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace InterfaceAdapter.Repositories
{
    public class CategoryRepository : IRepository<Category>
    {
        private readonly IApplicationDbContext _dbContext;

        public CategoryRepository(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Category> GetById(int id, CancellationToken cancellationToken)
        {
            var result = await _dbContext.Categories.SingleOrDefaultAsync(c => c.Id == id, cancellationToken);
            if (result == null)
            {
                throw new NotFoundException("Category was not found", id);
            }
            return result;
        }

        public async Task<IEnumerable<Category>> List(CancellationToken cancellationToken)
        {
            return await _dbContext.Categories.ToListAsync(cancellationToken);
        }
       
        public async Task Insert(Category entity, CancellationToken cancellationToken)
        {
            _dbContext.Categories.Add(entity);
            await _dbContext.SaveChangesAsync(cancellationToken);
        }

        public async Task Update(Category category, CancellationToken cancellationToken)
        {
            var entity = await _dbContext.Categories.SingleOrDefaultAsync(c => c.Id == category.Id, cancellationToken);

            if (entity == null)
            {
                throw new NotFoundException(category.Name, category.Id);
            }

            entity.Name = category.Name;
            entity.Image = category.Image;
            entity.ParentCategoryId = category.ParentCategoryId;
            await _dbContext.SaveChangesAsync(cancellationToken);
        }

        public async Task Delete(int id, CancellationToken cancellationToken)
        {
            var entity = _dbContext.Categories.Find(id);
            if (entity == null)
            {
                throw new NotFoundException("Category was not found: ", id);
            }

            _dbContext.Categories.Remove(entity);
            await _dbContext.SaveChangesAsync(cancellationToken);
        }
    }
}