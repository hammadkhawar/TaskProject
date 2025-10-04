using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models.Common;
using TestProject.Domain.Common;

namespace TestProject.Application.Users.Commands.CreateUser;

public record CreateUserForAdminPortalCommand : IRequest<ResponseBase>
{
    public required string Name { get; set; }
    public required string Email { get; set; }
    public required string Password { get; set; }
}

public class CreateUserForAdminPortalCommandValidator : AbstractValidator<CreateUserForAdminPortalCommand>
{
    public CreateUserForAdminPortalCommandValidator()
    {
        RuleFor(x => x.Name)
           .NotEmpty().WithMessage("UserNameEn is required.")
           .NotNull().WithMessage("UserNameEn must required")
           .MaximumLength(100).WithMessage("UserNameEn must not exceed 50 characters.");

        RuleFor(x => x.Email)
           .NotEmpty().WithMessage("Email is required.")
           .NotNull().WithMessage("Email must required")
             .EmailAddress().WithMessage("Invalid email format.")
           .MaximumLength(100).WithMessage("Email must not exceed 100 characters.");

        RuleFor(x => x.Password)
               .NotEmpty().WithMessage("Password is required.")
               .NotNull().WithMessage("Password must required");
    }
}

public class CreateUserForAdminPortalCommandHandler : IRequestHandler<CreateUserForAdminPortalCommand, ResponseBase>
{
    private readonly IIdentityService _identityService;

    public CreateUserForAdminPortalCommandHandler(IIdentityService identityService)
    {
        _identityService = identityService;
    }

    private ResponseBase ErrorResponse(string error)
    {
        return new ResponseBase
        {
            Status = false,
            Error = error
        };
    }

    public async Task<ResponseBase> Handle(CreateUserForAdminPortalCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var user = await _identityService.GetUserByEmail(request.Email);
            if (user != null)
            {
                return ErrorResponse("Email Already Exists");
            }

            var userCreateResult = await _identityService.CreateUserAsync(request.Name, request.Email,request.Password);

            if (!userCreateResult.Result.Succeeded)
            {
                return ErrorResponse(userCreateResult.Result.Errors[0]);
            }


            return new ResponseBase()
            {
                Status = true,
                Message = "Record Created Successfully"
            };
        }
        catch (Exception ex)
        {
            return ErrorResponse(ex.Message);
        }
    }
}
