using FluentValidation;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.UpdateItem;

public class UpdateItemCommandValidator : AbstractValidator<UpdateItemCommand>
{
    public UpdateItemCommandValidator()
    {
        RuleFor(v => v.Name)
            .NotEmpty().WithMessage("Name is required.")
            .MaximumLength(50).WithMessage("Title must not exceed 50 characters.");
    }
}
