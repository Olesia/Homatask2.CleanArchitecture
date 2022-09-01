using Homatask2.CleanArchitecture.Application.Categories.Commands.CreateCategories;
using Homatask2.CleanArchitecture.Application.Categories.Commands.DeleteCategory;
using Homatask2.CleanArchitecture.Application.Categories.Commands.UpdateCategory;
using Homatask2.CleanArchitecture.Application.Categories.Queries;
using Homatask2.CleanArchitecture.Application.Categories.Queries.GetCategories;
using Homatask2.CleanArchitecture.Application.Categories.Queries.GetCategory;
using Homatask2.CleanArchitecture.Application.Common.Exceptions;
using Homatask2.CleanArchitecture.Domain.Entities.HateoasLinks;

using Microsoft.AspNetCore.Mvc;

using WebApi.Helpers;

namespace WebApi.Controllers;
[Route("api/[controller]")]
[ApiController]
public class CategoriesController : ApiController
{
    private readonly LinksHelper _linksHelper;

    public CategoriesController(LinksHelper linksHelper)
    {
        _linksHelper = linksHelper;
    }

    /// <summary>
    /// Gets the list of categories
    /// </summary>
    /// <returns> The list of categories </returns>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<CategoryDto>>> GetList()
    {
        var categories = await Mediator.Send(new GetCategoriesQuery());
        var categoriesList = new List<LinkWrapper<CategoryDto>>();

        foreach (var category in categories)
        {
            var categoryWrapper = new LinkWrapper<CategoryDto>(category)
            {
                Links = (List<Link>)_linksHelper.CreateLinksOfCategory(HttpContext, category.Id)
            };
            categoriesList.Add(categoryWrapper);
        }

        return Ok(categoriesList);
    }

    /// <summary>
    /// Gets category by id
    /// </summary>
    /// <param name="command"> Get category by id </param>
    /// <returns> Category </returns>
    [HttpGet("{id}")]
    public async Task<ActionResult<CategoryDto>> Get(int id)
    {
        try
        {
            var category = await Mediator.Send(new GetCategoryQuery(id));
            var categoryWrapper = new LinkWrapper<CategoryDto>(category)
            {
                Links = (List<Link>)_linksHelper.CreateLinksOfCategory(HttpContext, category.Id)
            };
            return Ok(categoryWrapper);
        }
        catch (NotFoundEntityException ex)
        {
            return BadRequest(ex.Message);
        }

    }

    /// <summary>
    /// Creates new category
    /// </summary>
    /// <param name="command"> Create new category command </param>
    /// <returns> Category id </returns>
    [HttpPost]
    public async Task<ActionResult<int>> Create(CreateCategoryCommand command)
    {
        var newCategoryId = await Mediator.Send(command);
        return Ok(newCategoryId);
    }

    /// <summary>
    /// Updates category
    /// </summary>
    /// <param name="id"> Id of category to update </param>
    /// <param name="command"> Command to update </param>
    /// <returns> Void </returns>
    [HttpPut("{id}")]
    public async Task<ActionResult> Update(int id, UpdateCategoryCommand command)
    {
        if (id != command.Id)
        {
            return BadRequest();
        }

        await Mediator.Send(command);

        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> Delete(int id)
    {
        await Mediator.Send(new DeleteCategoryCommand(id));

        return NoContent();
    }
}
