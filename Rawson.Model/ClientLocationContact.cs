namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClientLocationContact
    {
        public int ClientLocationContactID { get; set; }

        public int? ClientLocationID { get; set; }

        public int? ClientContactID { get; set; }

        public int? ClientContactPositionID { get; set; }

        public virtual ClientContactPosition ClientContactPosition { get; set; }

        public virtual ClientContact ClientContact { get; set; }

        public virtual ClientLocation ClientLocation { get; set; }
    }
}
