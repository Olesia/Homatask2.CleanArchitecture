using Homatask2.CleanArchitecture.Application.Common.Mappings;
using Homatask2.CleanArchitecture.Domain.Entities;

namespace Homatask2.CleanArchitecture.Application.Items.Queries;

public class ItemDto : IMapFrom<Item>
{ 
    public int Id { get; set; }
    #pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
    public string Name { get; set; }
    #pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
    public string? Description { get; set; }
    public string? Image { get; set; }

    public decimal Price { get; set; }
    public uint Amount { get; set; }
    public int CategoryId { get; set; }
}
