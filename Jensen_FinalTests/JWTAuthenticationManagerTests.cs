using Microsoft.VisualStudio.TestTools.UnitTesting;
using Jensen_Final;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Jensen_Final.Controllers;

namespace Jensen_Final.Tests
{
    [TestClass()]

    public class JwtAuthenticationManagerTests
    {
        [TestMethod()]
        public void AuthenticateTest()
        {
            JWTAuthenticationManager manager = new JWTAuthenticationManager("fakekeynotlegit12344556!$!");

            User user = new User
            {
                username = "DMV",

                password = "DMVPWD"
            };

            var ret = manager.Authenticate(user.username, user.password);

            Assert.IsNotNull(ret);
        }

        [TestMethod()]
        public void AuthenticateTestPasswordCheck()
        {
            JWTAuthenticationManager manager = new JWTAuthenticationManager("fakekeynotlegit12344556!$!");

            User user = new User
            {
                username = "LAW",

                password = "LAWPWD"
            };

            var ret = manager.Authenticate(user.username, user.password);

            Assert.AreNotEqual(user.password, "DMVPWD");
        }
    }

}