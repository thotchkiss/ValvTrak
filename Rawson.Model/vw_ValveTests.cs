namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_ValveTests
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ValveTestID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobID { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }

        [StringLength(50)]
        public string SapWoNum { get; set; }

        [StringLength(50)]
        public string FSRNum { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string ClientName { get; set; }

        [StringLength(50)]
        public string ClientLocationName { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string CostCenter { get; set; }

        public decimal? Latitude { get; set; }

        public decimal? Longitude { get; set; }

        [StringLength(2000)]
        public string Description { get; set; }

        [StringLength(255)]
        public string SapPsv { get; set; }

        public DateTime? DateTested { get; set; }

        [StringLength(50)]
        public string Model { get; set; }

        [StringLength(50)]
        public string ManufacturerName { get; set; }

        public bool? Threaded { get; set; }

        public bool? Flanged { get; set; }

        [StringLength(255)]
        public string SerialNum { get; set; }

        [StringLength(255)]
        public string SapEquipNum { get; set; }

        public decimal? InletSize { get; set; }

        public decimal? OutletSize { get; set; }

        public decimal? InletFlangeRating { get; set; }

        public decimal? OutletFlangeRating { get; set; }

        [StringLength(25)]
        public string ModelSize { get; set; }

        public double? SetPressure { get; set; }

        public double? BackPressure { get; set; }

        public double? ColdDiffPressure { get; set; }

        public double? TempCorr { get; set; }

        public double? Capacity { get; set; }

        public int? CapacityTypeID { get; set; }

        [StringLength(50)]
        public string CapacityTypeDisplay { get; set; }

        [StringLength(50)]
        public string SealNum { get; set; }

        [StringLength(50)]
        public string GaugeNum { get; set; }

        public DateTime? CalibrationDue { get; set; }

        public bool? CodedSource { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(3)]
        public string CodedDisplay { get; set; }

        public DateTime? ValveDate { get; set; }

        public bool? IsolationValve { get; set; }

        public int? ReliefValveSupport { get; set; }

        public bool? TestPort { get; set; }

        public int? WeatherCap { get; set; }

        public bool? DotLocation { get; set; }

        [Key]
        [Column(Order = 5)]
        public bool JsaComplete { get; set; }

        public decimal? SetPressureFound { get; set; }

        public decimal? SetPressureLeft { get; set; }

        public decimal? Pop_1 { get; set; }

        public decimal? Pop_2 { get; set; }

        public decimal? Pop_3 { get; set; }

        public int? TestResultID { get; set; }

        [StringLength(50)]
        public string TestResultDisplay { get; set; }

        [StringLength(2000)]
        public string Notes { get; set; }

        [StringLength(500)]
        public string ReviewItems { get; set; }

        public int? TechID { get; set; }

        public int? TechnicianID { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(101)]
        public string TechnicianDisplay { get; set; }

        [StringLength(50)]
        public string CustomerWitness { get; set; }

        public int? CreatedBy { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(101)]
        public string CreatedByDisplay { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
