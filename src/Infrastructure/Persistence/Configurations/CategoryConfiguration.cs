using Homatask2.CleanArchitecture.Domain.Entities;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Homatask2.CleanArchitecture.Infrastructure.Persistence.Configurations;

public class CategoryConfiguration : IEntityTypeConfiguration<Category>
{
    public void Configure(EntityTypeBuilder<Category> builder)
    {
        builder.Property(t => t.Name)
            .IsRequired()
            .HasMaxLength(50);
    }
}
