namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceItem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ServiceItem()
        {
            ChemicalPumpTests = new HashSet<ChemicalPumpTest>();
            GreasingRecordItems = new HashSet<GreasingRecordItem>();
            RateValveTests = new HashSet<RateValveTest>();
            ValveTests = new HashSet<ValveTest>();
            WellSafetyTests = new HashSet<WellSafetyTest>();
        }

        public int ServiceItemID { get; set; }

        public int? ServiceItemTypeID { get; set; }

        public int? ClientLocationID { get; set; }

        public int? ManufacturerID { get; set; }

        public int? ManufacturerModelID { get; set; }

        [StringLength(50)]
        public string SerialNum { get; set; }

        [StringLength(2000)]
        public string Description { get; set; }

        public bool? Active { get; set; }

        [StringLength(50)]
        public string SapEquipNum { get; set; }

        public bool? Threaded { get; set; }

        public bool? Flanged { get; set; }

        public decimal? InletSize { get; set; }

        public decimal? OutletSize { get; set; }

        public decimal? InletFlangeRating { get; set; }

        public decimal? OutletFlangeRating { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        public decimal? Latitude { get; set; }

        public decimal? Longitude { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChemicalPumpTest> ChemicalPumpTests { get; set; }

        public virtual ClientLocation ClientLocation { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GreasingRecordItem> GreasingRecordItems { get; set; }

        public virtual ManufacturerModel ManufacturerModel { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RateValveTest> RateValveTests { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValveTest> ValveTests { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WellSafetyTest> WellSafetyTests { get; set; }

        public virtual ServiceItemType ServiceItemType { get; set; }
    }
}
