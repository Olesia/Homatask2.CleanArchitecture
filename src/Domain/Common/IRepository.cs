using System.Linq.Expressions;

namespace Homatask2.CleanArchitecture.Domain.Common;
public interface IRepository<T> where T : BaseEntity
{
    Task<IEnumerable<T>> List(CancellationToken cancellationToken);
    Task<IEnumerable<T>> List(Expression<Func<Item, bool>>? predicate, int pageNumber, int pageSize, CancellationToken cancellationToken);
    Task<T> GetById(int id, CancellationToken cancellationToken);
    Task Insert(T entity, CancellationToken cancellationToken);
    Task Update(T entity, CancellationToken cancellationToken);
    Task Delete(int id, CancellationToken cancellationToken);
}
