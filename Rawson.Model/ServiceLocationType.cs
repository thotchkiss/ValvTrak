namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceLocationType
    {
        [Key]
        public int CustomerLocationTypeID { get; set; }

        [StringLength(50)]
        public string Type { get; set; }
    }
}
