using System.ComponentModel.DataAnnotations;

namespace Homatask2.CleanArchitecture.Domain.Entities;

public class Item : BaseEntity
{
    [MaxLength(50)]
    public string Name { get; set; }
    public string? Description { get; set; }
    public string? Image { get; set; }

    public decimal Price { get; set; }
    public uint Amount { get; set; }
    public int CategoryId { get; set; }
    public Category Category { get; private set; }
}