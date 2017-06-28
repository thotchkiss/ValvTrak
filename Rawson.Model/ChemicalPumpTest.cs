namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ChemicalPumpTest
    {
        public int ChemicalPumpTestID { get; set; }

        public int JobID { get; set; }

        [StringLength(50)]
        public string FSR_Num { get; set; }

        public int? ServiceItemID { get; set; }

        [StringLength(50)]
        public string Contact { get; set; }

        [StringLength(15)]
        public string Phone { get; set; }

        [StringLength(255)]
        public string ChemicalBeingPumped { get; set; }

        public double? PumpVolumeSetting { get; set; }

        public double? Voltage { get; set; }

        public double? SolarPanelWattage { get; set; }

        public decimal? HeadSize { get; set; }

        public double? SupplyPressure { get; set; }

        public double? DischargePressure { get; set; }

        public double? FlowlinePressure { get; set; }

        public double? TubingPressure { get; set; }

        public double? CasingPressure { get; set; }

        public double? PipelinePressure { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime CreationDate { get; set; }

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
    }
}
