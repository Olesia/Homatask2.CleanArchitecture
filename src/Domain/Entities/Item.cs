namespace Homatask2.CleanArchitecture.Domain.Entities
{
    public class Item : BaseEntity
    {
        public string Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }

        public float Price { get; set; }
        public uint Amount { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; private set; }
    }
}