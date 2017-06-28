namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ManufacturerModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ManufacturerModel()
        {
            ServiceItems = new HashSet<ServiceItem>();
        }

        public int ManufacturerModelID { get; set; }

        public int ManufacturerID { get; set; }

        [Required]
        [StringLength(50)]
        public string Model { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceItem> ServiceItems { get; set; }
    }
}
