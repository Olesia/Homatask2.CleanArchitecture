using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Entities;

using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.UpdateItem;

public record UpdateItemCommand : IRequest
{
    public int Id { get; init; }
    public string Name { get; init; }
    public string Description { get; init; }
    public string Image { get; init; }
    public decimal Price { get; init; }
    public uint Amount { get; init; }
    public int CategoryId { get; init; }

    public UpdateItemCommand()
    {
        Name = string.Empty;
        Description = string.Empty;
        Image = string.Empty;
    }
}

public class UpdateItemCommandHandler : IRequestHandler<UpdateItemCommand>
{
    private readonly IRepository<Item> _repository;
    private readonly IMessagePublisher _publisher;

    public UpdateItemCommandHandler(IRepository<Item> repository, IMessagePublisher publisher)
    {
        _repository = repository;
        _publisher = publisher;
    }

    public async Task<Unit> Handle(UpdateItemCommand request, CancellationToken cancellationToken)
    {
        var entity = await _repository.GetById(request.Id, cancellationToken);
        entity.Name = request.Name;
        entity.Image = request.Image;
        entity.Amount = request.Amount;
        entity.Price = request.Price;
        entity.Description = request.Description;
        entity.CategoryId = request.CategoryId;

        await _repository.Update(entity, cancellationToken);

        await _publisher.SendMessageToUpdateItem(entity);

        return Unit.Value;
    }
}
