namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RateValvePart
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RateValvePart()
        {
            RateValveTestPartsUseds = new HashSet<RateValveTestPartsUsed>();
        }

        public int RateValvePartID { get; set; }

        [Required]
        [StringLength(255)]
        public string PartNumber { get; set; }

        [Required]
        [StringLength(255)]
        public string Description { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RateValveTestPartsUsed> RateValveTestPartsUseds { get; set; }
    }
}
