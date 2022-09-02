
using System.Text.Json;

using Azure.Messaging.ServiceBus;

using Homatask2.CleanArchitecture.Application.Common.Interfaces;
using Homatask2.CleanArchitecture.Domain.Entities;

namespace InterfaceAdapter.Publishers;

public class MessagePublisher : IMessagePublisher
{
    private const string CartTopic = "carttopic";

    private readonly ServiceBusClient _serviceBusClient;
    private ServiceBusSender? _sender;

    public MessagePublisher(ServiceBusClient serviceBusClient)
    {
        _serviceBusClient = serviceBusClient;
    }

    public async Task SendMessageToUpdateItem(Item updatedItem)
    {
        _sender = _serviceBusClient.CreateSender(CartTopic);
        var message = new ServiceBusMessage(JsonSerializer.Serialize(updatedItem));

        try
        {
            await _sender.SendMessageAsync(message);
        }
        finally
        {
            await _sender.DisposeAsync();
        }
    }
}
