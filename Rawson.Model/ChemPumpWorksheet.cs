namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChemPumpWorksheet")]
    public partial class ChemPumpWorksheet
    {
        public int ChemPumpWorksheetID { get; set; }

        public int JobID { get; set; }

        [StringLength(50)]
        public string FSR_Num { get; set; }

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

        public int? WorkType1 { get; set; }

        public int? WorkType2 { get; set; }

        public int? StartPumpID { get; set; }

        public int? EndPumpID { get; set; }

        public int? SolarPanelWatt { get; set; }

        public double? Volts { get; set; }

        [StringLength(2)]
        public string VoltType { get; set; }

        public decimal? MotorAmps { get; set; }

        public int? ChemDailyVol { get; set; }

        public int? ChemDailyVolType { get; set; }

        public decimal? HeadSize { get; set; }

        public int? SetDailyVol { get; set; }

        public int? SetDailyVolType { get; set; }

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

        public DateTime CreationDate { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        public virtual Job Job { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }

        public virtual ServiceItem ServiceItem1 { get; set; }
    }
}
