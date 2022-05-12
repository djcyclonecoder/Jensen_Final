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
    public class VIN_CheckTests
    {
        [TestMethod()]
        public void VINCheckTest()
        {
            // Assign    
            var vehicle = new Vehicle();

            // Act
            vehicle.Vin = "J1928374657483928";

            // Assert
            Assert.AreEqual("J1928374657483928", vehicle.Vin);
        }
    }
}