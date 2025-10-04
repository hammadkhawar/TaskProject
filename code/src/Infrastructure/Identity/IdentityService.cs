using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using TestProject.Application.Common.Interfaces;
using TestProject.Application.Common.Models;
using TestProject.Application.Common.Models.User;

namespace TestProject.Infrastructure.Identity;

public class IdentityService : IIdentityService
{
    private readonly UserManager<ApplicationUser> _userManager;

    public IdentityService(
        UserManager<ApplicationUser> userManager)
    {
        _userManager = userManager;
    }

    public async Task<(Result Result, int UserId)> CreateUserAsync(string name, string email, string password)
    {
        var user = new ApplicationUser
        {
            Email = email,
            UserName = name,
            EmailConfirmed = false,
        };

        var result = await _userManager.CreateAsync(user, password);

        return (result.ToApplicationResult(), user.Id);
    }
    public async Task<(Result Result, int UserId)> UpdateUserAsync(int userId, string name, string email)
    {
        var user = await _userManager.FindByIdAsync(userId.ToString());

        if (user == null)
        {
            return (Result.Failure(new string[] { "User not found." }), 0);
        }


        user.Email = email;
        user.UserName = name;
        user.EmailConfirmed = false;

        var result = await _userManager.UpdateAsync(user);

        return (result.ToApplicationResult(), user.Id);
    }


    public async Task<Result> DeleteUserAsync(int userId)
    {
        var user = await _userManager.FindByIdAsync(userId.ToString());

        return user != null ? await DeleteUserAsync(user) : Result.Success();
    }

    public async Task<Result> DeleteUserAsync(ApplicationUser user)
    {
        var result = await _userManager.DeleteAsync(user);

        return result.ToApplicationResult();
    }

    public async Task<List<ApplicationUserDto>> GetUsersAsync(int userId = 0)
    {

        var userDtos = new List<ApplicationUserDto>();
        var users = await _userManager.Users.ToListAsync();

        foreach (var user in users)
        {
            var result = await _userManager.HasPasswordAsync(user);

            var userDto = new ApplicationUserDto
            {
                Id = user.Id,
                Name = user.UserName,
                Email = user.Email,
                PasswordHash = user.PasswordHash,
                //JoiningDate = user.JoiningDate,
                //IsAccountCreated = result
            };

            userDtos.Add(userDto);
        }

        if (userId > 0)
            return userDtos.Where(x => x.Id == userId).ToList();

        return userDtos.ToList();
    }

    
    public async Task<ApplicationUserDto?> GetUserByEmail(string email)
    {
        var user = await _userManager.FindByEmailAsync(email);
        if (user != null)
        {
            var userDto = new ApplicationUserDto
            {
                Id = user.Id,
                Email = user.Email,
            };
            return userDto;
        }

        return null;
    }

    public async Task<ApplicationUserDto?> GetUserByIdAsync(string userId)
    {
        var user = await _userManager.FindByIdAsync(userId);
        if (user != null)
        {
            var userDto = new ApplicationUserDto
            {
                Id = user.Id,
                Name = user.UserName,
                Email = user.Email,
                PasswordHash = user.PasswordHash,
                //JoiningDate = user.JoiningDate,
            };
            return userDto;
        }
        return null;
    }


}
