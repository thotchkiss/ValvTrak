namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class JobStatu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public JobStatu()
        {
            Jobs = new HashSet<Job>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobStatusID { get; set; }

        [Required]
        [StringLength(50)]
        public string Status { get; set; }

        public int Sequence { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Job> Jobs { get; set; }
    }
}
