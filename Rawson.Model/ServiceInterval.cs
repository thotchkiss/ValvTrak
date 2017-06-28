namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceInterval
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ServiceInterval()
        {
            ClientLocationServiceSchedules = new HashSet<ClientLocationServiceSchedule>();
        }

        public int ServiceIntervalId { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public int Years { get; set; }

        public int Months { get; set; }

        public int Days { get; set; }

        public bool IsActive { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientLocationServiceSchedule> ClientLocationServiceSchedules { get; set; }
    }
}
