using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Data.Linq.Mapping;
using System.Web;
using System.Data.Linq;
using System.Data.Common;
using System.Collections;
using System.Xml.Serialization;
using System.Text;
using Rawson.Data;
using Rawson.App.Security;
using Microsoft.Practices.EnterpriseLibrary.Validation;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for boWrapper
    /// </summary>
    public class boController<TEntity, TDataContext> : IDisposable
        where TEntity : class, new()
        where TDataContext : DataContext, new()
    {
        #region Properties
        /// <summary>
        /// The provider factory used for this base implementation.
        /// </summary>
        public static DbProviderFactory ProviderFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");

        /// <summary>
        /// Instance of the Data Context that is used for this class.
        /// Note that this is a primary instance only - other instances
        /// can be used in other situations.
        /// </summary>
        protected TDataContext Context { get; set; }

        /// <summary>
        /// Contains information about the primary table that is mapped
        /// to this business object. Contains table name, Pk and version
        /// field info. 
        /// 
        /// Values are automatically set by the constructor so ensure
        /// that the base constructor is always called.
        /// </summary>        
        protected TableInfo TableInfo { get; set; }

        /// <summary>
        /// Contains options for the business object's operation
        /// </summary>
        public DataContextOptions Options { get; set; }


        /// <summary>
        /// Instance of a locally managed entity object. Set with Load and New
        /// methods.
        /// </summary>
        public TEntity Entity { get; set; }

        /// <summary>
        /// A collection that can be used to hold errors. This collection
        /// is set by the AddValidationError method.
        /// </summary>
        [XmlIgnore]
        public ValidationErrorCollection ValidationErrors
        {
            get
            {
                if (this._ValidationErrors == null)
                    this._ValidationErrors = new ValidationErrorCollection();
                return _ValidationErrors;
            }
        }
        [NonSerialized]
        ValidationErrorCollection _ValidationErrors;

        /// <summary>
        /// Instance of an exception object that caused the last error
        /// </summary>                
        public Exception ErrorException { get; set; }

        /// <summary>
        /// Error Message of the last exception
        /// </summary>
        public string ErrorMessage
        {
            get
            {
                if (this.ErrorException == null)
                    return "";
                return this.ErrorException.Message;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                    this.ErrorException = null;
                else
                    // *** Assign a new exception
                    this.ErrorException = new ApplicationException(value);
            }
        }

        /// <summary>
        /// Determines whether or not the Save operation causes automatic
        /// validation
        /// </summary>        
        protected bool AutoValidate { get; set; }


        #endregion

        #region Object Initialization
        /// <summary>
        /// Base constructor - initializes the business object's
        /// context and table mapping info
        /// </summary>
        public boController()
        {
            this.IntializeInternal();
            this.Initialize();
        }

        /// <summary>
        /// Constructore that allows passing in an existing DataContext
        /// so several business objects can share Context scope.
        /// </summary>
        /// <param name="context"></param>
        public boController(TDataContext context)
        {
            this.IntializeInternal();
            this.Context = context;
            this.Initialize();
        }

        /// <summary>
        /// Internal method called to initialize various sub objects
        /// and default settings.
        /// </summary>
        private void IntializeInternal()
        {
            // *** Create the options for this business object
            this.Options = new DataContextOptions();

            this.Options.TrackingMode = TrackingModes.Connected;
            this.Options.ConflictResolutionMode = ConflictResolutionModes.ForceChanges;
            this.Options.ThrowExceptions = true;
        }

        /// <summary>
        /// Initializes the business object explicitly.
        /// 
        /// This method can be overridden by any subclasses that want to customize
        /// the instantiation behavior and should call back to the base method
        /// 
        /// The core features this method performs are:
        /// - Create a new context        
        /// </summary>
        protected virtual void Initialize()
        {
            // *** Create a default context
            if (this.Context == null)
            {
                if (!string.IsNullOrEmpty(this.Options.ConnectionString))
                    this.CreateContext(this.Options.ConnectionString);
                else
                    this.Context = this.CreateContext();
            }

            // *** Initialize Table Info 
            this.TableInfo = new TableInfo(Context, typeof(TEntity));
        }

        /// <summary>
        /// Creates an instance of the context object.
        /// </summary>
        /// <returns></returns>
        protected virtual TDataContext CreateContext()
        {
            return Activator.CreateInstance<TDataContext>() as TDataContext;
        }

        /// <summary>
        /// Allows creating a new context with a specific connection string.
        /// 
        /// The connection string can either be a full connection string or
        /// a connection string .Config entry.
        /// </summary>
        /// <param name="ConnectionString"></param>
        /// <returns></returns>
        protected virtual TDataContext CreateContext(string ConnectionString)
        {
            return Activator.CreateInstance(typeof(TDataContext), ConnectionString) as TDataContext;
        }
        #endregion

        #region CRUD Methods

        /// <summary>
        /// Loads an individual instance of an object
        /// </summary>
        /// <param name="pk"></param>
        /// <returns></returns>
        public virtual TEntity Load(object pk)
        {
            string sql = "select * from " + this.TableInfo.Tablename + " where " + this.TableInfo.PkField + "={0}";
            return this.LoadBase(sql, pk);
        }

        /// <summary>
        /// Loads a single record based on a generic SQL command. Can be used
        /// for customized Load behaviors where entities are loaded up.
        /// </summary>
        /// <param name="sqlLoadCommand"></param>
        /// <returns></returns>
        protected virtual TEntity LoadBase(string sqlLoadCommand, params object[] args)
        {
            this.SetError();

            try
            {
                TDataContext context = this.Context;

                // *** If disconnected we'll create a new context
                if (this.Options.TrackingMode == TrackingModes.Disconnected)
                    context = this.CreateContext();

                IEnumerable<TEntity> entityList = context.ExecuteQuery<TEntity>(sqlLoadCommand, args);

                TEntity entity = null;
                entity = entityList.Single();

                // *** Assign to local entity
                this.Entity = entity;

                // *** and return instance
                return entity;
            }
            catch (InvalidOperationException)
            {
                // *** Handles errors where an invalid Id was passed, but SQL is valid
                this.SetError("Couldn't load entity - invalid key provided.");
                this.Entity = this.NewEntity();
                return null;
            }
            catch (Exception ex)
            {
                // *** handles Sql errors
                this.SetError(ex);
                this.Entity = this.NewEntity();
            }

            return null;
        }

        /// <summary>
        /// Create a disconnected entity object
        /// </summary>
        /// <returns></returns>
        public virtual TEntity NewEntity()
        {
            this.SetError();

            try
            {
                TEntity entity = Activator.CreateInstance<TEntity>();
                this.Entity = entity;

                //if (this.Options.TrackingMode == TrackingModes.Disconnected)
                //    return entity;

                Table<TEntity> table = this.Context.GetTable(typeof(TEntity)) as Table<TEntity>;
                table.InsertOnSubmit(entity);

                return entity;
            }
            catch (Exception ex)
            {
                this.SetError(ex);
                return null;
            }
        }

        public virtual void Detach() { }

        /// <summary>
        /// Saves a disconnected entity object
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual bool Save(TEntity entity)
        {
            if (this.AutoValidate && !this.Validate())
                return false;

            // *** In connected mode any Save operation causes
            // *** all changes to be submitted.
            if (this.Options.TrackingMode == TrackingModes.Connected && entity == null)
            {
                try
                {
                    return this.SubmitChanges();
                }
                catch (Exception ex)
                {
                    this.SetError(ex);
                }
                return false;
            }

            if (entity == null)
                entity = this.Entity;

            using (TDataContext context = this.CreateContext())
            {
                try
                {
                    // *** Generically get the table
                    Table<TEntity> table = context.GetTable(typeof(TEntity)) as Table<TEntity>;

                    // *** BIG assumption here: version field and using Reflection - yuk!
                    //     can't see another way to figure out whether we're dealing with 
                    //     a new entity or not.
                    object tstamp = entity.GetType().GetProperty(this.TableInfo.VersionField).GetValue(entity, null);

                    // *** If there's no timestamp on the entity it's a new record
                    if (tstamp == null)
                        table.InsertOnSubmit(entity);
                    else
                        table.Attach(entity, true);

                    context.SubmitChanges();
                    //context.Refresh(RefreshMode.OverwriteCurrentValues, entity);
                }
                catch (Exception ex)
                {
                    this.SetError(ex);
                    return false;
                }
            }

            return true;
        }

        /// <summary>
        /// Saves the internally stored Entity object
        /// by submitting all changes. Note this is the
        /// 'connected' version that submits all pending
        /// changes on the current data context.
        /// 
        /// For subclassing you should override the alternate
        /// entity signature.
        /// </summary>
        /// <returns></returns>
        public virtual bool Save()
        {
            return this.Save(null);
        }


        /// <summary>
        /// Cancel Changes on the current connected context
        /// </summary>
        public virtual void AbortChanges()
        {
            // *** Create a new context instance from scratch
            this.Context = this.CreateContext();
        }

        /// <summary>
        /// Saves changes on the current connected context.
        /// Preferrably you should use Save() rather than
        /// this method, but this provides a more low level
        /// direct context saving approach if you are
        /// working with connected data.
        /// 
        /// This method is also called from the Save() method.
        /// </summary>
        /// <param name="ConflictResolutionMode">Determines how change conflicts are applied</param>
        public bool SubmitChanges(ConflictResolutionModes ConflictResolutionMode)
        {
            try
            {
                // *** Always continue so we can get all the change conflicts
                this.Context.SubmitChanges(ConflictMode.ContinueOnConflict);
            }
            catch (ChangeConflictException ex)
            {
                switch (ConflictResolutionMode)
                {
                    // *** Pass the error out of here as is
                    // *** Let the client deal with it
                    case ConflictResolutionModes.None:
                        this.SetError(ex);
                        return false;

                    // *** Last one wins
                    case ConflictResolutionModes.ForceChanges:
                        this.Context.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);
                        break;

                    // *** All changes are aborted and entities update from database
                    case ConflictResolutionModes.AbortChanges:
                        this.Context.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);
                        break;
                    //case ConflictResolutionModes.WriteNonConflictChanges
                    //    // TODO: Check this ConflictResoltuionmode behavior
                    //    context2.ChangeConflicts.ResolveAll(RefreshMode.KeepCurrentValues);
                    //    break;
                }
                try
                {
                    this.Context.SubmitChanges(ConflictMode.ContinueOnConflict);
                }
                catch (Exception ex2)
                {
                    this.SetError(ex2);
                    return false;
                }
            }
            catch (Exception ex)
            {
                this.SetError(ex);
                return false;
            }

            return true;
        }

        /// <summary>
        /// Saves changes on the current connected context.
        /// Preferrably you should use Save() rather than
        /// this method, but this provides a more low level
        /// direct context saving approach if you are
        /// working with connected data.
        /// </summary>
        public bool SubmitChanges()
        {
            return this.SubmitChanges(this.Options.ConflictResolutionMode);
        }


        /// <summary>
        /// Deletes an entity specific by its Pk
        /// </summary>
        /// <param name="Pk"></param>
        /// <returns></returns>
        public virtual bool Delete(object Pk)
        {
            int result = -1;
            try
            {
                result = this.Context.ExecuteCommand(
                                    "delete from " + this.TableInfo.Tablename + " where " + this.TableInfo.PkField + " = {0}", Pk);
            }
            catch (Exception ex)
            {
                this.SetError(ex);
                return false;
            }

            if (result < 1)
            {
                this.SetError("Nothing to delete");
                return false;
            }

            return true;
        }

        /// <summary>
        /// Deletes the active Entity object
        /// </summary>
        /// <returns></returns>
        public virtual bool Delete()
        {
            return this.Delete(null);
        }

        /// <summary>
        /// Deletes a specific entity object.
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public virtual bool Delete(TEntity entity)
        {
            if (entity == null)
            {
                entity = this.Entity;
                if (entity == null)
                    return false;
            }

            if (this.Options.TrackingMode == TrackingModes.Connected)
            {
                try
                {
                    Table<TEntity> table = this.Context.GetTable(typeof(TEntity)) as Table<TEntity>;
                    table.DeleteOnSubmit(entity);
                    return this.SubmitChanges();
                }
                catch (Exception ex)
                {
                    this.SetError(ex);
                }
                return false;
            }

            using (TDataContext context = this.CreateContext())
            {
                try
                {
                    Table<TEntity> table = context.GetTable(typeof(TEntity)) as Table<TEntity>;
                    table.DeleteOnSubmit(entity);
                    context.SubmitChanges();
                }
                catch (Exception ex)
                {
                    this.SetError(ex);
                    return false;
                }
            }

            return true;
        }
        #endregion

        public virtual IQueryable<TEntity> Fetch<TEntity>(ISpecification<TEntity> where) where TEntity : class
        {
            if (where != null)
                return Context.GetTable<TEntity>().Where(where.Predicate);
            else
                return Context.GetTable<TEntity>();
        }

        public virtual bool CanEdit
        {
            get
            {
                UserAuthorization auth = HttpContext.Current.Session["UserAuthorization"] as UserAuthorization;
                return auth.IsDataAdmin;
            }
        }

        /// <summary>
        /// Validate() is used to validate business rules on the business object. 
        /// Generally this method consists of a bunch of if statements that validate 
        /// the data of the business object and adds any errors to the 
        /// <see>wwBusiness.ValidationErrors</see> collection.
        /// 
        /// If the <see>wwBusiness.AutoValidate</see> flag is set to true causes Save()
        ///  to automatically call this method. Must be overridden to perform any 
        /// validation.
        /// <seealso>Class wwBusiness Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <returns>True or False.</returns>
        public bool Validate(TEntity entity)
        {
            this.ValidationErrors.Clear();
            this.CheckValidationRules(entity);

            if (this.ValidationErrors.Count > 0)
                return false;
            else
                return true;
        }

        /// <summary>
        /// Validates the current entity object
        /// </summary>
        /// <returns></returns>
        public virtual bool Validate()
        {
            return this.Validate(this.Entity);
        }

        /// <summary>
        /// Formats validation error results for display to client.
        /// </summary>
        /// <returns></returns>
        public virtual string ValidationMessage()
        {
            StringBuilder sb = new StringBuilder();

            if (ValidationErrors.Count > 0)
            {
                sb.Append("<p><span style='font-weight: bold; color: Red;'>Please correct the following errors :</span></p>");
                sb.AppendLine("<table cellpadding='0' cellspacing='5px'>");

                foreach (ValidationError ve in ValidationErrors)
                {
                    sb.Append("<tr><td><span>");
                    sb.AppendLine(ve.Message);
                    sb.Append("</span></td></tr>");
                }
            }

            sb.Append("</table>");

            return sb.ToString();
        }

        protected virtual void CheckValidationRules(TEntity entity)
        {
            ValidationResults vrs = Validation.ValidateFromConfiguration<TEntity>(entity);
            if (!vrs.IsValid)
            {
                foreach (ValidationResult vr in vrs)
                {
                    this.ValidationErrors.Add(vr.Message);
                }
            }
        }

        /// <summary>
        /// Sets an internal error message.
        /// </summary>
        /// <param name="Message"></param>
        public void SetError(string Message)
        {
            if (string.IsNullOrEmpty(Message))
            {
                this.ErrorException = null;
                return;
            }

            this.ErrorException = new ApplicationException(Message);

            if (this.Options.ThrowExceptions)
                throw this.ErrorException;

        }

        /// <summary>
        /// Sets an internal error exception
        /// </summary>
        /// <param name="ex"></param>
        public void SetError(Exception ex)
        {
            this.ErrorException = ex;

            if (ex != null && this.Options.ThrowExceptions)
                throw ex;
        }
        /// <summary>
        /// Clear out errors
        /// </summary>
        public void SetError()
        {
            this.ErrorException = null;
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (this.Context != null)
                this.Context.Dispose();
        }

        #endregion
    }

    /// <summary>
    /// Field structure for holding table information.
    /// A Table Info object is specific for a mapped entity
    /// </summary>
    public class TableInfo
    {
        /// <summary>
        /// Default constructor - no assignments of any sort are applied
        /// </summary>
        public TableInfo() { }

        /// <summary>
        /// Initializes the TableInfo with information
        /// from a provided context
        /// </summary>
        /// <param name="context"></param>
        public TableInfo(DataContext context, Type entityType)
        {
            // *** Retrieve the name of the mapped table from the schema            
            MetaTable metaTable = context.Mapping.GetTable(entityType);

            this.Tablename = metaTable.TableName;


            if (metaTable.RowType.IdentityMembers.Count < 0)
                throw new ApplicationException(this.Tablename + " doesn't have a primary key. Not supported for a business object mapping table.");

            this.PkField = metaTable.RowType.IdentityMembers[0].Name;
            this.PkFieldType = metaTable.RowType.IdentityMembers[0].Type;

            if (metaTable.RowType.VersionMember == null)
                throw new ApplicationException(this.Tablename + " doesn't have a version field. Business object tables mapped require a version field.");

            this.VersionField = metaTable.RowType.VersionMember.Name;
        }

        /// <summary>
        /// The name of the table that is mapped by the main Entity associated
        /// with this business object.
        /// </summary>
        public string Tablename;

        /// <summary>
        /// The version field used by this table. Version fields are required
        /// </summary>
        public string VersionField;

        /// <summary>
        /// The primary key id field used by this table.
        /// </summary>
        public string PkField;

        /// <summary>
        /// The type of the PK field.
        /// </summary>
        public Type PkFieldType;
    }

    /// <summary>
    /// Contains public options that can be set to affect how
    /// the business object operates
    /// </summary>
    public class DataContextOptions
    {
        /// <summary>
        /// Determines whether exceptions are thrown on errors
        /// or whether error messages are merely set.
        /// </summary>
        public bool ThrowExceptions = false;

        /// <summary>
        /// Determines how LINQ is used for object tracking. 
        /// 
        /// In connected mode all changes are tracked until SubmitChanges or Save
        /// is called. Save() reverts to calling SubmitChanges.
        /// 
        /// In disconnected mode a new context is created for each data operation
        /// and save uses Attach to reattach to a context.
        /// 
        /// Use Connected for much better performance use disconnected if you
        /// prefer atomic operations in the database with individual entities.
        /// </summary>
        public TrackingModes TrackingMode = TrackingModes.Connected;

        /// <summary>
        /// Optional Connection string that is used with the data context
        /// 
        /// Note: This property should be set in the constructor of the
        /// business object. 
        /// 
        /// If blank the default context is used.
        /// </summary>
        public string ConnectionString = "";


        /// <summary>
        /// Determines the Conflict Resolution mode for changes submitted
        /// to the context.
        /// </summary>
        public ConflictResolutionModes ConflictResolutionMode = ConflictResolutionModes.ForceChanges;
    }

    /// <summary>
    /// Determines how LINQ Change Tracking is applied
    /// </summary>
    public enum TrackingModes
    {
        /// <summary>
        /// Uses a LINQ connected data context for change management
        /// whenever possible. Save and SubmitChanges operation is used
        /// to persist changes. In general this provides better performance
        /// for change tracking.
        /// </summary>
        Connected,

        /// <summary>
        /// Creates a new DataContext for each operation and performs .Save 
        /// operations by reconnecting to the DataContext.
        /// </summary>
        Disconnected
    }

    public enum ResultListTypes
    {
        DataReader,
        DataTable,
        DataSet
    }

    /// <summary>
    /// Determines how conflicts on SubmitChanges are handled.
    /// </summary>
    public enum ConflictResolutionModes
    {
        /// <summary>
        /// No Conflict resolution - nothing is done when conflicts
        /// occur. You can check this.Context.ChangeConflicts manually
        /// </summary>
        None,
        /// <summary>
        /// Forces all changes to get written. Last one wins strategy
        /// </summary>
        ForceChanges,
        /// <summary>
        /// Aborts all changes and updates the entities with the values
        /// from the database.
        /// </summary>
        AbortChanges,
        /// <summary>
        /// Writes all changes that are not in conflict. Updates entities
        /// with values from the data.
        /// </summary>
        //WriteNonConflictChanges
    }

    /// <summary>
    /// A collection of ValidationError objects that is used to collect
    /// errors that occur duing calls to the Validate method.
    /// </summary>
    public class ValidationErrorCollection : CollectionBase
    {

        /// <summary>
        /// Indexer property for the collection that returns and sets an item
        /// </summary>
        public ValidationError this[int index]
        {
            get
            {
                return (ValidationError)this.List[index];
            }
            set
            {
                this.List[index] = value;
            }
        }

        /// <summary>
        /// Adds a new error to the collection
        /// <seealso>Class ValidationError</seealso>
        /// </summary>
        /// <param name="Error">
        /// Validation Error object
        /// </param>
        /// <returns>Void</returns>
        public void Add(ValidationError Error)
        {
            this.List.Add(Error);
        }



        /// <summary>
        /// Adds a new error to the collection
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Message">
        /// Message of the error
        /// </param>
        /// <param name="FieldName">
        /// optional field name that it applies to (used for Databinding errors on 
        /// controls)
        /// </param>
        /// <param name="ID">
        /// An optional ID you assign the error
        /// </param>
        /// <returns>Void</returns>
        public void Add(string Message, string FieldName, string ID)
        {
            ValidationError Error = new ValidationError();
            Error.Message = Message;
            Error.ControlID = FieldName;
            Error.ID = ID;
            this.Add(Error);
        }

        /// <summary>
        /// Adds a new error to the collection
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Message">
        /// Message of the error
        /// </param>
        /// <returns>Void</returns>
        public void Add(string Message)
        {
            this.Add(Message, "", "");
        }



        /// <summary>
        /// Adds a new error to the collection
        /// </summary>
        /// <param name="Message">Message of the error</param>
        /// <param name="FieldName">optional field name that it applies to (used for Databinding errors on controls)</param>
        public void Add(string Message, string FieldName)
        {
            this.Add(Message, FieldName, "");
        }



        /// <summary>
        /// Removes the item specified in the index from the Error collection
        /// </summary>
        /// <param name="Index"></param>
        public void Remove(int Index)
        {
            if (Index > List.Count - 1 || Index < 0)
                List.RemoveAt(Index);
        }

        /// <summary>
        /// Adds a validation error if the condition is true. Otherwise no item is 
        /// added.
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Condition">
        /// If true this error is added. Otherwise not.
        /// </param>
        /// <param name="Message">
        /// The message for this error
        /// </param>
        /// <param name="FieldName">
        /// Name of the UI field (optional) that this error relates to. Used optionally
        ///  by the databinding classes.
        /// </param>
        /// <param name="ID">
        /// An optional Error ID.
        /// </param>
        /// <returns>value of condition</returns>
        public bool Assert(bool Condition, string Message, string FieldName, string ID)
        {
            if (Condition)
                this.Add(Message, FieldName, ID);

            return Condition;
        }

        /// <summary>
        /// Adds a validation error if the condition is true. Otherwise no item is 
        /// added.
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Condition">
        /// If true the Validation Error is added.
        /// </param>
        /// <param name="Message">
        /// The Error Message for this error.
        /// </param>
        /// <returns>value of condition</returns>
        public bool Assert(bool Condition, string Message)
        {
            if (Condition)
                this.Add(Message);

            return Condition;
        }

        /// <summary>
        /// Adds a validation error if the condition is true. Otherwise no item is 
        /// added.
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Condition">
        /// If true the Validation Error is added.
        /// </param>
        /// <param name="Message">
        /// The Error Message for this error.
        /// </param>
        /// <returns>string</returns>
        public bool Assert(bool Condition, string Message, string FieldName)
        {
            if (Condition)
                this.Add(Message, FieldName);

            return Condition;
        }


        /// <summary>
        /// Asserts a business rule - if condition is true it's added otherwise not.
        /// <seealso>Class ValidationErrorCollection</seealso>
        /// </summary>
        /// <param name="Condition">
        /// If this condition evaluates to true the Validation Error is added
        /// </param>
        /// <param name="Error">
        /// Validation Error Object
        /// </param>
        /// <returns>value of condition</returns>
        public bool Assert(bool Condition, ValidationError Error)
        {
            if (Condition)
                this.List.Add(Error);

            return Condition;
        }


        /// <summary>
        /// Returns a string representation of the errors in this collection.
        /// The string is separated by CR LF after each line.
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            if (this.Count < 1)
                return "";

            StringBuilder sb = new StringBuilder(128);

            foreach (ValidationError Error in this)
            {
                sb.Append(Error.Message);
                sb.Append("\r\n");
            }

            return sb.ToString();
        }

        /// <summary>
        /// Returns an HTML representation of the errors in this collection.
        /// The string is returned as an HTML list.
        /// </summary>
        /// <returns></returns>
        public string ToHtml()
        {
            if (this.Count < 1)
                return "";

            StringBuilder sb = new StringBuilder(256);
            sb.Append("<ul>\r\n");

            foreach (ValidationError Error in this)
            {
                sb.Append("<li> ");

                if (Error.ControlID != null && Error.ControlID != "")
                    sb.Append("<a href='javascript:;' onclick=\"document.getElementById('" + Error.ControlID + "').focus();document.getElementById('" + Error.ControlID + "').style.background='cornsilk';\" class='errordisplay' style='border:0px;text-decoration:none'>" + Error.Message + "</a>");
                else
                    sb.Append(Error.Message);

                sb.Append("</li>\r\n");
            }

            sb.Append("</ul>\r\n");
            return sb.ToString();
        }
    }

    /// <summary>
    /// Object that holds a single Validation Error for the business object
    /// </summary>
    public class ValidationError
    {

        /// <summary>
        /// The error message for this validation error.
        /// </summary>
        public string Message
        {
            get
            {
                return this.cMessage;
            }
            set
            {
                this.cMessage = value;
            }
        }
        string cMessage = "";

        /// <summary>
        /// The name of the field that this error relates to.
        /// </summary>
        public string ControlID
        {
            get { return this.cFieldName; }
            set { this.cFieldName = value; }
        }
        string cFieldName = "";

        /// <summary>
        /// An ID set for the Error. This ID can be used as a correlation between bus object and UI code.
        /// </summary>
        public string ID
        {
            get { return this.cID; }
            set { this.cID = value; }
        }
        string cID = "";

        public ValidationError() : base() { }
        public ValidationError(string Message)
        {
            this.Message = Message;
        }
        public ValidationError(string Message, string FieldName)
        {
            this.Message = Message;
            this.ControlID = FieldName;
        }
        public ValidationError(string Message, string FieldName, string ID)
        {
            this.Message = Message;
            this.ControlID = FieldName;
            this.ID = ID;
        }

    }
}

