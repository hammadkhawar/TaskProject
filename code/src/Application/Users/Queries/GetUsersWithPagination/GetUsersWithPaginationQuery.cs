using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models.Common;

namespace TestProject.Application.Users.Queries.GetUsersWithPagination;

public record GetUsersWithPaginationQuery : IRequest<ResponseBase>
{
}

public class GetUsersWithPaginationQueryHandler : IRequestHandler<GetUsersWithPaginationQuery, ResponseBase>
{
    private readonly IIdentityService _identityService;

    public GetUsersWithPaginationQueryHandler(IIdentityService identityService)
    {
        _identityService = identityService;
    }

    public async Task<ResponseBase> Handle(GetUsersWithPaginationQuery request, CancellationToken cancellationToken)
    {
        try
        {
            var usersList = await _identityService.GetUsersAsync();

            return new ResponseBase()
            {
                Status = true,
                Data = usersList,
            };
        }
        catch (Exception ex)
        {
            return new ResponseBase()
            {
                Status = false,
                Error = ex.Message,
            };
        }
    }
}
