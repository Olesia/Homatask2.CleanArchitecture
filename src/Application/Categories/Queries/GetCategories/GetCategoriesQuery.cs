using AutoMapper;

using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Entities;

using MediatR;

namespace Homatask2.CleanArchitecture.Application.Categories.Queries.GetCategories;

public record GetCategoriesQuery : IRequest<IEnumerable<CategoryDto>>;

public class GetCategoriesQueryHandler : IRequestHandler<GetCategoriesQuery, IEnumerable<CategoryDto>>
{
    private readonly IRepository<Category> _repository;
    private readonly IMapper _mapper;

    public GetCategoriesQueryHandler(IRepository<Category> repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public async Task<IEnumerable<CategoryDto>> Handle(GetCategoriesQuery request, CancellationToken cancellationToken)
    {
        var categories = await _repository.List(cancellationToken);
        return _mapper.Map<IEnumerable<CategoryDto>>(categories);
    }
}
