namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceItemSpec
    {
        public int ServiceItemSpecId { get; set; }

        public int ServiceItemId { get; set; }

        public double? InletSize { get; set; }

        public double? InletFlangeRating { get; set; }

        public double? OutletSize { get; set; }

        public double? OutletFlangeRating { get; set; }

        public bool? Threaded { get; set; }

        public bool? Flanged { get; set; }

        public virtual ServiceItem ServiceItem { get; set; }
    }
}
