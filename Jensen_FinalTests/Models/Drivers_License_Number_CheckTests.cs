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
    public class Drivers_License_Number_CheckTests
    {
        [TestMethod()]
        public void DriversLicenseNumberCheckTest()
        {
            // Assign    
            var license = new DriversLicense();

            // Act
            license.DriversLicenseNumber = "T1029384756473";

            // Assert
            Assert.AreEqual("T1029384756473", license.DriversLicenseNumber);
        }
    }
}