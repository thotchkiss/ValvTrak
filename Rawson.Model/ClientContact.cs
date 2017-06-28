namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClientContact
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ClientContact()
        {
            ClientLocationContacts = new HashSet<ClientLocationContact>();
        }

        public int ClientContactID { get; set; }

        public int? ClientID { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(50)]
        public string WorkPhone { get; set; }

        [StringLength(50)]
        public string CellPhone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public bool Active { get; set; }

        public virtual Client Client { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientLocationContact> ClientLocationContacts { get; set; }
    }
}
