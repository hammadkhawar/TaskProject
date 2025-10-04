using TestProject.Application.Common.Models;
using TestProject.Application.Common.Models.User;

namespace TestProject.Application.Common.Interfaces;

public interface IIdentityService
{
    Task<(Result Result, int UserId)> CreateUserAsync(string name, string email, string password);
    Task<Result> DeleteUserAsync(int userId);
    Task<List<ApplicationUserDto>> GetUsersAsync(int userId = 0);
    Task<ApplicationUserDto?> GetUserByEmail(string email);
    Task<ApplicationUserDto?> GetUserByIdAsync(string userId);
    Task<(Result Result, int UserId)> UpdateUserAsync(int userId, string name,string email);
}
