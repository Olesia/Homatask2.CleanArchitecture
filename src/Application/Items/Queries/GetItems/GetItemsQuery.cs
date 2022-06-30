using AutoMapper;
using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Queries.GetItems;

public record GetItemsQuery : IRequest<IEnumerable<ItemDto>>
{
    public int Id { get; init; }
    public string Name { get; init; }
    public string? Description { get; init; }
    public string? Image { get; init; }

    public float Price { get; init; }
    public uint Amount { get; init; }
    public int CategoryId { get; init; }
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
        try
        {
            var categories = await _repository.List(cancellationToken);
            return _mapper.Map<IEnumerable<ItemDto>>(categories);
        }
        catch (Exception)
        {
            throw;
        }
    }
}