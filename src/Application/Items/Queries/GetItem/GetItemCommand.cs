using AutoMapper;

using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Entities;

using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Queries.GetItem;
public record GetItemQuery(int Id) : IRequest<ItemDto>;

public class GetCategoryQueryHandler : IRequestHandler<GetItemQuery, ItemDto>
{
    private readonly IRepository<Item> _repository;
    private readonly IMapper _mapper;

    public GetCategoryQueryHandler(IRepository<Item> repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public async Task<ItemDto> Handle(GetItemQuery request, CancellationToken cancellationToken)
    {
        var result = await _repository.GetById(request.Id, cancellationToken);
        return _mapper.Map<ItemDto>(result);
    }
}
