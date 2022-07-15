using Homatask2.CleanArchitecture.Domain.Entities;

namespace Homatask2.CleanArchitecture.Application.Common.Interfaces;

public interface IMessagePublisher
{
    Task SendMessageToUpdateItem(Item updatedItem);
}
