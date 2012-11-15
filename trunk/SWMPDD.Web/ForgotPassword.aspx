<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SWMPDD.Web.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .row {padding: 5px;}
        .col1{ float:left;width:10%;}
        .col2{ float:left;width:90%;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="padding-left:10px;">
        <div class="row">
            <div class="col1"></div>
            <div class="col2"><h3>RETRIEVE PASSWORD</h3></div>
            <div style="clear:both"></div>
        </div>        
        <div class="row">
            <div class="col1"></div>
            <div class="col2"><img src="img/greater_than.gif" width="15" height="15" />&nbsp;&nbsp;Your password will be sent to your email address on record after you enter your user name and click "Retrieve Password" below.</div>
            <div style="clear:both"></div>
        </div>        
        <div class="row">
            <div class="col1">Username: </div>
            <div class="col2"><asp:TextBox ID="tbUserName" runat="server"></asp:TextBox> </div>
            <div style="clear:both"></div>
        </div>        
        <div class="row">
            <div class="col1"></div>
            <div class="col2"><asp:Button runat="server" Text="Retrieve Password" 
                    ID="btnProceed" onclick="btnProceed_Click" /> </div>
            <div style="clear:both"></div>
        </div>
    </div>
</asp:Content>
