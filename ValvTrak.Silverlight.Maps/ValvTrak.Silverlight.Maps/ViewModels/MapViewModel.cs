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
using Microsoft.Practices.Prism.ViewModel;
using System.ComponentModel.Composition;

namespace ValvTrak.Silverlight.Maps.ViewModels
{
    [Export(typeof(MapViewModel))]
    [PartCreationPolicy(CreationPolicy.Shared)]
    public class MapViewModel : NotificationObject
    {

    }
}
