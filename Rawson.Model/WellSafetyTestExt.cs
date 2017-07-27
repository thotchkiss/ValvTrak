using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rawson.Model
{
    public partial class WellSafetyTestExt
    {
        [Key]
        public int ID { get; set; }
        public int JobID { get; set; }
        public int FSR { get; set; }
        public string Route { get; set; }
        public string Technician { get; set; }
        public string LocationOrWellName { get; set; }
        public string Application { get; set; }
        public string Manufacturer { get; set; }
        public string ModelOrPartNumber { get; set; }
        public string SerialNumber { get; set; }
        public DateTime? DateManufactured { get; set; }
        public DateTime DateTestCompleted { get; set; }
        public double? SetPressureFound { get; set; }
        public double? SetPressureLeft { get; set; }
        public int TestResult { get; set; }
        public string ValveType { get; set; }
    }
}
