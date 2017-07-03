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
    public class WellSafetyEntryController : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        ValvTrakModel _model;

        Job _curJob;
        WellSafetyTest _curTest;

        public WellSafetyEntryController() 
        {
            _model = new ValvTrakModel();
        }
        
        public void LoadJob(int jobId)
        {
            _curJob = _model.Jobs.Include("WellSafetyTests").SingleOrDefault(j => j.JobID == jobId);
        }

        public bool Validate()
        {
            Validator<WellSafetyTest> validator = ValidationFactory.CreateValidator<WellSafetyTest>("Default");
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

            var orig = await _model.WellSafetyTests.FindAsync(_curTest.WellSafetyTestID);

            if (orig == null)
                _model.WellSafetyTests.Attach(_curTest);

            int count = await _model.SaveChangesAsync();

            return count > 0;
        }
    }
}