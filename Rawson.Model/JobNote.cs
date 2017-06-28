namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class JobNote
    {
        [Key]
        public int JobNotesID { get; set; }

        public int? JobID { get; set; }

        public int? EmployeeID { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        public DateTime? CreationDate { get; set; }
    }
}
