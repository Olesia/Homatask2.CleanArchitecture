using Homatask2.CleanArchitecture.Application.Categories.Commands.CreateCategories;
using Homatask2.CleanArchitecture.Application.Categories.Commands.DeleteCategory;
using Homatask2.CleanArchitecture.Application.Categories.Commands.UpdateCategory;
using Homatask2.CleanArchitecture.Application.Categories.Queries.GetCategories;
using Homatask2.CleanArchitecture.Application.Categories.Queries.GetCategory;
using Homatask2.CleanArchitecture.Application.Items.Commands.CreateItem;
using Homatask2.CleanArchitecture.Application.Items.Commands.DeleteItem;
using Homatask2.CleanArchitecture.Application.Items.Commands.UpdateItem;
using Homatask2.CleanArchitecture.Application.Items.Queries.GetItem;
using Homatask2.CleanArchitecture.Application.Items.Queries.GetItems;
using Homatask2.CleanArchitecture.Infrastructure.Persistence;
using Homatask2.CleanArchitecture.WebUI.Services;

using MediatR;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddApplicationServices();
builder.Services.AddInfrastructureServices(builder.Configuration);
builder.Services.AddWebUIServices();

var app = builder.Build();

// Initialise and seed database
using (var scope = app.Services.CreateScope())
{
    var initialiser = scope.ServiceProvider.GetRequiredService<ApplicationDbContextInitialiser>();
    await initialiser.InitialiseAsync();
    await initialiser.SeedAsync();

    var mediator = scope.ServiceProvider.GetRequiredService<IMediator>();

    #region List Categories
    Console.WriteLine("\nList of existing Categories:");
    var categories = await mediator.Send(new GetCategoriesQuery());
    PrintService.PrintCategoryList(categories);

    #endregion

    #region Add Categories
    Console.WriteLine("\nAdd new category:");
    var newCategoryId = await mediator.Send(new CreateCategoryCommand("Category New", null, categories.First().Id));
    categories = await mediator.Send(new GetCategoriesQuery());
    PrintService.PrintCategoryList(categories);

    #endregion

    #region Get Category
    Console.WriteLine("\nGet new category:");
    var category = await mediator.Send(new GetCategoryQuery(newCategoryId));
    PrintService.PrintCategory(category);

    #endregion

    #region Update Category
    Console.WriteLine("\nUpdate category:");
    await mediator.Send(new UpdateCategoryCommand
    {
        Id = category.Id,
        Name = "Category New Updated",
        ParentCategoryId = category.ParentCategoryId
    });
    categories = await mediator.Send(new GetCategoriesQuery());
    PrintService.PrintCategoryList(categories);

    #endregion

    #region Remove Category
    Console.WriteLine("\nRemove category:");
    await mediator.Send(new DeleteCategoryCommand(newCategoryId));
    categories = await mediator.Send(new GetCategoriesQuery());
    PrintService.PrintCategoryList(categories);

    #endregion


    #region List Items
    Console.WriteLine("\nList of existing Items:");
    var items = await mediator.Send(new GetItemsQuery());
    PrintService.PrintItemList(items);

    #endregion

    #region Add Item
    Console.WriteLine("\nAdd new item:");
    var newItemId = await mediator.Send(new CreateItemCommand { Name = "Item New", CategoryId = categories.First().Id, Amount = 2, Price = 30 });
    items = await mediator.Send(new GetItemsQuery());
    PrintService.PrintItemList(items);

    #endregion

    #region Get Item
    Console.WriteLine("\nGet new Item:");
    var item = await mediator.Send(new GetItemQuery(newItemId));
    PrintService.PrintItem(item);

    #endregion

    #region Update Item
    Console.WriteLine("\nUpdate new item:");
    await mediator.Send(new UpdateItemCommand
    {
        Id = item.Id,
        Name = "Item New Updated",
        CategoryId = categories.First().Id,
        Amount = 2,
        Price = 20
    });
    items = await mediator.Send(new GetItemsQuery());
    PrintService.PrintItemList(items);

    #endregion

    #region Remove Item
    Console.WriteLine("\nRemove new item:");
    await mediator.Send(new DeleteItemCommand(newItemId));
    items = await mediator.Send(new GetItemsQuery());
    PrintService.PrintItemList(items);

    #endregion

}
