using Homatask2.CleanArchitecture.Application.Common.Mappings;
using Homatask2.CleanArchitecture.Domain.Entities;

namespace Homatask2.CleanArchitecture.Application.Categories.Queries;

public class CategoryDto : IMapFrom<Category>
{
    public int Id { get; set; }

    public string Name { get; set; }

    public string? Image { get; set; }

    public int? ParentCategoryId { get; set; }
    public Category? ParentCategory { get; private set; }
}