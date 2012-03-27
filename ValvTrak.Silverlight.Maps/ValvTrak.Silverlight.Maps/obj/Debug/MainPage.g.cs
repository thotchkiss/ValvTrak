﻿#pragma checksum "C:\Users\Tim\ValvTrak\ValvTrak.Silverlight.Maps\ValvTrak.Silverlight.Maps\MainPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "EEF83DC4F82E6CDAAD1BDC48961C75CD"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.530
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace ValvTrak.Silverlight.Maps {
    
    
    public partial class MainPage : System.Windows.Controls.UserControl {
        
        internal BackgroundPanel LayoutRoot;
        
        internal BarManager barManager;
        
        internal BarManagerCategory File;
        
        internal BarManagerCategory Edit;
        
        internal BarManagerCategory Help;
        
        internal BarManagerCategory BuiltIn;
        
        internal BarButtonItem bNew;
        
        internal BarButtonItem bOpen;
        
        internal BarButtonItem bClose;
        
        internal BarButtonItem bSave;
        
        internal BarButtonItem bSaveAs;
        
        internal BarButtonItem bPrint;
        
        internal BarButtonItem bExit;
        
        internal BarButtonItem bHome;
        
        internal BarButtonItem bAbout;
        
        internal BarSubItem smFile;
        
        internal BarSubItem smHelp;
        
        internal Bar MainMenu;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/ValvTrak.Silverlight.Maps;component/MainPage.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((BackgroundPanel)(this.FindName("LayoutRoot")));
            this.barManager = ((BarManager)(this.FindName("barManager")));
            this.File = ((BarManagerCategory)(this.FindName("File")));
            this.Edit = ((BarManagerCategory)(this.FindName("Edit")));
            this.Help = ((BarManagerCategory)(this.FindName("Help")));
            this.BuiltIn = ((BarManagerCategory)(this.FindName("BuiltIn")));
            this.bNew = ((BarButtonItem)(this.FindName("bNew")));
            this.bOpen = ((BarButtonItem)(this.FindName("bOpen")));
            this.bClose = ((BarButtonItem)(this.FindName("bClose")));
            this.bSave = ((BarButtonItem)(this.FindName("bSave")));
            this.bSaveAs = ((BarButtonItem)(this.FindName("bSaveAs")));
            this.bPrint = ((BarButtonItem)(this.FindName("bPrint")));
            this.bExit = ((BarButtonItem)(this.FindName("bExit")));
            this.bHome = ((BarButtonItem)(this.FindName("bHome")));
            this.bAbout = ((BarButtonItem)(this.FindName("bAbout")));
            this.smFile = ((BarSubItem)(this.FindName("smFile")));
            this.smHelp = ((BarSubItem)(this.FindName("smHelp")));
            this.MainMenu = ((Bar)(this.FindName("MainMenu")));
        }
    }
}

