using Homatask2.CleanArchitecture.Domain.Entities.HateoasLinks;

public class LinkWrapper<T> : LinkResourceBase
{
    public T Value { get; set; }

    public LinkWrapper(T value)
    {
        Value = value;
    }
}
