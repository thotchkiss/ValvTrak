namespace Rawson.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class vw_RateValveTests
    {
        [StringLength(50)]
        public string FSRNum { get; set; }

        [Key]
        [Column(Order = 0, TypeName = "smalldatetime")]
        public DateTime DateTested { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ConditionOfWearSleeve { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ConditionOfDisc { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PercentDiscWear { get; set; }

        [Key]
        [Column(Order = 4)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ExternalCondition { get; set; }

        [StringLength(4000)]
        public string Remarks { get; set; }

        [StringLength(255)]
        public string CustomerWitness { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(255)]
        public string SerialNum { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(50)]
        public string ClientName { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(50)]
        public string Manufacturer { get; set; }

        [StringLength(50)]
        public string PropertyNumber { get; set; }

        [StringLength(50)]
        public string LocationName { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(50)]
        public string Model { get; set; }

        [Key]
        [Column(Order = 10)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RateValveTestID { get; set; }

        [Key]
        [Column(Order = 11)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int JobID { get; set; }

        [StringLength(50)]
        public string SalesOrderNum { get; set; }
    }
}
