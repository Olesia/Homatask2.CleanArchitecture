using Homatask2.CleanArchitecture.Application.Categories.Queries;
using Homatask2.CleanArchitecture.Application.Items.Queries;

namespace Homatask2.CleanArchitecture.WebUI.Services;

public static class PrintService
{
    public static void PrintCategory(CategoryDto category)
    {
        Console.WriteLine($"Name: {category.Name}");
    }
    public static void PrintCategoryList(IEnumerable<CategoryDto> categoryList)
    {
        foreach (var category in categoryList)
        {
            PrintCategory(category);
        }
    }

    public static void PrintItem(ItemDto item)
    {
        Console.WriteLine($"Name: {item.Name}, Description: {item.Description}");
    }

    public static void PrintItemList(IEnumerable<ItemDto> itemList)
    {
        foreach (var item in itemList)
        {
            PrintItem(item);
        }
    }
}
