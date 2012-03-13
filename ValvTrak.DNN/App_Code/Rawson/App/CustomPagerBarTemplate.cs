using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.Web.ASPxGridView;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

namespace Rawson.App
{
    public class CustomPagerBarTemplate : ITemplate
    {
        ASPxGridView grid;
        enum PageBarButtonType { First, Prev, Next, Last }

        protected ASPxGridView Grid { get { return grid; } }

        public void InstantiateIn ( Control container )
        {
            this.grid = (ASPxGridView)( (GridViewPagerBarTemplateContainer)container ).Grid;
            Table table = new Table ();
            container.Controls.Add ( table );
            TableRow row = new TableRow ();
            table.Rows.Add ( row );
            AddButtonCell ( row.Cells, IsButtonEnabled ( PageBarButtonType.First ), "First", "pageBarFirstButton_Click" );
            AddButtonCell ( row.Cells, IsButtonEnabled ( PageBarButtonType.Prev ), "Prev", "pageBarPrevButton_Click" );
            AddLiteralCell ( row.Cells, "Page" );
            AddTextBoxCell ( row.Cells );
            AddLiteralCell ( row.Cells, string.Format ( "of {0}", Grid.PageCount ) );
            AddButtonCell ( row.Cells, IsButtonEnabled ( PageBarButtonType.Next ), "Next", "pageBarNextButton_Click" );
            AddButtonCell ( row.Cells, IsButtonEnabled ( PageBarButtonType.Last ), "Last", "pageBarLastButton_Click" );
            AddSpacerCell ( row.Cells );
            AddLiteralCell ( row.Cells, "Records per page:" );
            AddComboBoxCell ( row.Cells );
        }
        void AddButtonCell ( TableCellCollection cells, bool enabled, string text, string clickHandlerName )
        {
            TableCell cell = new TableCell ();
            cells.Add ( cell );
            ASPxButton button = new ASPxButton ();
            cell.Controls.Add ( button );
            button.Text = text;
            button.AutoPostBack = false;
            button.UseSubmitBehavior = false;
            button.Enabled = enabled;
            if ( enabled )
                button.ClientSideEvents.Click = clickHandlerName;
        }
        void AddTextBoxCell ( TableCellCollection cells )
        {
            TableCell cell = new TableCell ();
            cells.Add ( cell );
            ASPxTextBox textBox = new ASPxTextBox ();
            cell.Controls.Add ( textBox );
            textBox.Width = 30;
            int pageNumber = Grid.PageIndex + 1;
            textBox.JSProperties[ "cpText" ] = pageNumber;
            textBox.ClientSideEvents.Init = "pageBarTextBox_Init";
            textBox.ClientSideEvents.ValueChanged = "pageBarTextBox_ValueChanged";
            textBox.ClientSideEvents.KeyPress = "pageBarTextBox_KeyPress";
        }
        void AddComboBoxCell ( TableCellCollection cells )
        {
            TableCell cell = new TableCell ();
            cells.Add ( cell );
            ASPxComboBox comboBox = new ASPxComboBox ();
            cell.Controls.Add ( comboBox );
            comboBox.Width = 50;
            comboBox.DropDownWidth = 50;
            comboBox.Items.Add ( new ListEditItem ( "10" ) );
            comboBox.Items.Add ( new ListEditItem ( "20" ) );
            comboBox.Items.Add ( new ListEditItem ( "30" ) );
            comboBox.ValueType = Type.GetType ( "Int32" );
            comboBox.Value = Grid.SettingsPager.PageSize;
            comboBox.ClientSideEvents.SelectedIndexChanged = "pagerBarComboBox_SelectedIndexChanged";
        }
        void AddLiteralCell ( TableCellCollection cells, string text )
        {
            TableCell cell = new TableCell ();
            cells.Add ( cell );
            cell.Text = text;
            cell.Wrap = false;
        }
        void AddSpacerCell ( TableCellCollection cells )
        {
            TableCell cell = new TableCell ();
            cells.Add ( cell );
            cell.Width = Unit.Percentage ( 100 );
        }
        bool IsButtonEnabled ( PageBarButtonType type )
        {
            if ( Grid.PageIndex == 0 )
            {
                if ( type == PageBarButtonType.First || type == PageBarButtonType.Prev )
                    return false;
            }
            if ( Grid.PageIndex == Grid.PageCount - 1 )
            {
                if ( type == PageBarButtonType.Next || type == PageBarButtonType.Last )
                    return false;
            }
            return true;
        }
    }
}

