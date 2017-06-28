namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class WellSafetyTest
    {
        public int WellSafetyTestID { get; set; }

        public int JobID { get; set; }

        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string FSR_Num { get; set; }

        [StringLength(50)]
        public string SSV_SAP_Num { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? FormDate { get; set; }

        [StringLength(2)]
        public string BodyMaterial { get; set; }

        [StringLength(2)]
        public string PlugMaterial { get; set; }

        [StringLength(2)]
        public string SteamMaterial { get; set; }

        [StringLength(2)]
        public string GateMaterial { get; set; }

        [StringLength(50)]
        public string PortSize { get; set; }

        [StringLength(50)]
        public string PressClass { get; set; }

        [StringLength(2)]
        public string ActuatorType { get; set; }

        [StringLength(50)]
        public string ActuatorModel { get; set; }

        [StringLength(50)]
        public string ActuatorSerialNum { get; set; }

        [StringLength(1)]
        public string AirSupplyMedium { get; set; }

        [StringLength(50)]
        public string Condition { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? DateManufactured { get; set; }

        [StringLength(3)]
        public string SystemLocation { get; set; }

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

        public int? TestResultID { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        public virtual Job Job { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }

        public virtual TestResult TestResult { get; set; }
    }
}
