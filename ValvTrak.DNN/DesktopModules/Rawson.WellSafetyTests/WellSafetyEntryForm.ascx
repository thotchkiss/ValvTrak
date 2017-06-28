<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WellSafetyEntryForm.ascx.cs" Inherits="Rawson.WellSafetyTests.WellSafetyEntryForm" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.16.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Import namespace="System.Linq" %>

<script runat="server">



    protected void LinqDataSource_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {

        using (var db = new Rawson.Model.ValvTrakModel())
        {
            //var job = db.Jobs.First(x => x.JobID = jobID);




            //e.Result = result;
        }

    }

</script>


<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource">
    <settingsediting mode="Batch">
        <batcheditsettings editmode="Row" />
    </settingsediting>
    <settingsbehavior confirmdelete="True" />
    <Columns>
        <dx:GridViewDataTextColumn Caption="SRO #" Name="colSRONumber" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="FSR #" Name="colFSRNumber" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Route" Name="colRoute" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="WO #" Name="colWONumber" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Tech" Name="colTech" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Location / Well Name" Name="colLocation" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Application" Name="colApplication" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Manufacturer" Name="colManufacturer" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Model or Part Num." Name="colModel" VisibleIndex="9">
            <propertiestextedit nulltext="N/A"></propertiestextedit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Serial Num." Name="colSerialNumber" VisibleIndex="10">
            <propertiestextedit nulltext="N/A"></propertiestextedit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Completion Test" Name="colTestDate" VisibleIndex="12">
            <propertiesdateedit displayformatstring=""></propertiesdateedit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Set Press. Found" Name="colSetPressureFound" VisibleIndex="13">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Set Press. Left" Name="colSetPressureLeft" VisibleIndex="14">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Test Result" Name="colTestResult" VisibleIndex="15">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Type of Valve" Name="colValveType" VisibleIndex="16">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Date Manufactured" Name="colDateManufactured" VisibleIndex="11">
            <propertiesdateedit displayformatstring="" nulltext="N/A"></propertiesdateedit>
        </dx:GridViewDataDateColumn>
    </Columns>
</dx:ASPxGridView>

<asp:LinqDataSource ID="LinqDataSource" runat="server" ContextTypeName="Rawson.Model.ValvTrakDBModel" EntityTypeName="" OnSelecting="LinqDataSource_Selecting" TableName="WellSafetyTests">
</asp:LinqDataSource>





