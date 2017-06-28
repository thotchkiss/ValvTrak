namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClientLocation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ClientLocation()
        {
            ClientLocationContacts = new HashSet<ClientLocationContact>();
            ClientLocationServiceSchedules = new HashSet<ClientLocationServiceSchedule>();
            Jobs = new HashSet<Job>();
            ServiceItems = new HashSet<ServiceItem>();
        }

        public int ClientLocationID { get; set; }

        public int? ClientID { get; set; }

        public int? ClientLocationTypeID { get; set; }

        [StringLength(50)]
        public string PropertyNumber { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Address { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(2)]
        public string State { get; set; }

        [StringLength(50)]
        public string ZipCode { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Longitude { get; set; }

        [StringLength(50)]
        public string Latitude { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? ServiceDate { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime CreationDate { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientLocationContact> ClientLocationContacts { get; set; }

        public virtual Client Client { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientLocationServiceSchedule> ClientLocationServiceSchedules { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Job> Jobs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceItem> ServiceItems { get; set; }
    }
}
