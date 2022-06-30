using FluentValidation;

namespace Homatask2.CleanArchitecture.Application.Categories.Commands.CreateCategories;

public class CreateCategoryCommandValidator : AbstractValidator<CreateCategoryCommand>
{
    public CreateCategoryCommandValidator()
    {
        RuleFor(v => v.Name)
            .NotEmpty().WithMessage("Name is required.")
            .MaximumLength(50).WithMessage("Title must not exceed 50 characters.");
    }
}