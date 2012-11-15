<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SWMPDD.Web.Administer.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .row {padding: 5px;}
        .col1{ float:left;width:20%;}
        .col2{ float:left;width:30%;}
        .col3{ float:left;width:50%;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="mainContentArea" style="padding-left:10px;">
        <div class="heading">
            <h3>CHANGE PASSWORD</h3>
        </div>
        
        <div class="row">
            <div class="col1">Existing Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbExistingPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbExistingPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Existing Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">New Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>New Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Confirm New Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tbConfirmPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Confirm New Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row" style="margin-left:50px;">
            <asp:Button ID="btnChangePassword" runat="server" onclick="btnChangePassword_Click" Text="Change Password" />
        </div>
    </div>
</asp:Content>
