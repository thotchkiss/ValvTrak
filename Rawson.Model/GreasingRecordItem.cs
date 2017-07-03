namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class GreasingRecordItem
    {
        public int GreasingRecordItemID { get; set; }

        public int GreasingRecordID { get; set; }

        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string ValveLocation { get; set; }

        public int? ActuatorInspected { get; set; }

        public int? ActuatorLubed { get; set; }

        public int? PercentCycled { get; set; }

        public int? ValveSecured { get; set; }

        [StringLength(1)]
        public string FlangeOrScrew { get; set; }

        public int? EaseOfOperation { get; set; }

        public int? SeatsChecked { get; set; }

        public int? SeatsLubed { get; set; }

        public int? Leaking { get; set; }

        public int? LubeTypeID { get; set; }

        public double AmountInjected { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual GreasingRecord GreasingRecord { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }
    }
}
