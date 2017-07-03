namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_ChemPumpWorksheets
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ChemPumpWorksheetID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobID { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string ClientName { get; set; }

        [StringLength(50)]
        public string ClientLocationName { get; set; }

        [StringLength(50)]
        public string FSR_Num { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? CompletionDate { get; set; }

        [StringLength(50)]
        public string WellName { get; set; }

        [StringLength(50)]
        public string WellNumber { get; set; }

        [StringLength(50)]
        public string Contact { get; set; }

        [StringLength(15)]
        public string Phone { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? OriginalInstallDate { get; set; }

        public int? WarrantyType { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(8)]
        public string WarrantyTypeDisplay { get; set; }

        public int? WorkType1 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(8)]
        public string WorkType1Display { get; set; }

        public int? WorkType2 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(7)]
        public string WorkType2Display { get; set; }

        public int? StartPumpID { get; set; }

        [StringLength(50)]
        public string StartPumpManufacturer { get; set; }

        [StringLength(50)]
        public string StartPumpModel { get; set; }

        [StringLength(50)]
        public string StartPumpSerial { get; set; }

        [StringLength(50)]
        public string StartPumpType { get; set; }

        public int? EndPumpID { get; set; }

        [StringLength(50)]
        public string EndPumpManufacturer { get; set; }

        [StringLength(50)]
        public string EndPumpModel { get; set; }

        [StringLength(50)]
        public string EndPumpSerial { get; set; }

        [StringLength(50)]
        public string EndPumpType { get; set; }

        public int? SolarPanelWatt { get; set; }

        public double? Volts { get; set; }

        [StringLength(2)]
        public string VoltType { get; set; }

        public decimal? MotorAmps { get; set; }

        public int? ChemDailyVol { get; set; }

        public int? ChemDailyVolType { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(7)]
        public string ChemDailyVolTypeDisplay { get; set; }

        public int? HeadSize { get; set; }

        public int? SetDailyVol { get; set; }

        public int? SetDailyVolType { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(7)]
        public string SetDailyVolTypeDisplay { get; set; }

        public int? Supply { get; set; }

        public int? Discharge { get; set; }

        public int? Flowline { get; set; }

        public int? WellPressureTubing { get; set; }

        public int? WellPressureCasing { get; set; }

        public int? WellPressureFlowline { get; set; }

        public int? WellPressureDischarge { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        public int? CreatedBy { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(101)]
        public string CreatedByDisplay { get; set; }

        [Key]
        [Column(Order = 9)]
        public DateTime CreationDate { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(101)]
        public string TechnicianDisplay { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(50)]
        public string Customer { get; set; }
    }
}
