using Homatask2.CleanArchitecture.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Homatask2.CleanArchitecture.Infrastructure.Persistence.Configurations;

public class ItemConfiguration : IEntityTypeConfiguration<Item>
{
    public void Configure(EntityTypeBuilder<Item> builder)
    {
        builder.Property(p => p.Name)
            .IsRequired()
            .HasMaxLength(50);
        builder.Property(p => p.Category)
            .IsRequired();
        builder.Property(p => p.Price)
            .IsRequired();
        builder.Property(p => p.Amount)
            .IsRequired();
    }
}