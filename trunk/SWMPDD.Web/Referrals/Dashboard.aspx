<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="SWMPDD.Web.Referrals.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="width: 100%; text-align: center">
        <asp:GridView runat="server" ID="gvDashboard" CellPadding="3" EmptyDataRowStyle-ForeColor="red"
            EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataText="No record(s) found"
            HeaderStyle-BackColor="#7988B7" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Font-Names="Arial"
            HeaderStyle-Font-Size="x-small" BackColor="White" Font-Names="Arial" Font-Size="small"
            AlternatingRowStyle-BackColor="#EFEFEF" AlternatingRowStyle-Font-Names="Arial"
            AlternatingRowStyle-Font-Size="small " BorderColor="#E0E0E0" AllowPaging="false"
            AllowSorting="false" PagerSettings-Mode="NextPreviousFirstLast" AutoGenerateColumns="false"
            PagerStyle-HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1px" PageSize="15" CssClass="mainGrid">
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
                <asp:TemplateField HeaderText="County" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="county" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "County")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"All")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 1" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code1_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code1")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"1")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 2" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code2_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code2")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"2")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 3" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code3_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code3")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"3")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 4" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code4_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code4")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"4")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 5" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code5_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code5")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"5")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 6" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code6_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code6")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"6")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 7" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code7_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code7")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"7")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code 8" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Code8_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code8")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"8")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="All Active" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="allactive" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Active")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"Active")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="All Inactive" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="InActive" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Inactive")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"Inactive")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:HyperLink ID="Total" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Total")%>'
                            NavigateUrl='<%#GetSearchURL(Eval("County"),"All")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    
</asp:Content>
