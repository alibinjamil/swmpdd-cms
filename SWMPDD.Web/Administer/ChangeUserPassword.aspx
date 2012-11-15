<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" CodeBehind="ChangeUserPassword.aspx.cs" Inherits="SWMPDD.Web.Administer.ChangeUserPassword" %>
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
            <h3>ADD/EDIT USER</h3>
        </div>
        
        <div class="row">
            <div class="col1">User Name:</div>
            <div class="col2"><asp:Label runat="server" ID="lblUserId"></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Full Name:</div>
            <div class="col2"><asp:Label runat="server" ID="lblFullName"></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Email:</div>
            <div class="col2"><asp:Label runat="server" ID="lblEmail"></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">User Type:</div>
            <div class="col2"><asp:Label runat="server" ID="lblUserType"></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Position:</div>
            <div class="col2"><asp:Label runat="server" ID="lblPosition"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Office Address:</div>
            <div class="col2"><asp:Label runat="server" ID="lblOfficeAddress"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">City:</div>
            <div class="col2"><asp:Label runat="server" ID="lblCity"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">State:</div>
            <div class="col2"><asp:Label runat="server" ID="Label1" Text="MS"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">ZIP Code:</div>
            <div class="col2"><asp:Label runat="server" ID="lblZipCode"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Telephone:</div>
            <div class="col2"><asp:Label runat="server" ID="lblTelephone"></asp:Label>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Active:</div>
            <div class="col2"><asp:Label runat="server" ID="lblActive"></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">New Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Confirm New Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tbConfirmPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Confirm Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row" style="margin-left:50px;">
            <asp:Button ID="btnChangePassword" runat="server" onclick="btnChangePassword_Click" Text="Change Password" />
        </div>
    </div>
</asp:Content>
