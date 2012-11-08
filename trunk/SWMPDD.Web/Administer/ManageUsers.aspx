<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="SWMPDD.Web.Administer.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="padding-left:10px;">
        <h3>MANAGE USERS<asp:EntityDataSource ID="edsUsers" runat="server" 
                ConnectionString="name=SWMPDDEntities" DefaultContainerName="SWMPDDEntities" 
                EnableFlattening="False" EntitySetName="Users" EntityTypeFilter="User">
            </asp:EntityDataSource>
        </h3>
        <div>
            <asp:GridView Runat="server"
                Id="gvUsers"
                DataSourceID="edsUsers"
                cellpadding="3" 
                EmptyDataRowStyle-ForeColor ="red"
                EmptyDataRowStyle-HorizontalAlign = "Center"
                EmptyDataText="No record(s) found"
                Headerstyle-BackColor="#7988B7"
                Headerstyle-Forecolor="#FFFFFF"
                Headerstyle-Font-Names="Arial"
                Headerstyle-Font-Size="x-small"
                BackColor="White"
                Font-Names="Arial"
                Font-Size="Small"
                AlternatingRowStyle-BackColor="#EFEFEF"
                AlternatingRowStyle-Font-Names="Arial"
                AlternatingRowStyle-Font-Size="small "
                BorderColor="#E0E0E0"
                AllowPaging = "True"                 
                PagerSettings-Mode = "NextPreviousFirstLast" 
                AutogenerateColumns="False"
                PagerStyle-HorizontalAlign="Center" AllowSorting="True" 
                BorderStyle="Solid" BorderWidth="1px" PageSize="15" >
            
                <FooterStyle   BackColor="White" ForeColor="Silver"></FooterStyle>
                <RowStyle BackColor="White" BorderStyle="Solid" ForeColor="#333333" BorderWidth="1px" BorderColor="Gray" Wrap="False"></RowStyle>
                <PagerStyle BackColor="#E0E0E0" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center"></PagerStyle>
                <HeaderStyle BackColor="#E0E0E0" ForeColor="Black" Font-Size="Small" Font-Names="Arial" Font-Bold="False"></HeaderStyle>
                <AlternatingRowStyle BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small" Font-Names="Arial"></AlternatingRowStyle>
                <pagersettings mode="NumericFirstLast"
                            firstpagetext="First"
                            lastpagetext="Last"
                            pagebuttoncount="5" 
                            NextPageText="Next"  /> 
                <Columns> 
                    <asp:BoundField sortexpression="Name"  DataField="Name" HeaderText="Full Name" />
                    <asp:BoundField sortexpression="Email"  DataField="Email" HeaderText="Email" />
                    <asp:BoundField sortexpression="UserType"  DataField="UserType" HeaderText="Type of User" />
                    <asp:BoundField sortexpression="UserName"  DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField sortexpression="LastLoginTime"  DataFormatString="{0:MM/dd/yyyy}"  DataField="LastLoginTime" HeaderText="Last Login" />
                    <asp:BoundField sortexpression="Active"  HtmlEncode="false"   DataField="Active" HeaderText="Active" />
                    <asp:TemplateField    HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                        <ItemTemplate>
                            <asp:HyperLink id="username" runat="server" Text='Edit/Update' NavigateUrl= "<%#GetEditURL(Container.DataItem)%>"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField    HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                        <ItemTemplate>
                            <asp:HyperLink id="userpassword" runat="server" Text='Change Password' NavigateUrl= "<%#GetPasswordChangeURL(Container.DataItem)%>"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
