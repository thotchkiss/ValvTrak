using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using DotNetNuke.Entities.Users;
using Rawson.App;
using Rawson.App.Security;
using Rawson.Data.Model;
using Microsoft.Practices.EnterpriseLibrary.Validation;
using DotNetNuke.Common.Utilities;
using System.Data.Linq;

namespace Rawson.Data.Controllers
{
    /// <summary>
    /// Summary description for JobFormController
    /// </summary>
    public class JobFormController : BaseController<Job>
    {
        public JobFormController()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public List<JobFormGridItem> GetCurrentJobServiceForms()
        {
            int jobId = Entity.JobID;
            int jobTypeId = Entity.JobTypeID;

            List<JobFormGridItem> forms = new List<JobFormGridItem>();

            switch (jobTypeId)
            {
                case (int)JobTypeEnum.Testing:
                    forms = Context.ValveTests.Where(vt => vt.JobID == jobId).Select(vt => new JobFormGridItem
                                       {
                                           ID = vt.ValveTestID,
                                           ServiceItemID = vt.ServiceItemID,
                                           JobTypeID = jobTypeId,
                                           SerialNum = vt.ServiceItem.SerialNum,
                                           Result = vt.TestResult.Result
                                       }).ToList();
                    break;
                case (int)JobTypeEnum.Greasing:
                    forms = Context.GreasingRecords.Where(gr => gr.JobID == jobId).Select(gr => new JobFormGridItem
                                        {
                                            ID = gr.GreasingRecordID,
                                            ServiceItemID = new int?(),
                                            JobTypeID = jobTypeId,
                                            SerialNum = "",
                                            Result = ""
                                        }).ToList();
                    break;
                case (int)JobTypeEnum.WellSafety:
                    forms = Context.WellSafetyTests.Where(ws => ws.JobID == jobId).Select(ws => new JobFormGridItem
                                          {
                                              ID = ws.WellSafetyTestID,
                                              ServiceItemID = ws.ServiceItemID,
                                              JobTypeID = jobTypeId,
                                              SerialNum = ws.ServiceItem.SerialNum,
                                              Result = ws.TestResult.Result
                                          }).ToList();
                    break;
            }

            return forms;

        }

        public void UpdateServiceSchedule()
        {
            try
            {
                if (Entity.CompletionDate.HasValue)
                {
                    ClientLocationServiceSchedule schedule = Context.ClientLocationServiceSchedules.FirstOrDefault(clss => clss.ClientLocationId == Entity.ClientLocationID && clss.JobTypeId == Entity.JobTypeID);

                    if (schedule == null)
                    {
                        schedule = new ClientLocationServiceSchedule();

                        schedule.ClientLocationId = Entity.ClientLocationID;
                        schedule.JobTypeId = Entity.JobTypeID;
                        schedule.ServiceIntervalId = 1; // One year default

                        Table<ClientLocationServiceSchedule> table = this.Context.GetTable(typeof(ClientLocationServiceSchedule)) as Table<ClientLocationServiceSchedule>;
                        table.InsertOnSubmit(schedule);
                    }

                    schedule.LastServiceDate = Entity.CompletionDate.Value;

                    Context.SubmitChanges();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        public override List<ComboBoxValue<int>> GetAuthorizedClients(int userId)
        {
            List<ComboBoxValue<int>> list = base.GetAuthorizedClients(userId);
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Client --", ValueMember = -1 });

            return list;
        }

        public override List<ComboBoxValue<int>> GetAuthorizedLocations(int userId, int clientId)
        {
            List<ComboBoxValue<int>> list = base.GetAuthorizedLocations(userId, clientId);
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Location --", ValueMember = -1 });

            return list;
        }

        public override List<ComboBoxValue<int>> GetJobTypesList()
        {
            List<ComboBoxValue<int>> list = base.GetJobTypesList();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Job Type --", ValueMember = -1 });

            return list;
        }

        public override List<ComboBoxValue<int>> GetJobStatuses()
        {
            List<ComboBoxValue<int>> list = base.GetJobStatuses();
            list.Insert(0, new ComboBoxValue<int> { DisplayMember = "-- Select Job Status --", ValueMember = -1 });

            return list;
        }
    }

    public class JobFormGridItem
    {
        public int ID { get; set; }
        public int? ServiceItemID { get; set; }
        public int JobTypeID { get; set; }
        public string SerialNum { get; set; }
        public string Result { get; set; }
    }
}