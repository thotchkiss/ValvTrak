namespace Rawson.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ValvTrakModel : DbContext
    {
        public ValvTrakModel()
            : base("name=ValvTrakModelConnectionString")
        {
        }

        public virtual DbSet<ChemicalPumpTest> ChemicalPumpTests { get; set; }
        public virtual DbSet<ClientContactPosition> ClientContactPositions { get; set; }
        public virtual DbSet<ClientContact> ClientContacts { get; set; }
        public virtual DbSet<ClientLocationContact> ClientLocationContacts { get; set; }
        public virtual DbSet<ClientLocation> ClientLocations { get; set; }
        public virtual DbSet<ClientLocationServiceSchedule> ClientLocationServiceSchedules { get; set; }
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<DeliveryMethod> DeliveryMethods { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<GreasingRecordItem> GreasingRecordItems { get; set; }
        public virtual DbSet<GreasingRecord> GreasingRecords { get; set; }
        public virtual DbSet<JobAssignment> JobAssignments { get; set; }
        public virtual DbSet<JobNote> JobNotes { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<JobStatu> JobStatus { get; set; }
        public virtual DbSet<JobType> JobTypes { get; set; }
        public virtual DbSet<List> Lists { get; set; }
        public virtual DbSet<ManufacturerModel> ManufacturerModels { get; set; }
        public virtual DbSet<Manufacturer> Manufacturers { get; set; }
        public virtual DbSet<RateValvePart> RateValveParts { get; set; }
        public virtual DbSet<RateValveTestPartsUsed> RateValveTestPartsUseds { get; set; }
        public virtual DbSet<RateValveTest> RateValveTests { get; set; }
        public virtual DbSet<ServiceInterval> ServiceIntervals { get; set; }
        public virtual DbSet<ServiceItemCategory> ServiceItemCategories { get; set; }
        public virtual DbSet<ServiceItem> ServiceItems { get; set; }
        public virtual DbSet<ServiceItemType> ServiceItemTypes { get; set; }
        public virtual DbSet<ServiceLocationType> ServiceLocationTypes { get; set; }
        public virtual DbSet<TestResult> TestResults { get; set; }
        public virtual DbSet<ValveTest> ValveTests { get; set; }
        public virtual DbSet<WellSafetyTest> WellSafetyTests { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.FSR_Num)
                .IsUnicode(false);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.Contact)
                .IsUnicode(false);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.ChemicalBeingPumped)
                .IsUnicode(false);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.HeadSize)
                .HasPrecision(9, 5);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<ChemicalPumpTest>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<ClientContactPosition>()
                .Property(e => e.ContactPosition)
                .IsUnicode(false);

            modelBuilder.Entity<ClientContact>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<ClientContact>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<ClientContact>()
                .Property(e => e.WorkPhone)
                .IsUnicode(false);

            modelBuilder.Entity<ClientContact>()
                .Property(e => e.CellPhone)
                .IsUnicode(false);

            modelBuilder.Entity<ClientContact>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.PropertyNumber)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Latitude)
                .IsUnicode(false);

            modelBuilder.Entity<ClientLocation>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<ClientLocation>()
                .HasMany(e => e.ClientLocationServiceSchedules)
                .WithRequired(e => e.ClientLocation)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ClientLocation>()
                .HasMany(e => e.Jobs)
                .WithRequired(e => e.ClientLocation)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ClientLocationServiceSchedule>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<Client>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.Website)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.SysProNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<DeliveryMethod>()
                .Property(e => e.Method)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.WorkPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.CellPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ChemicalPumpTests)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ChemicalPumpTests1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.GreasingRecords)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.GreasingRecords1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.GreasingRecordItems)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.RequestedByID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs2)
                .WithRequired(e => e.Employee2)
                .HasForeignKey(e => e.AssignedByID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs3)
                .WithOptional(e => e.Employee3)
                .HasForeignKey(e => e.AssignedToID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs4)
                .WithOptional(e => e.Employee4)
                .HasForeignKey(e => e.ApprovedByID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.RateValveTests)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.RateValveTests1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.TechID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.RateValveTests2)
                .WithOptional(e => e.Employee2)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ValveTests)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.TechID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ValveTests1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ValveTests2)
                .WithOptional(e => e.Employee2)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.WellSafetyTests)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.WellSafetyTests1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<GreasingRecordItem>()
                .Property(e => e.ValveLocation)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecordItem>()
                .Property(e => e.FlangeOrScrew)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecordItem>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecordItem>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.ClientFieldOffice)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.PipelineSegment)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.Field)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.SapPSV)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<GreasingRecord>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<GreasingRecord>()
                .HasMany(e => e.GreasingRecordItems)
                .WithRequired(e => e.GreasingRecord)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<JobNote>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.SapWoNum)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.PM)
                .HasPrecision(10, 4);

            modelBuilder.Entity<Job>()
                .Property(e => e.NP)
                .HasPrecision(10, 4);

            modelBuilder.Entity<Job>()
                .Property(e => e.FS)
                .HasPrecision(10, 4);

            modelBuilder.Entity<Job>()
                .Property(e => e.DotNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.VRstamp)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<Job>()
                .HasMany(e => e.ChemicalPumpTests)
                .WithRequired(e => e.Job)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Job>()
                .HasMany(e => e.GreasingRecords)
                .WithRequired(e => e.Job)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Job>()
                .HasMany(e => e.RateValveTests)
                .WithRequired(e => e.Job)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Job>()
                .HasMany(e => e.ValveTests)
                .WithRequired(e => e.Job)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Job>()
                .HasMany(e => e.WellSafetyTests)
                .WithRequired(e => e.Job)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<JobStatu>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<JobStatu>()
                .HasMany(e => e.Jobs)
                .WithRequired(e => e.JobStatu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<JobType>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<JobType>()
                .HasMany(e => e.ClientLocationServiceSchedules)
                .WithRequired(e => e.JobType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<JobType>()
                .HasMany(e => e.Jobs)
                .WithRequired(e => e.JobType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<List>()
                .Property(e => e.ListKey)
                .IsUnicode(false);

            modelBuilder.Entity<List>()
                .Property(e => e.Display1)
                .IsUnicode(false);

            modelBuilder.Entity<List>()
                .Property(e => e.Display2)
                .IsUnicode(false);

            modelBuilder.Entity<List>()
                .Property(e => e.Abbr)
                .IsUnicode(false);

            modelBuilder.Entity<List>()
                .Property(e => e.SysCode)
                .IsUnicode(false);

            modelBuilder.Entity<List>()
                .HasMany(e => e.ValveTests)
                .WithOptional(e => e.List)
                .HasForeignKey(e => e.CapacityTypeID);

            modelBuilder.Entity<ManufacturerModel>()
                .Property(e => e.Model)
                .IsUnicode(false);

            modelBuilder.Entity<ManufacturerModel>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<Manufacturer>()
                .Property(e => e.Manufacturer1)
                .IsUnicode(false);

            modelBuilder.Entity<Manufacturer>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<Manufacturer>()
                .HasMany(e => e.ManufacturerModels)
                .WithRequired(e => e.Manufacturer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RateValvePart>()
                .Property(e => e.PartNumber)
                .IsUnicode(false);

            modelBuilder.Entity<RateValvePart>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<RateValvePart>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<RateValvePart>()
                .HasMany(e => e.RateValveTestPartsUseds)
                .WithRequired(e => e.RateValvePart)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RateValveTestPartsUsed>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<RateValveTest>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<RateValveTest>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<RateValveTest>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<RateValveTest>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<RateValveTest>()
                .HasMany(e => e.RateValveTestPartsUseds)
                .WithRequired(e => e.RateValveTest)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceInterval>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceInterval>()
                .HasMany(e => e.ClientLocationServiceSchedules)
                .WithRequired(e => e.ServiceInterval)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItemCategory>()
                .Property(e => e.Category)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceItemCategory>()
                .HasMany(e => e.ServiceItemTypes)
                .WithRequired(e => e.ServiceItemCategory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.SerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.SapEquipNum)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.InletSize)
                .HasPrecision(9, 3);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.OutletSize)
                .HasPrecision(9, 3);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.InletFlangeRating)
                .HasPrecision(9, 3);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.OutletFlangeRating)
                .HasPrecision(9, 3);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.Latitude)
                .HasPrecision(29, 4);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.Longitude)
                .HasPrecision(29, 4);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.GreasingRecordItems)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.RateValveTests)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.ValveTests)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.WellSafetyTests)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItemType>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceLocationType>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<TestResult>()
                .Property(e => e.Result)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.SealNum)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.GaugeNum)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.SetPressureFound)
                .HasPrecision(9, 2);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.SetPressureLeft)
                .HasPrecision(9, 2);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.CostCenter)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.SapPsv)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.PsvApplication)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.ReviewItems)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Pop_1)
                .HasPrecision(9, 2);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Pop_2)
                .HasPrecision(9, 2);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Pop_3)
                .HasPrecision(9, 2);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.FSR_Num)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.SSV_SAP_Num)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.BodyMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.PlugMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.SteamMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.GateMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.PortSize)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.PressClass)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.ActuatorType)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.ActuatorModel)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.ActuatorSerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.AirSupplyMedium)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.Condition)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.SystemLocation)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.ControllerType)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.HI)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.LO)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.ManualOverride)
                .IsUnicode(false);

            modelBuilder.Entity<WellSafetyTest>()
                .Property(e => e.Version)
                .IsFixedLength();
        }
    }
}
