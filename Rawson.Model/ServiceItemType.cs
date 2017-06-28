namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceItemType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ServiceItemType()
        {
            ServiceItems = new HashSet<ServiceItem>();
        }

        public int ServiceItemTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string Type { get; set; }

        public int ServiceItemCategoryID { get; set; }

        public virtual ServiceItemCategory ServiceItemCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceItem> ServiceItems { get; set; }
    }
}
