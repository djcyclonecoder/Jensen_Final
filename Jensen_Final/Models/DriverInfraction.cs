﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Jensen_Final.Models
{
    public partial class DriverInfraction
    {
        public int DriverInfractionId { get; set; }
        public int? DriverId { get; set; }
        public int? InfractionsNmvId { get; set; }
        public int? InfractionsMvId { get; set; }
        public int? WarrantId { get; set; }
    }
}