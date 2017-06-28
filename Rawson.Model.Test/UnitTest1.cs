using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Rawson.Model.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void EnsureDatabase()
        {
            ValvTrakEntities.CreateDataBaseFromLINQ();
        }
    }
}
