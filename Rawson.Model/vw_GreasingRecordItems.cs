namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_GreasingRecordItems
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int GreasingRecordItemID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int GreasingRecordID { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string SerialNum { get; set; }

        [StringLength(2000)]
        public string Description { get; set; }

        [StringLength(50)]
        public string SapEquipNum { get; set; }

        [StringLength(50)]
        public string ServiceItemTypeDisplay { get; set; }

        [StringLength(50)]
        public string ManufacturerName { get; set; }

        [StringLength(50)]
        public string Model { get; set; }

        [StringLength(25)]
        public string ModelSize { get; set; }

        [StringLength(50)]
        public string ValveLocation { get; set; }

        public int? ActuatorInspected { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(3)]
        public string ActuatorInspectedDisplay { get; set; }

        public int? ActuatorLubed { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(3)]
        public string ActuatorLubedDisplay { get; set; }

        public int? PercentCycled { get; set; }

        public int? ValveSecured { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(3)]
        public string ValveSecuredDisplay { get; set; }

        [StringLength(1)]
        public string FlangeOrScrew { get; set; }

        public int? EaseOfOperation { get; set; }

        public int? SeatsChecked { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(3)]
        public string SeatsCheckedDisplay { get; set; }

        public int? SeatsLubed { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(3)]
        public string SeatsLubedDisplay { get; set; }

        public int? Leaking { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(3)]
        public string LeakingDisplay { get; set; }

        public int? LubeTypeID { get; set; }

        [StringLength(50)]
        public string LubeTypeDisplay { get; set; }

        [Key]
        [Column(Order = 9)]
        public double AmountInjected { get; set; }

        [StringLength(200)]
        public string Notes { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
