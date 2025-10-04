using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models.Common;

namespace TestProject.Application.Users.Commands.UpdateUser;

public record UpdateUserCommand : IRequest<ResponseBase>
{
    public int Id { get; set; }
    public required string Name { get; set; }
    public required string Email { get; set; }
}
public class UpdateUserCommandValidator : AbstractValidator<UpdateUserCommand>
{
    public UpdateUserCommandValidator()
    {
        RuleFor(x => x.Id)
           .NotEmpty().WithMessage("Id is required.")
           .NotNull().WithMessage("Id must required");

        RuleFor(x => x.Email)
            .EmailAddress().WithMessage("Invalid email format.")
           .NotEmpty().WithMessage("Email is required.")
           .NotNull().WithMessage("Email must required");
    }
}
public class UpdateUserCommandHandler : IRequestHandler<UpdateUserCommand, ResponseBase>
{
    private readonly IIdentityService _identityService;



    public UpdateUserCommandHandler(IIdentityService identityService)
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

    public async Task<ResponseBase> Handle(UpdateUserCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var user = await _identityService.GetUserByEmail(request.Email);
            if (user != null)
            {
                return ErrorResponse("Email Already Exists");
            }

            await _identityService.UpdateUserAsync(request.Id, request.Name,request.Email);
                return new ResponseBase
                {
                    Status = true,
                    Message = "Record Updated Successfully"
                };

        }
        catch (Exception ex)
        {
            return ErrorResponse(ex.Message);
        }
    }
}
