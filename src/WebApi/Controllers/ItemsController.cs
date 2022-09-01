using Homatask2.CleanArchitecture.Application.Items.Commands.CreateItem;
using Homatask2.CleanArchitecture.Application.Items.Commands.DeleteItem;
using Homatask2.CleanArchitecture.Application.Items.Commands.UpdateItem;
using Homatask2.CleanArchitecture.Application.Items.Queries;
using Homatask2.CleanArchitecture.Application.Items.Queries.GetItems;

using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers;
[Route("api/[controller]")]
[ApiController]
public class ItemsController : ApiController
{
    /// <summary>
    /// Gets filtered and pageable list of items
    /// </summary>
    /// <param name="pageNumber"> Page number </param>
    /// <param name="pageSize"> Page size </param>
    /// <param name="categoryId"> Category Id </param>
    /// <returns> Page of items </returns>
    [HttpGet]
    public async Task<ActionResult<IEnumerable<ItemDto>>> GetFilteredList(int? pageNumber, int? pageSize, int? categoryId)
    {
        if (pageNumber < 1 || pageSize < 1)
        {
            return BadRequest("Page number and page size must be greater than 0");
        }
        var newGetItemsQuery = new GetItemsQuery { CategoryId = categoryId, PageNumber = pageNumber, PageSize = pageSize };
        var items = await Mediator.Send(newGetItemsQuery);
        return Ok(items);
    }

    /// <summary>
    /// Creates new item
    /// </summary>
    /// <param name="command"> Create item command </param>
    /// <returns> Created item's id </returns>
    [HttpPost]
    public async Task<ActionResult<int>> Create(CreateItemCommand command)
    {
        var newItemId = await Mediator.Send(command);
        return Ok(newItemId);
    }

    /// <summary>
    /// Updates the item
    /// </summary>
    /// <param name="id"> Id of item to update </param>
    /// <param name="command"> Update item command </param>
    /// <returns> Void</returns>
    [HttpPut("{id}")]
    public async Task<ActionResult> Update(int id, UpdateItemCommand command)
    {
        if (id != command.Id)
        {
            return BadRequest();
        }

        await Mediator.Send(command);

        return NoContent();
    }

    /// <summary>
    /// Deletes the item
    /// </summary>
    /// <param name="id"> Id of item to delete </param>
    /// <returns> Void </returns>
    [HttpDelete("{id}")]
    public async Task<ActionResult> Delete(int id)
    {
        await Mediator.Send(new DeleteItemCommand(id));

        return NoContent();
    }
}
