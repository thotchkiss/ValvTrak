using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rawson.App
{
    /// <summary>
    /// Generic helper class for building ComboBox values.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class ComboBoxValue<T>
    {
            public string DisplayMember { get; set; }
            public T ValueMember { get; set; }

            /// <summary>
            /// Create a new ComboBoxValue of an unspecified type.
            /// </summary>
            /// <remarks>Internal class use only.</remarks>
            public ComboBoxValue()
            {
            }

            /// <summary>
            /// Create a new ComboBoxValue of the specified type.
            /// </summary>
            /// <typeparamref name="T">The class type of the value.</typeparamref>>
            /// <param name="displayMember">A string used for the displayMember of the ComboBox.</param>
            /// <param name="valueMember">An object of Type T used for the valueMember of the ComboBox.</param>
            public ComboBoxValue(
                string displayMember,
                T valueMember)
            {
                DisplayMember = displayMember;
                ValueMember = valueMember;
            }

            /// <summary>
            /// Compares two ComboBoxValues by the DisplayMember property.
            /// </summary>
            /// <param name="obj">The ComboBoxValue to compare against this instance.</param>
            /// <returns>true if the DisplayMembers are equal.</returns>
            public override bool Equals(object obj)
            {
                if (obj is ComboBoxValue<T>)
                {
                    return ((ComboBoxValue<T>)obj).DisplayMember == this.DisplayMember;
                }

                return false;
            }

            /// <summary>
            /// Get the DisplayMember of the ComboBoxValue as the ToString() result.
            /// </summary>
            /// <returns>The DisplayMember string.</returns>
            public override string ToString()
            {
                return DisplayMember;
            }

            /// <summary>
            /// Get the HashCode of the ComboBoxValue from the DisplayMember.
            /// </summary>
            /// <returns>The HashCode of the DisplayMember.</returns>
            public override int GetHashCode()
            {
                return DisplayMember.GetHashCode();
            }

            ///// <summary>
            ///// Helper method to assign an IEnumerable of ComboBoxValues of the specified type to a Windows ComboBox.
            ///// The ComboBox's DisplayMember and ValueMember properties are automatically assigned.
            ///// </summary>
            ///// <typeparamref name="T">The class type of the values.</typeparamref>>
            ///// <param name="comboBox">The System.Windows.Forms.ComboBox to be assigned the list as a DataSource.</param>
            ///// <param name="comboBoxValues">An IEnumerable of type T values to use as the values.</param>
            //public static void AssignValuesToComboBox(
            //    System.Windows.Forms.ComboBox comboBox,
            //    IEnumerable<ComboBoxValue<T>> comboBoxValues)
            //{
            //    comboBox.DataSource = null; // Allow for changes to the IEnumerable
            //    comboBox.DataSource = comboBoxValues;
            //    comboBox.DisplayMember = "DisplayMember";
            //    comboBox.ValueMember = "ValueMember";
            //}

            ///// <summary>
            ///// Helper method to assign an IEnumerable of ComboBoxValues of the specified type to a DevExpress ComboBoxEdit.
            ///// The ComboBoxEdit's Properties.Items property is automatically cleared and repopulated.
            ///// </summary>
            ///// <typeparamref name="T">The class type of the values.</typeparamref>>
            ///// <param name="comboBox">The DevExpress.XtraEditors.ComboBoxEdit to be assigned the list as the values of the Properties.Items collection.</param>
            ///// <param name="comboBoxValues">An IEnumerable of type T values to use as the values.</param>
            ///// <remarks>This is for the windows version of the DevEx combo box.</remarks>
            //public static void AssignValuesToComboBoxEdit(
            //    ComboBoxEdit comboBoxEdit,
            //    IEnumerable<ComboBoxValue<T>> comboBoxValues)
            //{
            //    comboBoxEdit.Properties.Items.BeginUpdate();

            //    comboBoxEdit.Properties.Items.Clear();
            //    comboBoxEdit.Properties.Items.AddRange(comboBoxValues.ToArray());

            //    comboBoxEdit.Properties.Items.EndUpdate();
            //}

            ///// <summary>
            ///// Helper method to assign an IEnumerable of ComboBoxValues of the specified type to a DevExpress CheckedListBoxControl.
            ///// The ComboBoxEdit's Properties.Items property is automatically cleared and repopulated.
            ///// </summary>
            ///// <typeparamref name="T">The class type of the values.</typeparamref>>
            ///// <param name="comboBox">The DevExpress.XtraEditors.ComboBoxEdit to be assigned the list as the values of the Properties.Items collection.</param>
            ///// <param name="comboBoxValues">An IEnumerable of type T values to use as the values.</param>
            ///// <remarks>This is for the windows version of the control.</remarks>
            //public static void AssignValuesToCheckedListBoxControl(
            //    CheckedListBoxControl checkedListBoxControl,
            //    IEnumerable<ComboBoxValue<T>> comboBoxValues)
            //{
            //    checkedListBoxControl.Items.BeginUpdate();

            //    checkedListBoxControl.Items.Clear();
            //    checkedListBoxControl.Items.AddRange(comboBoxValues.ToArray());

            //    checkedListBoxControl.Items.EndUpdate();
            //}

            ///// <summary>
            ///// Set the selected value for a DevExpress ComboBoxEdit.
            ///// </summary>
            ///// <param name="comboBoxEdit">The DevExpress.XtraControls.ComboBoxEdit control to use.</param>
            ///// <param name="displayValue">The display value (string) to use for determining the item to select.</param>
            ///// <remarks>If the displayValue is not found, the first item (index 0) will be selected instead.
            ///// This is for the windows version of the control.
            ///// </remarks>
            //public static void SetComboBoxEditSelectedValue(
            //    ComboBoxEdit comboBoxEdit,
            //    string displayValue)
            //{
            //    SetComboBoxEditSelectedValue(comboBoxEdit, displayValue, false);
            //}

            ///// <summary>
            ///// Set the selected value for a DevExpress ComboBoxEdit.
            ///// </summary>
            ///// <param name="comboBoxEdit">The DevExpress.XtraControls.ComboBoxEdit control to use.</param>
            ///// <param name="displayValue">The display value (string) to use for determining the item to select.</param>
            ///// <param name="matchBeginning">True to match the first item that starts with the specified displayValue.</param>
            ///// <remarks>If the displayValue is not found, the first item (index 0) will be selected instead.
            ///// This is for the windows version of the control.
            ///// </remarks>
            //public static void SetComboBoxEditSelectedValue(
            //    ComboBoxEdit comboBoxEdit,
            //    string displayValue,
            //    bool matchBeginning)
            //{
            //    foreach (ComboBoxValue<T> ComboBoxValue in comboBoxEdit.Properties.Items)
            //    {
            //        if ((!matchBeginning && displayValue == ComboBoxValue.DisplayMember)
            //            ||
            //            matchBeginning && displayValue.StartsWith(ComboBoxValue.DisplayMember))
            //        {
            //            comboBoxEdit.SelectedItem = ComboBoxValue;
            //            return;
            //        }
            //    }

            //    // Use the default item

            //    comboBoxEdit.SelectedIndex = 0;
            //}

            ///// <summary>
            ///// Sets the selected value for a DexExpress ComboBox based on the value member.
            ///// </summary>
            ///// <param name="comboBoxEdit">The control to set the value in.</param>
            ///// <param name="valueMember">The value in the list to set as selected.</param>
            ///// <remarks>This is for the windows version of the control.</remarks>
            //public static void SetComboBoxEditSelectedValue(ComboBoxEdit comboBoxEdit, T valueMember)
            //{
            //    foreach (ComboBoxValue<T> ComboBoxValue in comboBoxEdit.Properties.Items)
            //    {
            //        if (valueMember.Equals(ComboBoxValue.ValueMember))
            //        {
            //            comboBoxEdit.SelectedItem = ComboBoxValue;
            //            return;
            //        }
            //    }

            //    // Use the default item

            //    comboBoxEdit.SelectedIndex = 0;
            //}

            ///// <summary>
            ///// Get the selected value from a DevExpress ComboBoxEdit.
            ///// </summary>
            ///// <param name="comboBoxEdit">The DevExpress.XtraControls.ComboBoxEdit to use.</param>
            ///// <returns>The currently selected value from the ComboBoxEdit control.</returns>
            ///// <remarks>This is for the windows version of the control.</remarks>
            //public static T GetComboBoxEditSelectedValue(ComboBoxEdit comboBoxEdit)
            //{
            //    ComboBoxValue<T> selectedItem =
            //        (ComboBoxValue<T>)comboBoxEdit.SelectedItem;

            //    if (selectedItem == null)
            //    {
            //        return default(T); // This will return a null for reference or nullable types
            //    }
            //    else
            //    {
            //        return selectedItem.ValueMember;
            //    }
            //}
        }
}
