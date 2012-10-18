<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SWMPDD.Web.Referrals.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div style="width:100%;text-align:center">
    <asp:GridView Runat="server"
	Id="gvDashboard"
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
	Font-Size="small"
	AlternatingRowStyle-BackColor="#EFEFEF"
	AlternatingRowStyle-Font-Names="Arial"
	AlternatingRowStyle-Font-Size="small "
	BorderColor="#E0E0E0"
	AllowPaging = "false"
    AllowSorting = "false"
    PagerSettings-Mode = "NextPreviousFirstLast" 
	AutogenerateColumns="false"
	PagerStyle-HorizontalAlign="Center" borderstyle="Solid" borderwidth="1px" pagesize="15"  >
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

 <asp:TemplateField   HeaderText="County"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="county" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "County")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"All")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 
<asp:TemplateField   HeaderText="Code 1"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code1_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code1")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"1")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 2"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code2_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code2")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"2")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 3"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code3_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code3")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"3")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 4"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code4_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code4")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"4")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 5"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code5_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code5")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"5")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 6"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code6_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code6")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"6")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 7"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code7_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code7")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"7")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="Code 8"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Code8_counter" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Code8")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"8")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

<asp:TemplateField   HeaderText="All Active"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="allactive" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Active")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"Active")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 

 <asp:TemplateField   HeaderText="All Inactive"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="InActive" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Inactive")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"Inactive")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 
 
 <asp:TemplateField   HeaderText="Total"   HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left">
                   <ItemTemplate>
                       <asp:HyperLink id="Total" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Total")%>' NavigateUrl= '<%#GetSearchURL(Eval("County"),"All")%>'></asp:HyperLink>
                   </ItemTemplate>
  </asp:TemplateField> 
 
 

  
  </Columns>
             <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
        
    
    </asp:GridView>
</div>
</asp:Content>
