using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models.Common;

namespace TestProject.Application.Users.Queries.GetUsersWithPagination;

public record GetUserByIdQuery : IRequest<ResponseBase>
{
    public string? UserId { get; set; }
}

public class GetUsersByIdQueryHandler : IRequestHandler<GetUserByIdQuery, ResponseBase>
{
    private readonly IIdentityService _identityService; 

    public GetUsersByIdQueryHandler(IIdentityService identityService)
    {
        _identityService = identityService;
    }

    public async Task<ResponseBase> Handle(GetUserByIdQuery request, CancellationToken cancellationToken)
    {
        try
        {
            if (request.UserId == null)
            {
                return new ResponseBase
                {
                    Status = false,
                    Error = "Invalid user id"
                };
            }

            var user = await _identityService.GetUserByIdAsync(request.UserId);

            if (user == null)
            {
                return new ResponseBase
                {
                    Status = false,
                    Error = "User not found"
                };
            }

            return new ResponseBase
            {
                Status = true,
                Data = user
            };
        }
        catch (Exception ex)
        {
            return new ResponseBase
            {
                Status = false,
                Error = ex.Message
            };
        }
    }
}
