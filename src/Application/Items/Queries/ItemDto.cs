using Homatask2.CleanArchitecture.Application.Common.Mappings;
using Homatask2.CleanArchitecture.Domain.Entities;

namespace Homatask2.CleanArchitecture.Application.Items.Queries
{
    public class ItemDto : IMapFrom<Item>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }

        public float Price { get; set; }
        public uint Amount { get; set; }
        public int CategoryId { get; set; }
    }
}