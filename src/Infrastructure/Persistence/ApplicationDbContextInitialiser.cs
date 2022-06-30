using Homatask2.CleanArchitecture.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Homatask2.CleanArchitecture.Infrastructure.Persistence;

public class ApplicationDbContextInitialiser
{
    private readonly ApplicationDbContext _context;

    public ApplicationDbContextInitialiser(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task InitialiseAsync()
    {
        try
        {
            if (_context.Database.IsSqlServer())
            {
                await _context.Database.MigrateAsync();
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public async Task SeedAsync()
    {
        try
        {
            await TrySeedAsync();
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public async Task TrySeedAsync()
    {
        if (!_context.Categories.Any())
        {
            _context.Categories.Add(new Category { Name = "Category 1" });
            _context.Categories.Add(new Category { Name = "Category 2" });
            _context.Categories.Add(new Category { Name = "Category 3" });
            await _context.SaveChangesAsync();
        }
        
        if (!_context.Items.Any())
        {
            var categoryId = _context.Categories.Where(c => c.Name == "Category 1").FirstOrDefault()?.Id;
            if(categoryId != null)
            {
                _context.Items.Add(new Item { Name = "Item 1", Description = "Description 1", Price = 100, Amount = 5, CategoryId = categoryId.Value });
                _context.Items.Add(new Item { Name = "Item 2", Description = "Description 2", Price = 500, Amount = 10, CategoryId = categoryId.Value });
                _context.Items.Add(new Item { Name = "Item 3", Description = "Description 3", Price = 1000, Amount = 15, CategoryId = categoryId.Value });
            }
            await _context.SaveChangesAsync();
        }
    }
}