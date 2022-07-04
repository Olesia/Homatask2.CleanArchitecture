using System.Linq.Expressions;
using AutoMapper;
using Homatask2.CleanArchitecture.Application.Common;
using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Queries.GetItems;

public record GetItemsQuery : IRequest<IEnumerable<ItemDto>>
{
    public int? CategoryId { get; set; } = null;
    public int PageNumber { get; init; } = 1;
    public int PageSize { get; init; } = 10;
}

public class GetItemsQueryHandler : IRequestHandler<GetItemsQuery, IEnumerable<ItemDto>>
{
    private readonly IRepository<Item> _repository;
    private readonly IMapper _mapper;

    public GetItemsQueryHandler(IRepository<Item> repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public async Task<IEnumerable<ItemDto>> Handle(GetItemsQuery request, CancellationToken cancellationToken)
    {
        if (request == null) { return Enumerable.Empty<ItemDto>(); }

        Expression<Func<Item, bool>>? categoryFilter = (request.CategoryId != null) ? e => e.CategoryId == request.CategoryId : null;
        var categories = await _repository.List(categoryFilter, request.PageNumber, request.PageSize, cancellationToken);
        return _mapper.Map<IEnumerable<ItemDto>>(categories);
    }
}