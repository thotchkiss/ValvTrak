﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using ValvTrak.Silverlight.Maps.Infrastructure.Behaviors;
using ValvTrak.Silverlight.Maps.Infrastructure.Constants;

namespace ValvTrak.Silverlight.Maps.Views
{
    [ViewExport(RegionName=RegionNames.NavigationRegion)]
    public partial class NavigationView : UserControl
    {
        public NavigationView()
        {
            InitializeComponent();
        }
    }
}
