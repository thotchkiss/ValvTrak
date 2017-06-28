namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class GreasingRecord
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GreasingRecord()
        {
            GreasingRecordItems = new HashSet<GreasingRecordItem>();
        }

        public int GreasingRecordID { get; set; }

        public int JobID { get; set; }

        [StringLength(50)]
        public string ClientFieldOffice { get; set; }

        [StringLength(100)]
        public string PipelineSegment { get; set; }

        [StringLength(50)]
        public string Field { get; set; }

        [StringLength(50)]
        public string SapPSV { get; set; }

        [StringLength(50)]
        public string FSRNum { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GreasingRecordItem> GreasingRecordItems { get; set; }

        public virtual Job Job { get; set; }
    }
}
