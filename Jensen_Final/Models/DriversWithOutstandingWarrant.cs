// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Jensen_Final.Models
{
    public partial class DriversWithOutstandingWarrant
    {
        public int WarrantId { get; set; }
        public string DriverNameLastFirstMiddle { get; set; }
        public int? Age { get; set; }
        public string LastKnownLocation { get; set; }
        public string State { get; set; }
        public string WarrantType { get; set; }
        public string Charges { get; set; }
        public DateTime? DateIssued { get; set; }
    }
}