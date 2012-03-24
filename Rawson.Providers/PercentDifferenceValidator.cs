using System;
using System.Collections.Generic;
using System.Linq;

using Microsoft.Practices.EnterpriseLibrary.Validation; 

using System.Collections.Specialized; 
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration; 
using Microsoft.Practices.EnterpriseLibrary.Validation.Configuration;
using Rawson.Data.Model; 

namespace Rawson.Providers
{
    [ConfigurationElementType(typeof(CustomValidatorData))] 
    public class PercentDifferenceValidator : Validator<decimal>
    {
        private decimal _maxPercent;

        public PercentDifferenceValidator(NameValueCollection attributes)
            : base(String.Empty, String.Empty)
        {
            _maxPercent = attributes["maxPercent"] == null ? 3 : decimal.Parse(attributes["maxPercent"]);
        }

        protected override string DefaultMessageTemplate
        {
            get { throw new NotImplementedException(); }
        }

        protected override void DoValidate(decimal objectToValidate, object currentTarget, string key, ValidationResults validationResults)
        {
            double? setPressure = ((ValveTest)currentTarget).SetPressure;
            double? backPressure = ((ValveTest)currentTarget).BackPressure;

            if (setPressure.HasValue && setPressure.Value > 0)
            {
                if (backPressure.HasValue && backPressure.Value > 0)
                    setPressure = setPressure - backPressure;

                var sp = Convert.ToDecimal(setPressure.Value);
                var difference = Math.Abs(sp - objectToValidate);

                if (setPressure >= 70)
                {
                    if (((difference / sp) * 100) > 3)
                        LogValidationResult(validationResults, "Set pressure left exceeds tolerance percentage (+/- 3%) in relation to original set pressure.", currentTarget, key);
                }
                else
                {
                    if (difference > 2)
                        LogValidationResult(validationResults, "Set pressure left exceeds tolerance PSI (+/- 2) in relation to original set pressure.", currentTarget, key);
                }
            }
            else
            {
                LogValidationResult(validationResults, "Set pressure can not be zero.", currentTarget, key);
            }

            
        }
    }
}
