namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class List
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public List()
        {
            ValveTests = new HashSet<ValveTest>();
        }

        public int ListID { get; set; }

        [Required]
        [StringLength(50)]
        public string ListKey { get; set; }

        public int ListValue { get; set; }

        public int SortOrder { get; set; }

        [StringLength(50)]
        public string Display1 { get; set; }

        [StringLength(50)]
        public string Display2 { get; set; }

        [StringLength(20)]
        public string Abbr { get; set; }

        [StringLength(50)]
        public string SysCode { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValveTest> ValveTests { get; set; }
    }
}
