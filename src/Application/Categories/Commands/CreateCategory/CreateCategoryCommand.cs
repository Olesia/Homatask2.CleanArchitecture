using AutoMapper;
using Homatask2.CleanArchitecture.Application.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Categories.Commands.CreateCategories;

public record CreateCategoryCommand : IRequest<int>
{
    public int Id { get; set; }

    public string Name { get; set; }

    public string? Image { get; set; }

    public int? ParentCategoryId { get; set; }
}

public class CreateCategoryCommandHandler : IRequestHandler<CreateCategoryCommand, int>
{
    private readonly IRepository<Category> _repository;
    private readonly IMapper _mapper;

    public CreateCategoryCommandHandler(IRepository<Category> repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public async Task<int> Handle(CreateCategoryCommand request, CancellationToken cancellationToken)
    {
        var entity = new Category
        {
            Name = request.Name,
            Image = request.Image,
            ParentCategoryId = request.ParentCategoryId
        };
        await _repository.Insert(entity, cancellationToken);
        return entity.Id;
    }
}