using System.ComponentModel.DataAnnotations.Schema;

namespace Homatask2.CleanArchitecture.Domain.Entities
{
    public class Category : BaseEntity
    {
        public string Name { get; set; }

        public string? Image { get; set; }

        public virtual Category? ParentCategory { get; private set; }

        public int? ParentCategoryId { get; set; }
    }
}