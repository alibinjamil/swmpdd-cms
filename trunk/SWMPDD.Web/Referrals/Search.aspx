<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SWMPDD.Web.Referrals.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Label runat="server" ID="whereClause" Visible="false"></asp:Label>
    <div><b>REFERRALS</b></div> 
    <div><b>FILTER RESULTS BY:</b></div>   
    <div style="width:75%;">
        <div style="float:left;width:40%;">
            Client's Last Name, City, Zip, or Phone:<br/>
            <asp:TextBox ID="tbSearchBy" runat="server" width="260"></asp:TextBox>
        </div>
        <div style="float:left;width:40%;">
            Client Status:<br/>
            <asp:DropDownList ID="ddlStatus" runat="server">            
                <asp:ListItem Value="All" Text="All"></asp:ListItem>
                <asp:ListItem Value="Active" Text="All Active"></asp:ListItem>                
                <asp:ListItem Value="Inactive" Text="All Inactive"></asp:ListItem>                 
                <asp:ListItem Value="1" Text="Code 1 - Entered E&D Waiver"></asp:ListItem>
                <asp:ListItem Value="2" Text="Code 2 - Nursing Facility"></asp:ListItem>
                <asp:ListItem Value="3" Text="Code 3 - Entered Assisted Living Waiver"></asp:ListItem>
                <asp:ListItem Value="4" Text="Code 4 - Entered TBI/SCI Waiver"></asp:ListItem>
                <asp:ListItem Value="5" Text="Code 5 - Entered IL Waiver"></asp:ListItem>
                <asp:ListItem Value="6" Text="Code 6 - DECEASED"></asp:ListItem>
                <asp:ListItem Value="7" Text="Code 7 - Refused Waiver Services"></asp:ListItem>
                <asp:ListItem Value="8" Text="Code 8 - Other (Explain)"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="float:left;width:15%;">
            County:<br/>
            <asp:DropDownList ID="ddlCounty" runat="server">
                <asp:ListItem value="All">All</asp:ListItem>
                <asp:ListItem value="Adams">Adams</asp:ListItem>
                <asp:ListItem value="Amite">Amite</asp:ListItem>
                <asp:ListItem value="Claiborne">Claiborne</asp:ListItem>
                <asp:ListItem value="Franklin">Franklin</asp:ListItem>
                <asp:ListItem value="Jefferson">Jefferson</asp:ListItem>
                <asp:ListItem value="Lawrence">Lawrence</asp:ListItem>
                <asp:ListItem value="Lincoln">Lincoln</asp:ListItem>
                <asp:ListItem value="Pike">Pike</asp:ListItem>
                <asp:ListItem value="Walthall">Walthall</asp:ListItem>
                <asp:ListItem value="Wilkinson">Wilkinson</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="float:left;width:5%;">
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Go" onclick="btnSearch_Click" />
        </div>
        <div style="clear:both"></div>
    </div>
    <div>
        <asp:GridView Runat="server"
	        Id="gvClients"
	        DataSourceID="edsClients"
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
	        PagerStyle-HorizontalAlign="Center" 
            allowsorting="True" 
            borderstyle="Solid" borderwidth="1px" pagesize="15" >
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

                    <asp:TemplateField  sortexpression="LastName" HeaderText="Last Name" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left"  ItemStyle-Wrap="true">
                        <ItemTemplate>
                            <asp:HyperLink id="LastName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "LastName").ToString() %>' ItemStyle-Wrap="true" NavigateUrl= '<%#"~/Referrals/AddReferral.aspx?clientId=" + Eval("ClientId")%>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField sortexpression="FirstName"  DataField="FirstName" ItemStyle-Wrap="true" HeaderText="First Name" />
                    <asp:BoundField sortexpression="InTakeDate"  dataformatstring="{0:MM/dd/yyyy}" HtmlEncode="false" DataField="InTakeDate" ItemStyle-Wrap="true" HeaderText="Date Received" />
                    <asp:BoundField sortexpression="CreationDate"   dataformatstring="{0:MM/dd/yyyy}" HtmlEncode="false"   DataField="CreationDate" ItemStyle-Wrap="true" HeaderText="Record Date" />
                    <asp:BoundField sortexpression="DateOfBirth"   dataformatstring="{0:MM/dd/yyyy}" HtmlEncode="false"   DataField="DateOfBirth" ItemStyle-Wrap="true" HeaderText="Date of Birth" />
                    <asp:BoundField sortexpression="Phone"  DataField="Phone" ItemStyle-Wrap="true" HeaderText="Phone" />
                    <asp:BoundField sortexpression="City"  DataField="City" ItemStyle-Wrap="true" HeaderText="City" />
                    <asp:BoundField sortexpression="Zip"   DataField="Zip" ItemStyle-Wrap="true" HeaderText="Zip" />
                    <asp:BoundField sortexpression="County"  DataField="County" ItemStyle-Wrap="true" HeaderText="County" />
                    <asp:BoundField sortexpression="StatusId"  DataField="StatusId" ItemStyle-Wrap="true" HeaderText="Reason for Removal" />
                    <asp:TemplateField  HeaderText="Print" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left" ItemStyle-Wrap="true" >
                        <ItemTemplate>
                            <asp:HyperLink Target="_blank" id="LastName" runat="server" Text='5-Day Letter' ItemStyle-Wrap="true"  NavigateUrl= '#'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Print" HeaderStyle-ForeColor="black" ItemStyle-HorizontalAlign="left" ItemStyle-Wrap="true" >
                        <ItemTemplate>
                            <asp:HyperLink Target="_blank" id="PrintForm" runat="server" Text='Referral Form' ItemStyle-Wrap="true"  NavigateUrl= '#'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
 
            </Columns>
            <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <asp:EntityDataSource ID="edsClients" runat="server" 
        ConnectionString="name=SWMPDDEntities" DefaultContainerName="SWMPDDEntities" 
        EnableFlattening="False" EntitySetName="Clients" EntityTypeFilter="Client">
    </asp:EntityDataSource>
</asp:Content>
