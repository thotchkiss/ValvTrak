namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class JobAssignment
    {
        public int JobAssignmentID { get; set; }

        public int? EmployeeID { get; set; }

        public int? JobID { get; set; }
    }
}
