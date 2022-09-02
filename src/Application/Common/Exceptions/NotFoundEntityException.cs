using System.Runtime.Serialization;

namespace Homatask2.CleanArchitecture.Application.Common.Exceptions;

[Serializable]
public class NotFoundEntityException : Exception
{
    public NotFoundEntityException()
        : base()
    {
    }

    public NotFoundEntityException(string message)
        : base(message)
    {
    }

    public NotFoundEntityException(string message, Exception innerException)
        : base(message, innerException)
    {
    }

    public NotFoundEntityException(string name, object key)
        : base($"Entity \"{name}\" ({key}) was not found.")
    {
    }

    protected NotFoundEntityException(SerializationInfo info, StreamingContext context)
        : base(info, context)
    {
        
    }
}
