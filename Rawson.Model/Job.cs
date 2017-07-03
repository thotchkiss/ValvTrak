namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Job
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Job()
        {
            ChemPumpWorksheets = new HashSet<ChemPumpWorksheet>();
            GreasingRecords = new HashSet<GreasingRecord>();
            RateValveTests = new HashSet<RateValveTest>();
            ValveTests = new HashSet<ValveTest>();
            WellSafetyTests = new HashSet<WellSafetyTest>();
        }

        public int JobID { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? CallDate { get; set; }

        public int? RequestedByID { get; set; }

        public int JobTypeID { get; set; }

        public int ClientLocationID { get; set; }

        public int JobStatusID { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? ServiceDate { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? CompletionDate { get; set; }

        public int AssignedByID { get; set; }

        public int? AssignedToID { get; set; }

        public int? ApprovedByID { get; set; }

        public int? DeliveryMethodID { get; set; }

        [Column(TypeName = "smallmoney")]
        public decimal? PM { get; set; }

        [Column(TypeName = "smallmoney")]
        public decimal? NP { get; set; }

        [Column(TypeName = "smallmoney")]
        public decimal? FS { get; set; }

        public bool Active { get; set; }

        [StringLength(50)]
        public string DotNumber { get; set; }

        [StringLength(50)]
        public string VRstamp { get; set; }

        public int? CreatedBy { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime CreationDate { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        [StringLength(50)]
        public string SapWoNum { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChemPumpWorksheet> ChemPumpWorksheets { get; set; }

        public virtual ClientLocation ClientLocation { get; set; }

        public virtual DeliveryMethod DeliveryMethod { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        public virtual Employee Employee2 { get; set; }

        public virtual Employee Employee3 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GreasingRecord> GreasingRecords { get; set; }

        public virtual JobStatu JobStatu { get; set; }

        public virtual JobType JobType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RateValveTest> RateValveTests { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValveTest> ValveTests { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WellSafetyTest> WellSafetyTests { get; set; }
    }
}
