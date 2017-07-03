namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_WellSafetyTests
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int WellSafetyTestID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobID { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string ServiceItemManufacturer { get; set; }

        [StringLength(50)]
        public string ServiceItemModel { get; set; }

        [StringLength(50)]
        public string ServiceItemSerial { get; set; }

        [StringLength(50)]
        public string ServiceItemType { get; set; }

        [StringLength(50)]
        public string FSR_Num { get; set; }

        [StringLength(50)]
        public string SSV_SAP_Num { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FormDate { get; set; }

        [StringLength(2)]
        public string BodyMaterial { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(15)]
        public string BodyMaterialDisplay { get; set; }

        [StringLength(2)]
        public string PlugMaterial { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(15)]
        public string PlugMaterialDisplay { get; set; }

        [StringLength(2)]
        public string SteamMaterial { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(15)]
        public string SteamMaterialDisplay { get; set; }

        [StringLength(2)]
        public string GateMaterial { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(15)]
        public string GateMaterialDisplay { get; set; }

        [StringLength(50)]
        public string PortSize { get; set; }

        [StringLength(50)]
        public string PressClass { get; set; }

        [StringLength(2)]
        public string ActuatorType { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(15)]
        public string ActuatorTypeDisplay { get; set; }

        [StringLength(50)]
        public string ActuatorModel { get; set; }

        [StringLength(50)]
        public string ActuatorSerialNum { get; set; }

        [StringLength(1)]
        public string AirSupplyMedium { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(3)]
        public string AirSupplyMediumDisplay { get; set; }

        [StringLength(50)]
        public string Condition { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? DateManufactured { get; set; }

        [StringLength(3)]
        public string SystemLocation { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(11)]
        public string SystemLocationDisplay { get; set; }

        [StringLength(50)]
        public string ControllerType { get; set; }

        [StringLength(50)]
        public string HI { get; set; }

        [StringLength(50)]
        public string LO { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        [StringLength(50)]
        public string CustomerWitness { get; set; }

        [StringLength(3)]
        public string ManualOverride { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(10)]
        public string ManualOverrideDisplay { get; set; }

        public int? TestResultID { get; set; }

        [StringLength(50)]
        public string TestResultDisplay { get; set; }

        public int? CreatedBy { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(101)]
        public string CreatedByDisplay { get; set; }

        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? CompletionDate { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }

        [StringLength(50)]
        public string LocationWellName { get; set; }

        [StringLength(2000)]
        public string Description { get; set; }

        [StringLength(25)]
        public string ModelSize { get; set; }

        public int? TechnicianID { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(101)]
        public string TechnicianDisplay { get; set; }
    }
}
