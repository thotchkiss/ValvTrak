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

        public virtual DbSet<ChemPumpWorksheet> ChemPumpWorksheets { get; set; }
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
        public virtual DbSet<ServiceItemSpec> ServiceItemSpecs { get; set; }
        public virtual DbSet<ServiceItemType> ServiceItemTypes { get; set; }
        public virtual DbSet<ServiceLocationType> ServiceLocationTypes { get; set; }
        public virtual DbSet<TestResult> TestResults { get; set; }
        public virtual DbSet<ValveTest> ValveTests { get; set; }
        public virtual DbSet<WellSafetyTest> WellSafetyTests { get; set; }
        public virtual DbSet<vw_ChemPumpWorksheets> vw_ChemPumpWorksheets { get; set; }
        public virtual DbSet<vw_GreasingRecordItems> vw_GreasingRecordItems { get; set; }
        public virtual DbSet<vw_GreasingRecords> vw_GreasingRecords { get; set; }
        public virtual DbSet<vw_RateValveTests> vw_RateValveTests { get; set; }
        public virtual DbSet<vw_Reports_ClientLocations> vw_Reports_ClientLocations { get; set; }
        public virtual DbSet<vw_ValveTests> vw_ValveTests { get; set; }
        public virtual DbSet<vw_WellSafetyTests> vw_WellSafetyTests { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.FSR_Num)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.WellName)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.WellNumber)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.Contact)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.VoltType)
                .IsUnicode(false);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.MotorAmps)
                .HasPrecision(9, 5);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.HeadSize)
                .HasPrecision(9, 5);

            modelBuilder.Entity<ChemPumpWorksheet>()
                .Property(e => e.Notes)
                .IsUnicode(false);

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
                .HasMany(e => e.ChemPumpWorksheets)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.ChemPumpWorksheets1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.ModifiedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.GreasingRecordItems)
                .WithOptional(e => e.Employee)
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
                .HasMany(e => e.Jobs)
                .WithOptional(e => e.Employee)
                .HasForeignKey(e => e.RequestedByID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs1)
                .WithOptional(e => e.Employee1)
                .HasForeignKey(e => e.CreatedBy);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs2)
                .WithOptional(e => e.Employee2)
                .HasForeignKey(e => e.AssignedToID);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Jobs3)
                .WithOptional(e => e.Employee3)
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
                .Property(e => e.SapWoNum)
                .IsUnicode(false);

            modelBuilder.Entity<Job>()
                .HasMany(e => e.ChemPumpWorksheets)
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
                .Property(e => e.Version)
                .IsFixedLength();

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
                .Property(e => e.Version)
                .IsFixedLength();

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
                .Property(e => e.Latitude)
                .HasPrecision(18, 6);

            modelBuilder.Entity<ServiceItem>()
                .Property(e => e.Longitude)
                .HasPrecision(18, 6);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.ChemPumpWorksheets)
                .WithOptional(e => e.ServiceItem)
                .HasForeignKey(e => e.StartPumpID);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.ChemPumpWorksheets1)
                .WithOptional(e => e.ServiceItem1)
                .HasForeignKey(e => e.EndPumpID);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.GreasingRecordItems)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.RateValveTests)
                .WithRequired(e => e.ServiceItem)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ServiceItem>()
                .HasMany(e => e.ServiceItemSpecs)
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
                .Property(e => e.PsvApplication)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.ReviewItems)
                .IsUnicode(false);

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.Version)
                .IsFixedLength();

            modelBuilder.Entity<ValveTest>()
                .Property(e => e.SapPsv)
                .IsUnicode(false);

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

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.ClientLocationName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.FSR_Num)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.WellName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.WellNumber)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.Contact)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.WarrantyTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.WorkType1Display)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.WorkType2Display)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.StartPumpManufacturer)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.StartPumpModel)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.StartPumpSerial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.StartPumpType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.EndPumpManufacturer)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.EndPumpModel)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.EndPumpSerial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.EndPumpType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.VoltType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.MotorAmps)
                .HasPrecision(3, 1);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.ChemDailyVolTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.SetDailyVolTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.CreatedByDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.TechnicianDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ChemPumpWorksheets>()
                .Property(e => e.Customer)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.SerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.SapEquipNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ServiceItemTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ManufacturerName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.Model)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ModelSize)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ValveLocation)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ActuatorInspectedDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ActuatorLubedDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.ValveSecuredDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.FlangeOrScrew)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.SeatsCheckedDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.SeatsLubedDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.LeakingDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.LubeTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecordItems>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.ClientFieldOffice)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.PipelineSegment)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.Field)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.SapWO)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.SapEquipNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.CreatedByDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.ClientLocationName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.TechnicianDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.SapWoNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<vw_GreasingRecords>()
                .Property(e => e.Latitude)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.SerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.Manufacturer)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.PropertyNumber)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.LocationName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.Model)
                .IsUnicode(false);

            modelBuilder.Entity<vw_RateValveTests>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.Client)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.Location)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.State)
                .IsUnicode(false);

            modelBuilder.Entity<vw_Reports_ClientLocations>()
                .Property(e => e.ZipCode)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SapWoNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.FSRNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.ClientLocationName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.CostCenter)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Latitude)
                .HasPrecision(18, 6);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Longitude)
                .HasPrecision(18, 6);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SapPsv)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Model)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.ManufacturerName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SapEquipNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.InletSize)
                .HasPrecision(9, 3);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.OutletSize)
                .HasPrecision(9, 3);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.InletFlangeRating)
                .HasPrecision(9, 3);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.OutletFlangeRating)
                .HasPrecision(9, 3);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.ModelSize)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.CapacityTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SealNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.GaugeNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.CodedDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SetPressureFound)
                .HasPrecision(9, 2);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.SetPressureLeft)
                .HasPrecision(9, 2);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Pop_1)
                .HasPrecision(9, 2);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Pop_2)
                .HasPrecision(9, 2);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Pop_3)
                .HasPrecision(9, 2);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.TestResultDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.ReviewItems)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.TechnicianDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<vw_ValveTests>()
                .Property(e => e.CreatedByDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ServiceItemManufacturer)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ServiceItemModel)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ServiceItemSerial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ServiceItemType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.FSR_Num)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SSV_SAP_Num)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.BodyMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.BodyMaterialDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.PlugMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.PlugMaterialDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SteamMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SteamMaterialDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.GateMaterial)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.GateMaterialDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.PortSize)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.PressClass)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ActuatorType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ActuatorTypeDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ActuatorModel)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ActuatorSerialNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.AirSupplyMedium)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.AirSupplyMediumDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.Condition)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SystemLocation)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SystemLocationDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ControllerType)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.HI)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.LO)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.Notes)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.CustomerWitness)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ManualOverride)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ManualOverrideDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.TestResultDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.CreatedByDisplay)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.SalesOrderNum)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.LocationWellName)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.ModelSize)
                .IsUnicode(false);

            modelBuilder.Entity<vw_WellSafetyTests>()
                .Property(e => e.TechnicianDisplay)
                .IsUnicode(false);
        }
    }
}
