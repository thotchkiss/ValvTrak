using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Rawson.Utilities.Tests
{
    [TestClass]
    public class Passwords
    {
        [TestMethod]
        public void GetPassword()
        {
            string password = MembershipProxy.GetDecryptedPassword("appadmin");
            Assert.IsNotNull(password);
        }
    }
}
