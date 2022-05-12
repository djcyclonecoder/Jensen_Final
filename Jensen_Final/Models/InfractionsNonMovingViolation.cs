﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Jensen_Final.Models
{
    public partial class InfractionsNonMovingViolation
    {
        public int InfractionsNmvId { get; set; }
        public string DriversLicenseNumber { get; set; }
        public string VehicleLicensePlate { get; set; }
        public DateTime? DateOfInfraction { get; set; }
        public int? ParkingViolationIsChecked { get; set; }
        public int? BrokenTaillightIsChecked { get; set; }
        public int? FireHydrantParkingIsChecked { get; set; }
        public int? ExpiredRegistrationOrInsuranceIsChecked { get; set; }
        public int? LackOfRegistrationOrInsuranceIsChecked { get; set; }
        public int? VehicleMaintenanceIssueIsChecked { get; set; }
        public string DescriptionOfIncident { get; set; }
    }
}