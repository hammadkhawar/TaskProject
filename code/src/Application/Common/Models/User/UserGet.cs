namespace TestProject.Application.Common.Models.User;
public class UserGet
{
    public int TotalCount { get; set; }
    public int Id { get; set; }
    public string? UserNameEn { get; set; }
    public string? UserNameAr { get; set; }
    public string? FirstNameEn { get; set; }
    public string? FirstNameAr { get; set; }
    public string? UserLastNameEn { get; set; }
    public string? UserLastNameAr { get; set; }
    public string? Email { get; set; }
    public string? PhoneNumber { get; set; }
    public int? EntityTypeId { get; set; }
}
