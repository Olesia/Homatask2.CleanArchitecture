using System.ComponentModel.DataAnnotations.Schema;

namespace Homatask2.CleanArchitecture.Domain.Common;

public abstract class BaseEntity
{
    public int Id { get; set; }
}
