using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Web.Security;
using System.Web.Profile;

namespace Rawson.Utilities
{
    public static class MembershipProxy
    {
        public static string GetDecryptedPassword(string userName)
        {
            MembershipUser user = Membership.Provider.GetUser(userName, false);

            string password = user.GetPassword();

            return password;    
        }
    }
}
