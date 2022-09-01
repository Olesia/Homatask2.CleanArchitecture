using FluentValidation;

namespace Homatask2.CleanArchitecture.Application.Items.Commands.CreateItem;

public class CreateItemCommandValidator : AbstractValidator<CreateItemCommand>
{
    public CreateItemCommandValidator()
    {
        RuleFor(v => v.Name)
            .NotEmpty().WithMessage("Name is required.")
            .MaximumLength(50).WithMessage("Title must not exceed 50 characters.");
    }
}
