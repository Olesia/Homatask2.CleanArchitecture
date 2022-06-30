using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.CreateItem;

public record CreateItemCommand : IRequest<int>
{
    public string Name { get; init; }
    public string Description { get; set; }
    public string Image { get; set; }
    public float Price { get; set; }
    public uint Amount { get; set; }
    public int CategoryId { get; set; }
}

public class CreateItemCommandHandler : IRequestHandler<CreateItemCommand, int>
{
    private readonly IRepository<Item> _repository;

    public CreateItemCommandHandler(IRepository<Item> repository)
    {
        _repository = repository;
    }

    public async Task<int> Handle(CreateItemCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var entity = new Item
            {
                Name = request.Name,
                Image = request.Image,
                Description = request.Description,
                Amount = request.Amount,
                Price = request.Price,
                CategoryId = request.CategoryId
            };

            await _repository.Insert(entity, cancellationToken);
            return entity.Id;
        }
        catch (Exception)
        {
            throw;
        }
    }
}