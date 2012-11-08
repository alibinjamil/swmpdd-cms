<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="SWMPDD.Web.Administer.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .row {padding: 5px;}
        .col1{ float:left;width:20%;}
        .col2{ float:left;width:30%;}
        .col3{ float:left;width:50%;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="padding-left:10px;">
        <h3>ADD/EDIT USER</h3>
        <div class="row">
            <div class="col1">User ID:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbUserId"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="rfvSSN" ControlToValidate="tbUserId" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>User ID is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <asp:Panel runat="server" ID="pnlPassword">
        <div class="row">
            <div class="col1">Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Confirm Password:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tbConfirmPassword" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Confirm Password is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        </asp:Panel>
        <div class="row">
            <div class="col1">Full Name:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbFullNAme"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbFullNAme" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Name is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Email:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbEmail"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbEmail" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Email is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator3" 
                    ControlToValidate="tbEmail" runat="server" CssClass="errorValidator" 
                    SetFocusOnError="true" Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><span>Invalid Email Address</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">User Type:</div>
            <div class="col2">
                <asp:DropDownList ID="ddlUserType" runat="server">
                    <asp:ListItem Value="0" Text="Please select"></asp:ListItem>
                    <asp:ListItem Value="admin" Text="Admin"></asp:ListItem>
                    <asp:ListItem Value="reg"  Text="Staff"></asp:ListItem>
                    <asp:ListItem Value="view"  Text="View only"></asp:ListItem>
                    <asp:ListItem Value="LSW"  Text="Licensed Social Worker"></asp:ListItem>
                    <asp:ListItem Value="RN"  Text="Registered Nurse"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlUserType"  InitialValue="0" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>User Type is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Position:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbPosition"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbPosition"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>User Position is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Office Address:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbOfficeAddress"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbOfficeAddress"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Office Address is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">City:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbCity"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbCity"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>City is Required</span></asp:RequiredFieldValidator>
            </div>
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
            <div class="col2"><asp:TextBox runat="server" ID="tbZipCode"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbZipCode" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>ZIP Code is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    ControlToValidate="tbZipCode" runat="server" CssClass="errorValidator" 
                    SetFocusOnError="true" Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><span>Invalid ZIP Code</span></asp:RegularExpressionValidator>            
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Telephone:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbTelephone"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbTelephone" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Phone is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                    ControlToValidate="tbTelephone" runat="server" CssClass="errorValidator" 
                    SetFocusOnError="true" Display="Dynamic" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>            
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Active:</div>
            <div class="col2">
                <asp:DropDownList ID="ddlActive" runat="server">
                    <asp:ListItem Value="-1" Text="Please select"></asp:ListItem>
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
                    <asp:ListItem Value="False"  Text="No"></asp:ListItem>                
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddlActive"  InitialValue="-1" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>User State is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row" style="margin-left:50px;">
            <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
        </div>
    </div>
</asp:Content>
