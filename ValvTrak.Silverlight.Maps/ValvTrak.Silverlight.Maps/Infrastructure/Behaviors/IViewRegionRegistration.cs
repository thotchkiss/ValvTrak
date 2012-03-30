using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ValvTrak.Silverlight.Maps.Infrastructure.Behaviors
{
    public interface IViewRegionRegistration
    {
        string RegionName { get; }
    }
}
