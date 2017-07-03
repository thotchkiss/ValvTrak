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
            ChemPumpWorksheets = new HashSet<ChemPumpWorksheet>();
            ChemPumpWorksheets1 = new HashSet<ChemPumpWorksheet>();
            GreasingRecordItems = new HashSet<GreasingRecordItem>();
            RateValveTests = new HashSet<RateValveTest>();
            ServiceItemSpecs = new HashSet<ServiceItemSpec>();
            ValveTests = new HashSet<ValveTest>();
            WellSafetyTests = new HashSet<WellSafetyTest>();
        }

        public int ServiceItemID { get; set; }

        public int? ServiceItemTypeID { get; set; }

        public int? ClientLocationID { get; set; }

        public int? ManufacturerID { get; set; }

        public int? ManufacturerModelID { get; set; }

        [StringLength(255)]
        public string SerialNum { get; set; }

        [StringLength(2000)]
        public string Description { get; set; }

        public bool? Active { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] Version { get; set; }

        [StringLength(255)]
        public string SapEquipNum { get; set; }

        public bool? Threaded { get; set; }

        public bool? Flanged { get; set; }

        public decimal? InletSize { get; set; }

        public decimal? OutletSize { get; set; }

        public decimal? InletFlangeRating { get; set; }

        public decimal? OutletFlangeRating { get; set; }

        public decimal? Latitude { get; set; }

        public decimal? Longitude { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChemPumpWorksheet> ChemPumpWorksheets { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChemPumpWorksheet> ChemPumpWorksheets1 { get; set; }

        public virtual ClientLocation ClientLocation { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GreasingRecordItem> GreasingRecordItems { get; set; }

        public virtual ManufacturerModel ManufacturerModel { get; set; }

        public virtual Manufacturer Manufacturer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RateValveTest> RateValveTests { get; set; }

        public virtual ServiceItemType ServiceItemType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceItemSpec> ServiceItemSpecs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValveTest> ValveTests { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WellSafetyTest> WellSafetyTests { get; set; }
    }
}
