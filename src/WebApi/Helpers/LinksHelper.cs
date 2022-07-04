using Homatask2.CleanArchitecture.Domain.Entities.HateoasLinks;

namespace WebApi.Helpers;

public class LinksHelper
{
    private readonly LinkGenerator _linkGenerator;

    public LinksHelper(LinkGenerator linkGenerator)
    {
        _linkGenerator = linkGenerator;
    }

    public IEnumerable<Link> CreateLinksOfCategory(HttpContext context, int id)
    {
        var links = new List<Link>
        {
            new Link(_linkGenerator.GetUriByAction(context, "get", "categories", values: new { id }) ?? string.Empty,
                    "self",
                    "GET"),
            new Link(_linkGenerator.GetUriByAction(context, "delete", "categories", values: new { id }) ?? string.Empty,
                    "delete_category",
                    "DELETE"),
            new Link(_linkGenerator.GetUriByAction(context, "update", "categories", values: new { id }) ?? string.Empty,
                    "update_category",
                    "PUT")
        };
        return links;
    }
}
