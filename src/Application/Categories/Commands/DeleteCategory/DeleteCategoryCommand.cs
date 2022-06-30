using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Categories.Commands.DeleteCategory;

public record DeleteCategoryCommand(int Id) : IRequest;

public class DeleteCategoryCommandHandler : IRequestHandler<DeleteCategoryCommand>
{
    private readonly IRepository<Category> _repository;

    public DeleteCategoryCommandHandler(IRepository<Category> repository)
    {
        _repository = repository;
    }

    public async Task<Unit> Handle(DeleteCategoryCommand request, CancellationToken cancellationToken)
    {

        await _repository.Delete(request.Id, cancellationToken);

        return Unit.Value;
    }
}