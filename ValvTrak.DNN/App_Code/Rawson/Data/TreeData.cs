using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rawson.Data
{
    /// <summary>
    /// Summary description for TreeData
    /// </summary>
    public class TreeData
    {

        public Guid ID { get; set; }
        public Guid? ParentID { get; set; }
        public int DataID { get; set; }
        public bool IsLeaf { get; set; }
        public string Label { get; set; }

    }

}