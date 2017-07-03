namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_GreasingRecords
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int GreasingRecordID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobID { get; set; }

        [StringLength(50)]
        public string ClientFieldOffice { get; set; }

        [StringLength(100)]
        public string PipelineSegment { get; set; }

        [StringLength(50)]
        public string Field { get; set; }

        [StringLength(50)]
        public string SapWO { get; set; }

        [StringLength(50)]
        public string SapEquipNum { get; set; }

        [StringLength(50)]
        public string FSRNum { get; set; }

        public int? CreatedBy { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(101)]
        public string CreatedByDisplay { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? CompletionDate { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(50)]
        public string ClientName { get; set; }

        [StringLength(50)]
        public string ClientLocationName { get; set; }

        public int? TechnicianID { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(101)]
        public string TechnicianDisplay { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }

        [StringLength(50)]
        public string SapWoNum { get; set; }

        [StringLength(50)]
        public string Longitude { get; set; }

        [StringLength(50)]
        public string Latitude { get; set; }
    }
}
