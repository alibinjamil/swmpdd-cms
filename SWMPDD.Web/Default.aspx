<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SWMPDD.Web.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" AllowSorting="True" DataKeyNames="ClientId" 
        DataSourceID="EntityDataSource1">
    <Columns>
        <asp:BoundField DataField="ClientId" HeaderText="ClientId" ReadOnly="True" 
            SortExpression="ClientId" />
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
            SortExpression="FirstName" />
        <asp:BoundField DataField="MiddleInitial" HeaderText="MiddleInitial" 
            SortExpression="MiddleInitial" />
        <asp:BoundField DataField="LastName" HeaderText="LastName" 
            SortExpression="LastName" />
        <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
            SortExpression="DateOfBirth" />
        <asp:BoundField DataField="Address1" HeaderText="Address1" 
            SortExpression="Address1" />
        <asp:BoundField DataField="Address2" HeaderText="Address2" 
            SortExpression="Address2" />
        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:BoundField DataField="County" HeaderText="County" 
            SortExpression="County" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" 
            SortExpression="Gender" />
        <asp:BoundField DataField="OtherComments" HeaderText="OtherComments" 
            SortExpression="OtherComments" />
        <asp:BoundField DataField="ParticipantSignature" 
            HeaderText="ParticipantSignature" SortExpression="ParticipantSignature" />
        <asp:BoundField DataField="SignatureDate" HeaderText="SignatureDate" 
            SortExpression="SignatureDate" />
        <asp:BoundField DataField="ClientTypeId" HeaderText="ClientTypeId" 
            SortExpression="ClientTypeId" />
        <asp:BoundField DataField="ServicesNeeded" HeaderText="ServicesNeeded" 
            SortExpression="ServicesNeeded" />
        <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" 
            SortExpression="CreationDate" />
        <asp:BoundField DataField="CreationUser" HeaderText="CreationUser" 
            SortExpression="CreationUser" />
        <asp:BoundField DataField="LastUpdateTime" HeaderText="LastUpdateTime" 
            SortExpression="LastUpdateTime" />
        <asp:BoundField DataField="LastUpdateUser" HeaderText="LastUpdateUser" 
            SortExpression="LastUpdateUser" />
        <asp:BoundField DataField="ApplicationApprovedBy" 
            HeaderText="ApplicationApprovedBy" SortExpression="ApplicationApprovedBy" />
        <asp:BoundField DataField="IPAddress" HeaderText="IPAddress" 
            SortExpression="IPAddress" />
        <asp:BoundField DataField="ClientAt" HeaderText="ClientAt" 
            SortExpression="ClientAt" />
        <asp:BoundField DataField="InOtherCase" HeaderText="InOtherCase" 
            SortExpression="InOtherCase" />
        <asp:BoundField DataField="SSN" HeaderText="SSN" SortExpression="SSN" />
        <asp:BoundField DataField="Medicare" HeaderText="Medicare" 
            SortExpression="Medicare" />
        <asp:BoundField DataField="Medicaid" HeaderText="Medicaid" 
            SortExpression="Medicaid" />
        <asp:BoundField DataField="ContactPerson" HeaderText="ContactPerson" 
            SortExpression="ContactPerson" />
        <asp:BoundField DataField="RelationshipToClient" 
            HeaderText="RelationshipToClient" SortExpression="RelationshipToClient" />
        <asp:BoundField DataField="ContactPhone" HeaderText="ContactPhone" 
            SortExpression="ContactPhone" />
        <asp:BoundField DataField="Direction" HeaderText="Direction" 
            SortExpression="Direction" />
        <asp:BoundField DataField="ReferralSoruce" HeaderText="ReferralSoruce" 
            SortExpression="ReferralSoruce" />
        <asp:BoundField DataField="ReferralPhone" HeaderText="ReferralPhone" 
            SortExpression="ReferralPhone" />
        <asp:BoundField DataField="Physician" HeaderText="Physician" 
            SortExpression="Physician" />
        <asp:BoundField DataField="PhysicianPhone" HeaderText="PhysicianPhone" 
            SortExpression="PhysicianPhone" />
        <asp:BoundField DataField="PhysicianAddress" HeaderText="PhysicianAddress" 
            SortExpression="PhysicianAddress" />
        <asp:BoundField DataField="PhysicianCity" HeaderText="PhysicianCity" 
            SortExpression="PhysicianCity" />
        <asp:BoundField DataField="PhysicianZip" HeaderText="PhysicianZip" 
            SortExpression="PhysicianZip" />
        <asp:BoundField DataField="Diagnostic" HeaderText="Diagnostic" 
            SortExpression="Diagnostic" />
        <asp:BoundField DataField="Diet" HeaderText="Diet" SortExpression="Diet" />
        <asp:BoundField DataField="AdditionalPertinent" 
            HeaderText="AdditionalPertinent" SortExpression="AdditionalPertinent" />
        <asp:CheckBoxField DataField="VerificationOfMedicaidStatus" 
            HeaderText="VerificationOfMedicaidStatus" 
            SortExpression="VerificationOfMedicaidStatus" />
        <asp:BoundField DataField="VerificationDate" HeaderText="VerificationDate" 
            SortExpression="VerificationDate" />
        <asp:CheckBoxField DataField="LockinStatus" HeaderText="LockinStatus" 
            SortExpression="LockinStatus" />
        <asp:BoundField DataField="DateClientContacted" 
            HeaderText="DateClientContacted" SortExpression="DateClientContacted" />
        <asp:BoundField DataField="ByWhom" HeaderText="ByWhom" 
            SortExpression="ByWhom" />
        <asp:BoundField DataField="MethodofContact" HeaderText="MethodofContact" 
            SortExpression="MethodofContact" />
        <asp:BoundField DataField="PersonResidenceCode" 
            HeaderText="PersonResidenceCode" SortExpression="PersonResidenceCode" />
        <asp:BoundField DataField="OfficalComments" HeaderText="OfficalComments" 
            SortExpression="OfficalComments" />
        <asp:BoundField DataField="InTakeDate" HeaderText="InTakeDate" 
            SortExpression="InTakeDate" />
        <asp:BoundField DataField="StatusId" HeaderText="StatusId" 
            SortExpression="StatusId" />
        <asp:BoundField DataField="StatusText" HeaderText="StatusText" 
            SortExpression="StatusText" />
        <asp:BoundField DataField="ParticipantId" HeaderText="ParticipantId" 
            SortExpression="ParticipantId" />
        <asp:BoundField DataField="RemovalDate" HeaderText="RemovalDate" 
            SortExpression="RemovalDate" />
    </Columns>
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=SWMPDDEntities" DefaultContainerName="SWMPDDEntities" 
        EnableFlattening="False" EntitySetName="Clients" EntityTypeFilter="Client" 
        Where="">
    </asp:EntityDataSource>
</asp:Content>
