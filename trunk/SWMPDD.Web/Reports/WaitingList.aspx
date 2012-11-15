<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Reports.master" AutoEventWireup="true" CodeBehind="WaitingList.aspx.cs" Inherits="SWMPDD.Web.Reports.WaitingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style>
        .waitingGrid th
        {
            font-size: small; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="mainContentArea" style="padding-left:10px;">
        <div class="heading">
            <h3>REPORTS</h3>
        </div>
            
        <div style="padding:10px;">
            <span>Select County: </span>          
            <asp:DropDownList ID="ddlCounties" runat="server">          
                <asp:ListItem value="Adams" Text="Adams"></asp:ListItem>
                <asp:ListItem value="Amite" Text="Amite"></asp:ListItem>
                <asp:ListItem value="Claiborne" Text="Claiborne"></asp:ListItem>
                <asp:ListItem value="Franklin" Text="Franklin"></asp:ListItem>
                <asp:ListItem value="Jefferson" Text="Jefferson"></asp:ListItem>
                <asp:ListItem value="Lawrence" Text="Lawrence"></asp:ListItem>
                <asp:ListItem value="Lincoln" Text="Lincoln"></asp:ListItem>
                <asp:ListItem value="Pike" Text="Pike"></asp:ListItem>
                <asp:ListItem value="Walthall" Text="Walthall"></asp:ListItem>
                <asp:ListItem value="Wilkinson" Text="Wilkinson"></asp:ListItem>
                <asp:ListItem value="ACTIVE" Text="All Counties - Active"></asp:ListItem>
                <asp:ListItem value="INACTIVE" Text="All Counties - Inactive"></asp:ListItem>        
            </asp:DropDownList> 
            <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
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
	            AutogenerateColumns="False"
	            PagerStyle-HorizontalAlign="Center" Allowsorting="True" borderstyle="Solid" 
                borderwidth="1px" pagesize="15"  AllowPaging="False" CssClass="waitingGrid">
            
                <FooterStyle   BackColor="White" ForeColor="Silver"></FooterStyle>

<PagerStyle HorizontalAlign="Center"></PagerStyle>

                <RowStyle BackColor="White" BorderStyle="Solid" ForeColor="#333333" BorderWidth="1px" BorderColor="Gray" Wrap="False"></RowStyle>
                <HeaderStyle BackColor="#E0E0E0" ForeColor="Black" Font-Size="Small" Font-Names="Arial" Font-Bold="False"></HeaderStyle>
                <AlternatingRowStyle BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small" Font-Names="Arial"></AlternatingRowStyle>        

                <Columns> 
                    <asp:TemplateField HeaderText="Number on Waiting list by County/Site">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# GetWaitingListNumber(Container.DataItem) %>'></asp:Label>
                        </ItemTemplate>                        
                    </asp:TemplateField>
                    <asp:BoundField DataFormatString="{0:MM/dd/yyyy}"   DataField="IntakeDate" HeaderText="Date Referral Received" />
                    <asp:BoundField   DataField="FirstName" HeaderText="Name of Person" />
  
                    <asp:BoundField   DataField="County" HeaderText="County of Residence" />
  
  
                    <asp:BoundField   DataField="PersonResidenceCode" HeaderText="Person's Residence (i.e., Nursing Facility, Home, etc.)" />
                    <asp:BoundField   DataFormatString="{0:MM/dd/yyyy}" DataField="RemovalDate" HeaderText="Date Removed from Waiting List" />
                    <asp:BoundField   DataField="StatusText" HeaderText="Removal Reason" />  
                </Columns>
                <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
    <asp:EntityDataSource ID="edsClients" runat="server" 
        ConnectionString="name=SWMPDDEntities" DefaultContainerName="SWMPDDEntities" 
        EnableFlattening="False" EntitySetName="Clients" EntityTypeFilter="" 
        OrderBy="it.IntakeDate" Select="">
    </asp:EntityDataSource>
</asp:Content>
