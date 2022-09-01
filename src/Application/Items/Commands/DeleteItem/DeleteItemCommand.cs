using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Common;
using Homatask2.CleanArchitecture.Domain.Entities;

using MediatR;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.DeleteItem;

public record DeleteItemCommand(int Id) : IRequest;

public class DeleteItemCommandHandler : IRequestHandler<DeleteItemCommand>
{
    private readonly IRepository<Item> _repository;

    public DeleteItemCommandHandler(IRepository<Item> repository)
    {
        _repository = repository;
    }

    public async Task<Unit> Handle(DeleteItemCommand request, CancellationToken cancellationToken)
    {
        await _repository.Delete(request.Id, cancellationToken);

        return Unit.Value;
    }
}
