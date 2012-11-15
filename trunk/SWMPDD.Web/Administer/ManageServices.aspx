<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true"
    CodeBehind="ManageServices.aspx.cs" Inherits="SWMPDD.Web.Administer.ManageServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
     <div id="mainContentArea" style="padding-left:10px;">
        <div class="heading">
            <h3>MANAGE SERVICES</h3>
        </div>

            <asp:EntityDataSource ID="edsServices" runat="server" ConnectionString="name=SWMPDDEntities"
                DefaultContainerName="SWMPDDEntities" EnableFlattening="False" EntitySetName="Services"
                EntityTypeFilter="Service">
            </asp:EntityDataSource>

        <div>
            <asp:GridView runat="server" ID="gvServices" DataSourceID="edsServices" CellPadding="3"
                EmptyDataRowStyle-ForeColor="red" EmptyDataRowStyle-HorizontalAlign="Center"
                EmptyDataText="No record(s) found" HeaderStyle-BackColor="#7988B7" HeaderStyle-ForeColor="#FFFFFF"
                HeaderStyle-Font-Names="Arial" HeaderStyle-Font-Size="x-small" BackColor="White"
                Font-Names="Arial" Font-Size="Small" AlternatingRowStyle-BackColor="#EFEFEF"
                AlternatingRowStyle-Font-Names="Arial" AlternatingRowStyle-Font-Size="small "
                BorderColor="#E0E0E0" AllowPaging="True" PagerSettings-Mode="NextPreviousFirstLast"
                AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Center" AllowSorting="True"
                BorderStyle="Solid" BorderWidth="1px" PageSize="15">
                <FooterStyle BackColor="White" ForeColor="Silver"></FooterStyle>
                <RowStyle BackColor="White" BorderStyle="Solid" ForeColor="#333333" BorderWidth="1px"
                    BorderColor="Gray" Wrap="False"></RowStyle>
                <PagerStyle BackColor="#E0E0E0" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center">
                </PagerStyle>
                <HeaderStyle BackColor="#E0E0E0" ForeColor="Black" Font-Size="Small" Font-Names="Arial"
                    Font-Bold="False"></HeaderStyle>
                <AlternatingRowStyle BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small"
                    Font-Names="Arial"></AlternatingRowStyle>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last"
                    PageButtonCount="5" NextPageText="Next" />
                <Columns>
                    <asp:BoundField SortExpression="Name" DataField="Name" HeaderText="Name of Service" />
                    <asp:TemplateField HeaderText="Waivered (W) or Non-Waivered (NW)" SortExpression="WaiverOrNW">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("WaiverOrNW").ToString()=="True"?"Waivered (W)":"Non-Waivered (NW)" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField SortExpression="Type" DataField="Code" HeaderText="HCPCS/REV Code" />
                    <asp:TemplateField HeaderText="Type (HCPCS or REV)" SortExpression="Type">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Type").ToString()=="True"?"HCPCS":"REV" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField SortExpression="Description" DataField="Description" HeaderText="Description" />
                    <asp:BoundField SortExpression="ServiceUCount" DataField="ServiceUCount" HeaderText="How are service units counted? (Days, Hours, Quantity, etc)" />
                    <asp:BoundField SortExpression="Active" HtmlEncode="false" DataField="Active" HeaderText="Active" />
                    <asp:TemplateField HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                        <ItemTemplate>
                            <asp:HyperLink ID="serviceId" runat="server" Text='Edit/Update' NavigateUrl="<%#GetEditURL(Container.DataItem)%>"></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle ForeColor="Black"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
