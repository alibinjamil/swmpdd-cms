<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Referrals.master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddReferral.aspx.cs" Inherits="SWMPDD.Web.Referrals.AddReferral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .col1{float: left;width: 200px;padding:4px;}
        .col2{float: left;width: 45%;padding:4px;}
        .col3{float: left;width: 25%;}
        .smallField{width:117px; }
        .verySmallField{width:39px;}
        .smallDropField{min-width:117px;}
        .verySmallDropField{min-width:50px;}
        .largeField{width:333px;}
        .veryLargeField{width:393px;}
        .textareaField{width:263px;}
        textarea{font-family: monospace;font-size:12px;}
    </style>
    <script type="text/javascript">
        var leftArray = new Array();
        var rightArray = new Array();
        $(function () {
            $('#IntakeDate').datepicker();
            $('#DateOfBirth').datepicker();
            $('#VerificationDate').datepicker();
            $('#DateClientContacted').datepicker();
            $('#RemovalDate').datepicker();
            checkItem();
            checkMove();
        });
        function addPertinent() {
            $("#pertinentDiv").show();
        }
        function addComment() {
            $("#commentDiv").show();
        }
        function checkItem() {
            var jsonObject = $.parseJSON($("#<%=ServicesNeededLeftHidden.ClientID%>").val());
            if (jsonObject != null && jsonObject != "") {
                leftArray = jsonObject;
                $.each(leftArray, function (index, item) {
                    if ($("#<%=ServicesNeededLeft.ClientID%> option[value='" + item.value + "']").length <= 0) {
                        $("#<%=ServicesNeededLeft.ClientID%>").append("<option value=" + item.value + ">" + item.text + "</option>");
                    }
                });
            }
            var jsonObject = $.parseJSON($("#<%=ServicesNeededRightHidden.ClientID%>").val());
            if (jsonObject != null && jsonObject != "") {
                rightArray = jsonObject;
                $.each(rightArray, function (index, item) {
                    if ($("#<%=ServicesNeededRight.ClientID%> option[value='" + item.value + "']").length <= 0) {
                        $("#<%=ServicesNeededRight.ClientID%>").append("<option value=" + item.value + ">" + item.text + "</option>");
                    }
                });
            }
            if (leftArray != null) {
                $.each(leftArray, function (index, item) {
                    $("#<%=ServicesNeededRight.ClientID%> option[value='" + item.value + "']").remove();
                });
            }
            if (rightArray != null) {
                $.each(rightArray, function (index, item) {
                    $("#<%=ServicesNeededLeft.ClientID%> option[value='" + item.value + "']").remove();
                });
            }
        }
        function checkMove() {
            if ($("#<%=ServicesNeededRight.ClientID%> option").size() == 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() == 0) {
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() == 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", false);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() == 0) {
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", false);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", false);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", false);
            }
        }
        
        function moveLeft() {
            $("#<%=ServicesNeededRight.ClientID%> option:selected").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                leftArray.push(data);
                if (rightArray != null) {
                    $.each(rightArray, function (i) {
                        if (rightArray[i].value === data.value) {
                            rightArray.splice(i, 1);
                            $("#<%=ServicesNeededRightHidden.ClientID%>").val(JSON.stringify(rightArray));
                            return false;
                        }
                    });
                }
                $("#<%=ServicesNeededLeft.ClientID%>").append(item);
            });
            $("#<%=ServicesNeededLeftHidden.ClientID%>").val(JSON.stringify(leftArray));
            checkMove();
            return false;
        }
        function moveRight() {
            $("#<%=ServicesNeededLeft.ClientID%> option:selected").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                rightArray.push(data);
                if (leftArray != null) {
                    $.each(leftArray, function (i) {
                        if (leftArray[i].value === data.value){
                            leftArray.splice(i, 1);
                            $("#<%=ServicesNeededLeftHidden.ClientID%>").val(JSON.stringify(leftArray));
                            return false;
                        }
                    });
                }
                $("#<%=ServicesNeededRight.ClientID%>").append(item);
            });
            $("#<%=ServicesNeededRightHidden.ClientID%>").val(JSON.stringify(rightArray));
            checkMove();
            return false;
        }
        function ConfirmSubmit() {
            Page_ClientValidate();
            if (Page_IsValid) {
                return confirm('I certify that all the information provided herein is true and complete to the best of my knowledge.');
            }
            return Page_IsValid;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="mainContentArea" style="padding-left:10px;">
        <div class="heading">
            <h3>ADD NEW or EDIT EXISTING REFERRAL</h3>
        </div>
        <div>
            <div class="col1">Social Security Number:</div>
            <div class="col2"><asp:TextBox runat="server" ID="SSN" AutoPostBack="True" CssClass="smallField"
                    ontextchanged="SSN_TextChanged"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="rfvSSN" ControlToValidate="SSN" runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>SSN is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Intake Date:</div>
            <div class="col2"><asp:TextBox runat="server" ID="IntakeDate" ClientIDMode="Static" CssClass="smallField"></asp:TextBox> (mm/dd/yyyy) </div>
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
            <div class="col2"><asp:TextBox runat="server" ID="MiddleInitial" MaxLength="1" CssClass="verySmallField"></asp:TextBox></div>
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
            <div class="col2"><asp:TextBox runat="server" ID="DateOfBirth" ClientIDMode="Static" CssClass="smallField"></asp:TextBox> (mm/dd/yyyy)</div>
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
            <div class="col2"><asp:TextBox runat="server" ID="Zip" CssClass="smallField"></asp:TextBox></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>        
        <div>
            <div class="col1">Phone:</div>
            <div class="col2"><asp:TextBox runat="server" ID="Phone" CssClass="smallField"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvPhone" ControlToValidate="Phone" runat="server"  SetFocusOnError="true"><span>Phone is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="revPhone" runat="server" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ControlToValidate="Phone" CssClass="errorValidator" SetFocusOnError="true"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">County:</div>
            <div class="col2">                
                <asp:DropDownList ID="County" runat="server"  CssClass="smallDropField">
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
            <div class="col2"><asp:TextBox runat="server" ID="Email" CssClass="largeField"></asp:TextBox></div>
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
            <div class="col1">
                <div style="padding-top: 100%; margin-top: -85%">
                        If "Other", describe:
                </div>
            </div>
            <div class="col2"><asp:TextBox Enabled="false" Columns="30" Rows="5" TextMode="MultiLine"  ID="OtherInfo" CssClass="textareaField" runat="server"></asp:TextBox></div>
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
            <div class="col1"><div style="padding-top: 100%; margin-top: -85%">
                        Directions to Client's Home:
                </div></div>
            <div class="col2"><asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="Directions" runat="server" CssClass="textareaField"></asp:TextBox></div>
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
            <div class="col2"><asp:TextBox  ID="Diagnosis" Columns="60" runat="server" CssClass="veryLargeField"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvDiagnosis" ControlToValidate="Diagnosis" runat="server"  SetFocusOnError="true"><span>Diagnosis is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1"><div style="padding-top: 100%; margin-top: -65%">
                        Service(s) Needed:
                </div></div>
            <div class="col2" style="width:700px">
                <div style="width:200px;float:left">
                    <asp:ListBox ID="ServicesNeededLeft" DataTextField="Name"  DataValueField="ServiceId" SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" style="min-width:200px;max-width:200px;height:200px;">
                    </asp:ListBox>
                    <asp:HiddenField ID="ServicesNeededLeftHidden" runat="server"/>
                </div>
                <div style="width: 80px; float: left">
                    <div style="padding: 10px;">
                        <asp:Button runat="server" Text="< Add" ID="ImageButtonLeft" OnClientClick="return moveLeft()"
                            Style="width: 60px" />
                    </div>
                    <div style="padding: 10px;">
                        <asp:Button Text="Rem >" ID="ImageButtonRight" OnClientClick="return moveRight()"
                            runat="server" Style="width: 60px" />
                    </div>
                </div>
                <div style="width:200px;float:left">
                    <asp:ListBox ID="ServicesNeededRight" DataTextField="Name"  DataValueField="ServiceId" SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" style="min-width:200px;max-width:200px;height:200px;">
                    </asp:ListBox>
                    <asp:HiddenField ID="ServicesNeededRightHidden" runat="server"/>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <asp:Panel ID="pnlCurrentServices" runat="server">
            <div class="col1"><div style="padding-top: 100%; margin-top: -65%">Current Services/Providers in Progress:</div></div>
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
            <div class="col1"><div <%=additionalPertinentInfoTotalRows!=0?"style='padding-top: 100%; margin-top: -65%'":"" %>>Additional Pertinent Information/Need(s):</div></div>
            <div class="col2">
                <asp:GridView Runat="server" DataSourceID="edsPertinent"
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
                <asp:EntityDataSource ID="edsPertinent" runat="server" ConnectionString="name=SWMPDDEntities"  OnSelected="Pertinent_Select"
                    DefaultContainerName="SWMPDDEntities" EnableFlattening="False" EntitySetName="Details" 
                    EntityTypeFilter="Detail" AutoGenerateWhereClause="true">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ClientId" QueryStringField="ClientId"/>
                        <asp:QueryStringParameter Name="Type" DefaultValue="A"/>
                    </WhereParameters>
                </asp:EntityDataSource>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div id="pertinentDiv" style="display:none">
        <asp:Panel runat="server" ID="pnlAddAdditionalInfo" Visible="false">
            <div class="col1"><div style="padding-top: 100%; margin-top: -85%">Add Additional Pertinent Information/Need:</div></div>
            <div class="col2">
                <asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  CssClass="textareaField" ID="AdditionalPertinent" runat="server" ValidationGroup="AddPertinent"></asp:TextBox>
                <br />
                <asp:Button runat="server" ID="btnPertinentInfo" 
                    Text="Save" 
                    onclick="btnPertinentInfo_Click" ValidationGroup="AddPertinent" />
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </asp:Panel>
        </div>
        <div>
            <div class="col1"></div>
            <div class="col2"><a href="javascript:addPertinent()" style="font-style:italic">Add Pertinent Information/Need</a></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
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
                    RepeatDirection="Horizontal" runat="server"  CssClass="verySmallDropField"
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
            <div class="col2"><asp:TextBox runat="server" ID="VerificationDate" ClientIDMode="Static" CssClass="smallField"></asp:TextBox> (mm/dd/yyyy)</div>
            <div class="col3">
                <asp:RequiredFieldValidator Enabled="false" CssClass="errorValidator" Display="Dynamic" ID="rfvVerificationDate" ControlToValidate="VerificationDate" InitialValue="Please select" runat="server"  SetFocusOnError="true"><span>Verification Date is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1">Lock-in Status:</div>
            <div class="col2">
                <asp:DropDownList ID="LockInStatus" RepeatDirection="Horizontal" runat="server" CssClass="verySmallDropField">
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
            <div class="col2"><asp:TextBox runat="server" ID="DateClientContacted" ClientIDMode="Static"  CssClass="smallField"></asp:TextBox> (mm/dd/yyyy)</div>
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
            <div class="col2"><asp:TextBox runat="server" ID="RemovalDate" ClientIDMode="Static" CssClass="smallField"></asp:TextBox> (mm/dd/yyyy)</div>
            <div class="col3">
                <asp:RequiredFieldValidator CssClass="errorValidator" Enabled="false" Display="Dynamic" ID="rfvRemovalDate" ControlToValidate="RemovalDate"  runat="server"  SetFocusOnError="true"><span>Removal Date is required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear"></div>
        </div>
        <div>
            <div class="col1"><div <%=commentTotalRows!=0?"style='padding-top: 100%; margin-top: -85%'":"" %>>Official Comment(s):</div></div>
            <div class="col2">
                <asp:GridView Runat="server" DataSourceID="epsComment"
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
                        <asp:BoundField HeaderText="Offical Comments" DataField="Text"/>
                        <asp:BoundField HeaderText="Added On" DataField="CreationDate"/>
                        <asp:BoundField HeaderText="Added By" DataField="CreationUser"/>
                    </Columns>
                    <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:EntityDataSource ID="epsComment" runat="server" ConnectionString="name=SWMPDDEntities" OnSelected="Comment_Select"
                    DefaultContainerName="SWMPDDEntities" EnableFlattening="False" EntitySetName="Details" 
                    EntityTypeFilter="Detail" AutoGenerateWhereClause="true">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="ClientId" QueryStringField="ClientId"/>
                        <asp:QueryStringParameter Name="Type" DefaultValue="C"/>
                    </WhereParameters>
                </asp:EntityDataSource>                            
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div id="commentDiv" style="display:none;">
            <asp:Panel runat="server" ID="pnlAddComment" Visible="false">
                <div class="col1"><div style='padding-top: 100%; margin-top: -85%'>Add Comment:</div></div>
                <div class="col2">
                    <asp:TextBox Columns="30" Rows="5" TextMode="MultiLine"  ID="OfficalComments" CssClass="textareaField" runat="server" ValidationGroup="Comment"></asp:TextBox><br />
                    <asp:Button runat="server" ID="btnAddComment" Text="Save" 
                        onclick="btnAddComment_Click"  ValidationGroup="Comment" />
                </div>
                <div class="col3"></div>
                <div class="clear"></div>
            </asp:Panel>
        </div>
        <div>
            <div class="col1"></div>
            <div class="col2"><a href="javascript:addComment()" style="font-style:italic">Add Comment</a></div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div style="padding-top:40px; padding-left:10px;">
            <asp:Button Visible="false" OnClientClick="javascript:return ConfirmSubmit()" ID="btnSubmit"  runat="server" OnClick="btnSubmit_Click" Text="Submit Application" />
            <asp:Button Visible="false" OnClientClick="javascript:return ConfirmSubmit()" ID="btnSave" runat="server"  OnClick="btnSave_Click" Text="Save"/>
            <asp:Button Visible="false" OnClientClick="javascript:return ConfirmSubmit()" ID="btnPrintDay"  runat="server" Text="Print 5-Day Letter" />
            <asp:Button Visible="false" OnClientClick="javascript:return ConfirmSubmit()" ID="btnPrintReferral"  runat="server" Text="Print Referral Form" />
            <asp:Button ID="btnCancel" Visible="True" runat="server" CausesValidation="false" Text="Cancel"  OnClick="btnCancel_Click" />
        </div>
        <div style="padding-top:20px; padding-left:10px;">
            <asp:Label ID="lbllastupdatedBy" runat="server" Text=""></asp:Label>
        </div>
    </div>
        <script type="text/javascript">
            $(function () {
                $("#<%=ServicesNeededLeft.ClientID%> option").each(function (index, item) {
                    var data = new Object();
                    data.value = $(item).val();
                    data.text = $(item).text();
                    var exist=false;
                    $.each(leftArray, function (arrayIndex, arrayItem) {
                        if(arrayItem.value==data.value)
                        {
                            exist=true;
                        }
                    });
                    if(!exist)
                        leftArray.push(data);
                    $("#<%=ServicesNeededLeftHidden.ClientID%>").val(JSON.stringify(leftArray));
                });
                $("#<%=ServicesNeededRight.ClientID%> option").each(function (index, item) {
                    var data = new Object();
                    data.value = $(item).val();
                    data.text = $(item).text();
                    var exist=false;
                    $.each(rightArray, function (arrayIndex, arrayItem) {
                        if(arrayItem.value==data.value)
                        {
                            exist=true;
                        }
                    });
                    if(!exist)
                        rightArray.push(data);
                    $("#<%=ServicesNeededRightHidden.ClientID%>").val(JSON.stringify(rightArray));
                });
            });
        </script>
</asp:Content>
