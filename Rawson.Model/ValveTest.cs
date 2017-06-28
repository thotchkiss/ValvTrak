namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ValveTest
    {
        public int ValveTestID { get; set; }

        public int JobID { get; set; }

        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string FSRNum { get; set; }

        public DateTime? DateTested { get; set; }

        public double? SetPressure { get; set; }

        public double? BackPressure { get; set; }

        public double? ColdDiffPressure { get; set; }

        public double? TempCorr { get; set; }

        public double? Capacity { get; set; }

        public int? CapacityTypeID { get; set; }

        [StringLength(50)]
        public string SealNum { get; set; }

        [StringLength(50)]
        public string GaugeNum { get; set; }

        public DateTime? CalibrationDue { get; set; }

        public bool? Coded { get; set; }

        public DateTime? ValveDate { get; set; }

        public decimal? SetPressureFound { get; set; }

        public decimal? SetPressureLeft { get; set; }

        public int? TestResultID { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        public int? TechID { get; set; }

        [StringLength(50)]
        public string CustomerWitness { get; set; }

        [StringLength(50)]
        public string CostCenter { get; set; }

        [StringLength(255)]
        public string SapPsv { get; set; }

        [StringLength(50)]
        public string PsvApplication { get; set; }

        public bool? IsolationValve { get; set; }

        public int? ReliefValveSupport { get; set; }

        public bool? TestPort { get; set; }

        public int? WeatherCap { get; set; }

        public bool? DotLocation { get; set; }

        public bool JsaComplete { get; set; }

        [StringLength(500)]
        public string ReviewItems { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public decimal? Pop_1 { get; set; }

        public decimal? Pop_2 { get; set; }

        public decimal? Pop_3 { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        public virtual Employee Employee2 { get; set; }

        public virtual Job Job { get; set; }

        public virtual List List { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }

        public virtual TestResult TestResult { get; set; }
    }
}
