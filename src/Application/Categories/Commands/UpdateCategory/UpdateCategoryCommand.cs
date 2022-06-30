using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Categories.Commands.UpdateCategory;

public record UpdateCategoryCommand : IRequest
{
    public int Id { get; init; }

    public string Name { get; init; }

    public string? Image { get; init; }

    public int? ParentCategoryId { get; init; }
}

public class UpdateCategorytCommandHandler : IRequestHandler<UpdateCategoryCommand>
{
    private readonly IRepository<Category> _repository;

    public UpdateCategorytCommandHandler(IRepository<Category> repository)
    {
        _repository = repository;
    }

    public async Task<Unit> Handle(UpdateCategoryCommand request, CancellationToken cancellationToken)
    {
        var entity = await _repository.GetById(request.Id, cancellationToken);
        entity.Name = request.Name;
        entity.Image = request.Image;
        entity.ParentCategoryId = request.ParentCategoryId;
        
        await _repository.Update(entity, cancellationToken);
        
        return Unit.Value;
    }
}