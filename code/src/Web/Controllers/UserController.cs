using Microsoft.AspNetCore.Mvc;
using TestProject.Application.Users.Commands.CreateUser;
using TestProject.Application.Users.Commands.UpdateUser;
using TestProject.Application.Users.Queries.GetUsersWithPagination;

namespace TestProject.Web.Controller;
[Route("api/[controller]")]
[ApiController]
public class UserController : ControllerBase
{
    [HttpPost("create")]
    public async Task<IResult> CreateUserForAdminPortal(ISender sender, CreateUserForAdminPortalCommand query)
    {
        var result = await sender.Send(query);
        return result.Status ? Results.Ok(result) : Results.BadRequest(result);
    }

    [HttpPut("update")]
    public async Task<IResult> UpdateUser(ISender sender, UpdateUserCommand command)
    {
        var result = await sender.Send(command);
        return result.Status ? Results.Ok(result) : Results.BadRequest(result);
    }

    [HttpDelete("delete/{userId}")]
    public async Task<IResult> DeleteUser(ISender sender,[FromRoute] int userId)
    {
        var command = new DeleteUserCommand { Id = userId };
        var result = await sender.Send(command);

            return result.Status ? Results.Ok(result) : Results.BadRequest(result);
    }

    [HttpGet("getAllUsers")]
    public async Task<IResult> GetAllUsers(ISender sender)
    {
        var result = await sender.Send(new GetUsersWithPaginationQuery());
        return result.Status ? Results.Ok(result) : Results.BadRequest(result);
    }

    [HttpGet("getUserById")]
    public async Task<IResult> GetUserById(ISender sender, [FromQuery] string userId)
    {
        var result = await sender.Send(new GetUserByIdQuery { UserId = userId });
        return result.Status ? Results.Ok(result) : Results.BadRequest(result);
    }

}
