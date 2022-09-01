using System.ComponentModel.DataAnnotations;

namespace Homatask2.CleanArchitecture.Domain.Entities;

public class Category : BaseEntity
{
    [MaxLength(50)]
    public string Name { get; set; }

    public string? Image { get; set; }

    public Category? ParentCategory { get; private set; }

    public int? ParentCategoryId { get; set; }

    public Category()
    {
        Name = Guid.NewGuid().ToString();
        Image = null;
    }
}
