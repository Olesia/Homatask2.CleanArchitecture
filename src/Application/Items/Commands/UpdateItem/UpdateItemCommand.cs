using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;
using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.UpdateItem;

public record UpdateItemCommand : IRequest
{
    public int Id { get; init; }
    public string Name { get; init; }
    public string Description { get; init; }
    public string Image { get; init; }
    public float Price { get; init; }
    public uint Amount { get; init; }
    public int CategoryId { get; init; }
}

public class UpdateItemCommandHandler : IRequestHandler<UpdateItemCommand>
{
    private readonly IRepository<Item> _repository;

    public UpdateItemCommandHandler(IRepository<Item> repository)
    {
        _repository = repository;
    }

    public async Task<Unit> Handle(UpdateItemCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var entity = await _repository.GetById(request.Id, cancellationToken);
            entity.Name = request.Name;
            entity.Image = request.Image;
            entity.Amount = request.Amount;
            entity.Price = request.Price;
            entity.Description = request.Description;
            entity.CategoryId = request.CategoryId;

            await _repository.Update(entity, cancellationToken);

            return Unit.Value;
        }
        catch (Exception)
        {
            throw;
        }
        
    }
}