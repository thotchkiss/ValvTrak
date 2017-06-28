namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Manufacturer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Manufacturer()
        {
            ManufacturerModels = new HashSet<ManufacturerModel>();
            ServiceItems = new HashSet<ServiceItem>();
        }

        public int ManufacturerID { get; set; }

        [Column("Manufacturer")]
        [Required]
        [StringLength(50)]
        public string Manufacturer1 { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ManufacturerModel> ManufacturerModels { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceItem> ServiceItems { get; set; }
    }
}
