namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClientLocationServiceSchedule
    {
        public int ClientLocationServiceScheduleId { get; set; }

        public int ClientLocationId { get; set; }

        public int JobTypeId { get; set; }

        public int ServiceIntervalId { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime LastServiceDate { get; set; }

        [Column(TypeName = "smalldatetime")]
        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public DateTime? NextServiceDate { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public int? CountDown { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public virtual ClientLocation ClientLocation { get; set; }

        public virtual JobType JobType { get; set; }

        public virtual ServiceInterval ServiceInterval { get; set; }
    }
}
