<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" CodeBehind="AddService.aspx.cs" Inherits="SWMPDD.Web.Administer.AddService" %>
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
        <h3>ADD/EDIT Service</h3>
        <div class="row">
            <div class="col1">Name of Service:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbServiceNAme"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbServiceNAme" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Name of Service is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Waivered (W) or Non-Waivered (NW):</div>
            <div class="col2">
                <asp:DropDownList ID="ddlWaiveORNW" runat="server">
                    <asp:ListItem Value="-1" Text="Please select"></asp:ListItem>
                    <asp:ListItem Value="True" Text="Waivered"></asp:ListItem>
                    <asp:ListItem Value="False"  Text="Non-Waivered"></asp:ListItem> 
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlWaiveORNW"  InitialValue="-1" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Waivered (W) or Non-Waivered (NW) is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">HCPCS/REV Code:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbCode"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tbCode"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>HCPCS/REV Code is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Type (HCPCS or REV):</div>
            <div class="col2">
                <asp:DropDownList ID="tbType" runat="server">
                    <asp:ListItem Value="-1" Text="Please select"></asp:ListItem>
                    <asp:ListItem Value="True" Text="HCPCS"></asp:ListItem>
                    <asp:ListItem Value="False"  Text="REV"></asp:ListItem> 
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbType"  InitialValue="-1" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Type (HCPCS or REV) is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">Description:</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbDescription" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbDescription"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Description is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row">
            <div class="col1">How are service units counted? (Days, Hours, Quantity, etc):</div>
            <div class="col2"><asp:TextBox runat="server" ID="tbCount"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbCount"  runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Service units counted is Required</span></asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ddlActive"  InitialValue="-1" runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Service State is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div class="row" style="margin-left:50px;">
            <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
        </div>
    </div>
</asp:Content>
