using Microsoft.Practices.EnterpriseLibrary.Validation;
using Rawson.Data.Controllers;
using Rawson.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for WellSafetyEntryController
    /// </summary>
    public class WellSafetyTestExtController : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        ValvTrakModel _model;

        Job _curJob;
        WellSafetyTestExt _curTest;

        public WellSafetyTestExtController() 
        {
            _model = new ValvTrakModel();
        }

        public WellSafetyTestExt Entity { get; set; }

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


        public void LoadJob(int jobId)
        {
            _curJob = _model.Jobs.Include("WellSafetyTestExts").SingleOrDefault(j => j.JobID == jobId);
        }

        /// <summary>
        /// Create a disconnected entity object
        /// </summary>
        /// <returns></returns>
        public virtual void NewEntity()
        {
            this.SetError();
            this.Entity = _model.WellSafetyTestExts.Create();
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
        }

        /// <summary>
        /// Sets an internal error exception
        /// </summary>
        /// <param name="ex"></param>
        public void SetError(Exception ex)
        {
            this.ErrorException = ex;
        }

        /// <summary>
        /// Clear out errors
        /// </summary>
        public void SetError()
        {
            this.ErrorException = null;
        }

        public bool Validate()
        {
            Validator<WellSafetyTestExt> validator = ValidationFactory.CreateValidator<WellSafetyTestExt>("Default");
            ValidationResults vr = validator.Validate(_curTest);

            if (!vr.IsValid)
            {
                foreach (ValidationResult r in vr)
                {
                    ValidationErrors.Add(r.Message);
                }
            }

            return vr.IsValid;
        }

        ValidationErrorCollection _validationErrors;
        public ValidationErrorCollection ValidationErrors
        {
            get
            {
                if (_validationErrors == null)
                    _validationErrors = new ValidationErrorCollection();

                return _validationErrors;
            }

        }

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

        public async Task<bool> Save()
        {
            if (!Validate())
                return false;

            var orig = await _model.WellSafetyTestExts.FindAsync(_curTest.ID);

            if (orig == null)
                _model.WellSafetyTestExts.Attach(_curTest);

            int count = await _model.SaveChangesAsync();

            return count > 0;
        }
    }
}