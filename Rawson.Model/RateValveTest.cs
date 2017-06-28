namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RateValveTest
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RateValveTest()
        {
            RateValveTestPartsUseds = new HashSet<RateValveTestPartsUsed>();
        }

        public int RateValveTestID { get; set; }

        public int JobID { get; set; }

        public int ServiceItemID { get; set; }

        [StringLength(50)]
        public string FSRNum { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime DateTested { get; set; }

        public int ConditionOfWearSleeve { get; set; }

        public int ConditionOfDisc { get; set; }

        public int PercentDiscWear { get; set; }

        public int ExternalCondition { get; set; }

        [StringLength(4000)]
        public string Remarks { get; set; }

        public int? TechID { get; set; }

        [StringLength(255)]
        public string CustomerWitness { get; set; }

        public int? CreatedBy { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? DateCreated { get; set; }

        public int? ModifiedBy { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? DateModified { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        public virtual Employee Employee2 { get; set; }

        public virtual Job Job { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RateValveTestPartsUsed> RateValveTestPartsUseds { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }
    }
}
