using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models.Common;
using TestProject.Domain.Common;

namespace TestProject.Application.Users.Commands.CreateUser;

public record DeleteUserCommand : IRequest<ResponseBase>
{
   public int Id { get; set; }
}

public class DeleteUserCommandValidator : AbstractValidator<DeleteUserCommand>
{
    public DeleteUserCommandValidator()
    {
        RuleFor(x => x.Id)
           .GreaterThan(0)
           .WithMessage("UserId must be greater than 0.");
    }
}

public class DeleteUserCommandHandler : IRequestHandler<DeleteUserCommand, ResponseBase>
{
    private readonly IIdentityService _identityService;

    public DeleteUserCommandHandler(IIdentityService identityService)
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

    public async Task<ResponseBase> Handle(DeleteUserCommand request, CancellationToken cancellationToken)
    {
        try
        {
            await _identityService.DeleteUserAsync(request.Id);

            return new ResponseBase()
            {
                Status = true,
                Message = "Record Deleted Successfully"
            };
        }
        catch (Exception ex)
        {
            return ErrorResponse(ex.Message);
        }
    }
}
