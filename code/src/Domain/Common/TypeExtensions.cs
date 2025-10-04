using System.Net.Mime;
using System.Reflection;

namespace TestProject.Domain.Common;
public static class TypeExtensions
{
    public static string GetDescription(this Enum genericEnum)
    {
        Type genericEnumType = genericEnum.GetType();
        MemberInfo[] memberInfo = genericEnumType.GetMember(genericEnum.ToString());

        if ((memberInfo != null && memberInfo.Length > 0))
        {
            var attributes = memberInfo[0].GetCustomAttributes(typeof(System.ComponentModel.DescriptionAttribute), false);
            if ((attributes != null && attributes.Count() > 0))
            {
                return ((System.ComponentModel.DescriptionAttribute)attributes.ElementAt(0)).Description;
            }
        }

        return genericEnum.ToString();
    }

}
