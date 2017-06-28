namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClientContactPosition
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ClientContactPosition()
        {
            ClientLocationContacts = new HashSet<ClientLocationContact>();
        }

        public int ClientContactPositionID { get; set; }

        [StringLength(50)]
        public string ContactPosition { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientLocationContact> ClientLocationContacts { get; set; }
    }
}
