<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true" CodeBehind="AddReferral.aspx.cs" Inherits="SWMPDD.Web.Referrals.AddReferral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .col1{ float:left;width:30%;}
        .col2{ float:left;width:50%;}
        .col3{ float:left;width:20%;}
    </style>
    <script type="text/javascript">
        $(function () {
            $('#IntakeDate').datepicker();
            $('#DateOfBirth').datepicker();
            $('#VerificationDate').datepicker();
            $('#DateClientContacted').datepicker();
            $('#RemovalDate').datepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <div>
            <div class="col1">Social Security Number:</div>
            <div class="col2"><asp:TextBox runat="server" ID="SSN" AutoPostBack="True" 
                    ontextchanged="SSN_TextChanged"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="rfvSSN" ControlToValidate="SSN" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>SSN is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Intake Date:</div>
            <div class="col2"><asp:TextBox runat="server" ID="IntakeDate" ClientIDMode="Static"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="rfvIntakeDate" ControlToValidate="IntakeDate" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Intake Date is Required</span></asp:RequiredFieldValidator>                
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">First Name:</div>
            <div class="col2"><asp:TextBox runat="server" ID="FirstName"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvFirstName" ControlToValidate="FirstName" runat="server"  SetFocusOnError="true"><span>First Name is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="revFirstName" runat="server" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="FirstName" CssClass="errorValidator" SetFocusOnError="true"><span>Alphabetics only</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Middle Initial</div>
            <div class="col2"><asp:TextBox runat="server" ID="MiddleInitial" MaxLength="1"></asp:TextBox></div>
            <div class="col3">
                <asp:RegularExpressionValidator Display="Dynamic" ID="revMiddleInitial" runat="server" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="FirstName" CssClass="errorValidator" SetFocusOnError="true"><span>Alphabetics only</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Last Name:</div>
            <div class="col2"><asp:TextBox runat="server" ID="LastName"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvLastName" ControlToValidate="LastName" runat="server"  SetFocusOnError="true"><span>Last Name is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="revLastName" runat="server" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="LastName" CssClass="errorValidator" SetFocusOnError="true"><span>Alphabetics only</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Date of Birth:</div>
            <div class="col2"><asp:TextBox runat="server" ID="DateOfBirth" ClientIDMode="Static"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvDateOfBirth" ControlToValidate="DateOfBirth" runat="server"  SetFocusOnError="true"><span>Date of Birth is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Address Line 1:</div>
            <div class="col2"><asp:TextBox runat="server" ID="AddressLine1"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvAddressLine1" ControlToValidate="AddressLine1" runat="server"  SetFocusOnError="true"><span>Address is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Address Line 2:</div>
            <div class="col2"><asp:TextBox runat="server" ID="AddressLine2"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">City:</div>
            <div class="col2"><asp:TextBox runat="server" ID="City"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvCity" ControlToValidate="City" runat="server"  SetFocusOnError="true"><span>City is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">State:</div>
            <div class="col2">MS</div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Zip:</div>
            <div class="col2"><asp:TextBox runat="server" ID="Zip"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>        
        <div>
            <div class="col1">Phone:</div>
            <div class="col2"><asp:TextBox runat="server" ID="Phone"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvPhone" ControlToValidate="Phone" runat="server"  SetFocusOnError="true"><span>Phone is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="revPhone" runat="server" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ControlToValidate="Phone" CssClass="errorValidator" SetFocusOnError="true"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">County:</div>
            <div class="col2">                
                <asp:DropDownList ID="County" runat="server">
                    <asp:ListItem value="None">Please select</asp:ListItem>
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
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvCounty" InitialValue="None" ControlToValidate="County" runat="server"  SetFocusOnError="true"><span>County is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Email Address:</div>
            <div class="col2"><asp:TextBox runat="server" ID="Email"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Gender:</div>
            <div class="col2">
                <asp:RadioButtonList ID="Gender" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Male"></asp:ListItem>
                    <asp:ListItem Text="Female"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvGender" ControlToValidate="Gender" runat="server"  SetFocusOnError="true"><span>Gender is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Person's Residence Code:</div>
            <div class="col2">
                <asp:DropDownList AutoPostBack="true" ID="ResidenceCode" 
                    RepeatDirection="Horizontal" runat="server" 
                    onselectedindexchanged="ResidenceCode_SelectedIndexChanged">
                    <asp:ListItem Text="Please select"></asp:ListItem> 
                    <asp:ListItem Text="Home"></asp:ListItem>
                    <asp:ListItem Text="Nursing Facility"></asp:ListItem>
                    <asp:ListItem Text="Group Facility"></asp:ListItem>
                    <asp:ListItem Text="Assisted Living Facility"></asp:ListItem>
                    <asp:ListItem Text="Other"></asp:ListItem>                
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvResidenceCode" InitialValue="Please select" ControlToValidate="ResidenceCode" runat="server"  SetFocusOnError="true"><span>Person's Residence Code is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">If "Other", describe:</div>
            <div class="col2"><asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="OtherInfo" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator Enabled="false" CssClass="errorValidator" Display="Dynamic" ID="rfvOtherInfo" ControlToValidate="OtherInfo" runat="server"  SetFocusOnError="true"><span>Other Residence Code is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Medicaid #:</div>
            <div class="col2"><asp:TextBox  ID="Medicaid" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Medicare #:</div>
            <div class="col2"><asp:TextBox  ID="Medicare" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Contact Person:</div>
            <div class="col2"><asp:TextBox  ID="ContactPerson" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvContactPerson" ControlToValidate="ContactPerson" runat="server"  SetFocusOnError="true"><span>Contact Person is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Relationship to Client:</div>
            <div class="col2"><asp:TextBox  ID="RelationshiptoClient" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvRelationshiptoClient" ControlToValidate="RelationshiptoClient" runat="server"  SetFocusOnError="true"><span>Relationship to Client is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Contact Phone #:</div>
            <div class="col2"><asp:TextBox  ID="ContactPhone" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvContactPhone" ControlToValidate="ContactPhone" runat="server"  SetFocusOnError="true"><span>Contact Phone is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Directions to Client's Home:</div>
            <div class="col2"><asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="Directions" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Referral Source:</div>
            <div class="col2"><asp:TextBox  ID="ReferralSource" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvReferralSource" ControlToValidate="ReferralSource" runat="server"  SetFocusOnError="true"><span>Referral Source is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Referral Phone #:</div>
            <div class="col2"><asp:TextBox  ID="ReferralPhone" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvReferralPhone" ControlToValidate="ReferralPhone" runat="server"  SetFocusOnError="true"><span>Referral Phone is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="revReferralPhone" runat="server" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ControlToValidate="ReferralPhone" CssClass="errorValidator" SetFocusOnError="true"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Physician:</div>
            <div class="col2"><asp:TextBox  ID="Physician" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvPhysician" ControlToValidate="ReferralPhone" runat="server"  SetFocusOnError="true"><span>Physician is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Physician Phone #:</div>
            <div class="col2"><asp:TextBox  ID="PhysicianPhone" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RegularExpressionValidator Display="Dynamic" ID="revPhysicianPhone" runat="server" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ControlToValidate="PhysicianPhone" CssClass="errorValidator" SetFocusOnError="true"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Physician Address:</div>
            <div class="col2"><asp:TextBox  ID="PhysicianAddress" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Physician City:</div>
            <div class="col2"><asp:TextBox  ID="PhysicianCity" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Physician Zip:</div>
            <div class="col2"><asp:TextBox  ID="PhysicianZip" runat="server"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Diagnosis:</div>
            <div class="col2"><asp:TextBox  ID="Diagnosis" Columns="60" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvDiagnosis" ControlToValidate="Diagnosis" runat="server"  SetFocusOnError="true"><span>Diagnosis is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Service(s) Needed:</div>
            <div class="col2">
                <asp:CheckBoxList ID="ServicesNeeded" RepeatDirection="Horizontal" RepeatColumns="3" runat="server">                
                    <asp:ListItem value="Homemaker">Homemaker</asp:ListItem>
                    <asp:ListItem value="Home Delivered Meals">Home Delivered Meals</asp:ListItem>
                    <asp:ListItem value="In Home Respite">In Home Respite</asp:ListItem>
                    <asp:ListItem value="Escorted Transportation">Escorted Transportation</asp:ListItem>
                    <asp:ListItem value="Adult Day Care">Adult Day Care</asp:ListItem>
                    <asp:ListItem value="Home Health">Home Health</asp:ListItem>
                    <asp:ListItem value="Institution Respite">Institution Respite</asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <asp:Panel ID="pnlCurrentServices" runat="server">
            <div class="col1">Current Services/Providers in Progress:</div>
            <div class="col2">
                <table>           
                    <tr>
                        <th>Discipline</th>
                        <th>Frequency</th>
                        <th>Provider</th>   
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Descipline1" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Frequency1" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Provider1" runat="server"></asp:TextBox></td>   
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Descipline2" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Frequency2" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Provider2" runat="server"></asp:TextBox></td>   
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Descipline3" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Frequency3" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Provider3" runat="server"></asp:TextBox></td>   
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Descipline4" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Frequency4" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Provider4" runat="server"></asp:TextBox></td>   
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="Descipline5" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Frequency5" runat="server"></asp:TextBox></td>
                        <td><asp:TextBox ID="Provider5" runat="server"></asp:TextBox></td>   
                    </tr>
                </table>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </asp:Panel>
        <div>
            <div class="col1">Additional Pertinent Information/Need(s):</div>
            <div class="col2">
                <asp:GridView Runat="server"
	                id="gvAdditionalPertinentInfo"	
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
	                AllowPaging = "True"	 Width="475px"
                    PagerSettings-Mode = "NextPreviousFirstLast" 
	                AutogenerateColumns="False"
	                PagerStyle-HorizontalAlign="Center" allowsorting="True" borderstyle="Solid" borderwidth="1px" pagesize="3"  >
                    <FooterStyle   BackColor="White" ForeColor="Silver"></FooterStyle>
                    <RowStyle BackColor="White" BorderStyle="Solid" ForeColor="#333333" BorderWidth="1px" BorderColor="Gray" Wrap="True"></RowStyle>
                    <PagerStyle BackColor="#E0E0E0" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center"></PagerStyle>
                    <HeaderStyle BackColor="#E0E0E0" ForeColor="Black" Font-Size="Small" Font-Names="Arial" Font-Bold="False"></HeaderStyle>
                    <AlternatingRowStyle BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small" Font-Names="Arial"></AlternatingRowStyle>
                    <pagersettings mode="NumericFirstLast"
                                firstpagetext="First"
                                lastpagetext="Last"
                                pagebuttoncount="5" 
                                NextPageText="Next"/> 
           
                    <Columns>
                        <asp:BoundField HeaderText="Pertinent Information" DataField="Text"/>
                        <asp:BoundField HeaderText="Added On" DataField="CreationDate"/>
                        <asp:BoundField HeaderText="Added By" DataField="CreationUser"/>
                    </Columns>
                    <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <asp:Panel runat="server" ID="pnlAddAdditionalInfo" Visible="false">
            <div class="col1">Add Additional Pertinent Information/Need:</div>
            <div class="col2">
                <asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="AdditionalPertinent" runat="server" ValidationGroup="AddPertinent"></asp:TextBox>
                <br />
                <asp:Button runat="server" ID="btnPertinentInfo" 
                    Text="Save Additional Pertinent Information/Need" 
                    onclick="btnPertinentInfo_Click" ValidationGroup="AddPertinent" />
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </asp:Panel>
        <div>
            <div class="col1"><b>FOR OFFICE USE ONLY:</b></div>
            <div class="col2"></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Verification of Medicaid Status:</div>
            <div class="col2">
                <asp:DropDownList ID="MedicaidStatus" AutoPostBack="true"  
                    RepeatDirection="Horizontal" runat="server" 
                    onselectedindexchanged="MedicaidStatus_SelectedIndexChanged">
                    <asp:ListItem Text="Please select"></asp:ListItem> 
                    <asp:ListItem Text="Yes"></asp:ListItem>
                    <asp:ListItem Text="No"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvMedicaidStatus" ControlToValidate="MedicaidStatus" InitialValue="Please select" runat="server"  SetFocusOnError="true"><span>Medicaid status is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Verification Date:</div>
            <div class="col2"><asp:TextBox runat="server" ID="VerificationDate" ClientIDMode="Static"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator Enabled="false" CssClass="errorValidator" Display="Dynamic" ID="rfvVerificationDate" ControlToValidate="VerificationDate" InitialValue="Please select" runat="server"  SetFocusOnError="true"><span>Verification Date is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Lock-in Status:</div>
            <div class="col2">
                <asp:DropDownList ID="LockInStatus" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Please select"></asp:ListItem> 
                    <asp:ListItem Text="Yes"></asp:ListItem>
                    <asp:ListItem Text="No"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvLockInStatus" ControlToValidate="LockInStatus" InitialValue="Please select" runat="server"  SetFocusOnError="true"><span>Lockin status is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Method of Contact:</div>
            <div class="col2">
                <asp:DropDownList ID="MethodofContact" RepeatDirection="Horizontal" runat="server">
                  <asp:ListItem Text="Please select"></asp:ListItem> 
                    <asp:ListItem Text="By Letter"></asp:ListItem>
                    <asp:ListItem Text="By Telephone with Client"></asp:ListItem>
                    <asp:ListItem Text="By Telephone with Caregiver"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvMethodofContact" ControlToValidate="MethodofContact" InitialValue="Please select" runat="server"  SetFocusOnError="true"><span>Method of contact is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>

        <div>
            <div class="col1">Date Client Contacted:</div>
            <div class="col2"><asp:TextBox runat="server" ID="DateClientContacted" ClientIDMode="Static"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvDateClientContacted" ControlToValidate="DateClientContacted" runat="server"  SetFocusOnError="true"><span>Date Client was contacted is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">By Whom:</div>
            <div class="col2"><asp:Label ID="ByWhom" runat="server" Text=""></asp:Label></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Reason for Removal Code:</div>
            <div class="col2">
                <asp:DropDownList  AutoPostBack="true" ID="ReasonforRemovalCode" 
                    RepeatDirection="Horizontal" runat="server" 
                    onselectedindexchanged="ReasonforRemovalCode_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="Please select"></asp:ListItem> 
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
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvReasonforRemovalCode" ControlToValidate="ReasonforRemovalCode" InitialValue="0" runat="server"  SetFocusOnError="true"><span>Reason for Removal Code is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">If "Code 8 - Other", explain:</div>
            <div class="col2"><asp:TextBox Enabled="false" ID="Code8Other" Columns="50" MaxLength="200" runat="server"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Enabled="false" Display="Dynamic" ID="rfvCode8Other" ControlToValidate="Code8Other"  runat="server"  SetFocusOnError="true"><span>Explaination is needed</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Removal Date:</div>
            <div class="col2"><asp:TextBox runat="server" ID="RemovalDate" ClientIDMode="Static"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Enabled="false" Display="Dynamic" ID="rfvRemovalDate" ControlToValidate="RemovalDate"  runat="server"  SetFocusOnError="true"><span>Removal Date is required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Official Comment(s):</div>
            <div class="col2">
                <asp:GridView Runat="server"
	                id="gvComments"	
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
	                AllowPaging = "True"	 Width="475px"
                    PagerSettings-Mode = "NextPreviousFirstLast" 
	                AutogenerateColumns="False"
	                PagerStyle-HorizontalAlign="Center" allowsorting="True" borderstyle="Solid" borderwidth="1px" pagesize="3"  >
                    <FooterStyle   BackColor="White" ForeColor="Silver"></FooterStyle>
                    <RowStyle BackColor="White" BorderStyle="Solid" ForeColor="#333333" BorderWidth="1px" BorderColor="Gray" Wrap="True"></RowStyle>
                    <PagerStyle BackColor="#E0E0E0" ForeColor="Black" Font-Bold="True" HorizontalAlign="Center"></PagerStyle>
                    <HeaderStyle BackColor="#E0E0E0" ForeColor="Black" Font-Size="Small" Font-Names="Arial" Font-Bold="False"></HeaderStyle>
                    <AlternatingRowStyle BackColor="Silver" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small" Font-Names="Arial"></AlternatingRowStyle>
                    <pagersettings mode="NumericFirstLast"
                                firstpagetext="First"
                                lastpagetext="Last"
                                pagebuttoncount="5" 
                                NextPageText="Next"/> 
           
                    <Columns>
                        <asp:BoundField HeaderText="Pertinent Information" DataField="Text"/>
                        <asp:BoundField HeaderText="Added On" DataField="CreationDate"/>
                        <asp:BoundField HeaderText="Added By" DataField="CreationUser"/>
                    </Columns>
                    <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                </asp:GridView>                            
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <asp:Panel runat="server" ID="pnlAddComment" Visible="false">
            <div class="col1">Add Comment:</div>
            <div class="col2">
                <asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="OfficalComments" runat="server" ValidationGroup="Comment"></asp:TextBox><br />
                <asp:Button runat="server" ID="btnAddComment" Text="Save Comment" 
                    onclick="btnAddComment_Click"  ValidationGroup="Comment" />
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </asp:Panel>
        <div style="text-align:center;">
            <asp:Button runat="server" ID="btnSave" onclick="btnSave_Click" Text="Save Referral"/>
        </div>
    </div>
</asp:Content>
