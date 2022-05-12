using Microsoft.VisualStudio.TestTools.UnitTesting;
using Jensen_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jensen_Final.Models.Tests
{
    [TestClass()]
    public class SSN_CheckTests
    {
        [TestMethod()]
        public void SSNCheckTest()
        {
            // Assign    
            var driver = new Driver();

            // Act
            driver.Ssn = "547-77-8987";

            // Assert
            Assert.AreEqual("547-77-8987", driver.Ssn);

        }
    }
}

