<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineForm.aspx.cs" EnableEventValidation="false"
    Inherits="SWMPDD.Web.MedicaidForm.OnlineForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pre - Form</title>
    <link type="text/css" href='~/css/redmond/jquery-ui-1.8.24.custom.css' rel="stylesheet" />
    <link type="text/css" href='~/css/swmpdd.online.css' rel="stylesheet" />
    <script type="text/javascript" src='<%=Page.ResolveClientUrl("~/js/jquery-1.8.2.min.js")%>'></script>
    <script type="text/javascript" src='<%=Page.ResolveClientUrl("~/js/jquery-ui-1.8.24.custom.min.js")%>'></script>
    <script type="text/javascript">
        var leftArray = new Array();
        var rightArray = new Array();
        $(function () {
            $('#IntakeDate').datepicker();
            $('#DateOfBirth').datepicker();
            checkItem();
            checkMove();
        });
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
                //                $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                //                $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() == 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                //               $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_rem.png");
                //              $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", false);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() == 0) {
                //              $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                //              $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", false);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                //            $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_rem.png");
                //             $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_add.png");
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
                        if (leftArray[i].value === data.value) {
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
    </script>
</head>
<body>
    <div style="width: 740px; margin: auto">
        <div>
            <div style="float: left; width: 100px;">
                <img alt="logo" src="../img/logo_swmpdd_blue.gif" />
            </div>
            <div style="float: left; width: 640px;">
                <br />
                <div style="width: 640px; background-color: #cccccc; font-size: 19px; font-weight: bold;
                    text-align: center">
                    SOUTHWEST MISSISSIPPI PLANNING & DEVELOPMENT DISTRICT
                </div>
                <div style="width: 640px;">
                    <div style="float: left; width: 160px">
                        100 South Wall Street</div>
                    <div style="float: left; width: 160px; text-align: center">
                        Natchez, MS 39120
                    </div>
                    <div style="float: left; width: 160px; text-align: center">
                        Phone (601) 446-6044
                    </div>
                    <div style="float: left; width: 160px; text-align: right">
                        Fax (601) 446-6071</div>
                    <div class="clear">
                    </div>
                </div>
                <br />
                <div style="width: 640px; font-size: 15px; font-weight: bold; text-align: center">
                    <a href="http://www.swmpdd.com/">HOME</a> | <a href="http://www.swmpdd.com/services/services.asp">
                        SERVICES</a> | <a href="http://www.swmpdd.com/Resources/Resources.asp">RESOURCES</a>
                    | <a href="http://www.swmpdd.com/directors/directors.asp">BOARD OF DIRECTORS</a>
                    | <a href="http://www.swmpdd.com/staff/staff.asp">STAFF</a> | <a href="http://www.swmpdd.com/contact/contact.asp">
                        CONTACT US</a>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div style="width: 100%">
            <hr />
        </div>
        <div style="background-color: #4a93be; color: White; font-size: 15px; font-weight: bold;
            padding: 4px;">
            ELDERLY AND DISABLED MEDICAID WAIVER PROGRAM
        </div>
        <div style="width: 100%;">
            <h3 style="padding-top: 16px;">
                APPLICATION TO RECEIVE SERVICES FROM THE ELDERLY &amp; DISABLED MEDICAID WAIVER
                PROGRAM</h3>
        </div>
        <div>
            <ul>
                <li>Please complete and submit this form if you are interested in receiving services
                    provided by the Elderly and Disabled Medicaid Waiver Program.</li>
                <li>Qualifying individuals can complete and submit this form themself, or, a referrer
                    can complete and submit this form on behalf of a qualifying individual to receive
                    services provided by the Elderly and Disabled Medicaid Waiver Program.</li>
                <li>Information requested is for the qualifying individual.</li>
                <li>Fields marked with a red asterisk (<span style="color: Red"><b>*</b></span>) are
                    required.</li>
                <li>Please provide as much information as possible.</li>
                <li>After you submit this application, your name will be placed in a waiting list in
                    the order received, and you will be contacted when resources become available to
                    serve more individuals.</li>
            </ul>
        </div>
        <form id="form1" runat="server">
        <div>
            <asp:Panel ID="errorPanel" runat="server" CssClass="error" Visible="false" Style="margin-left: 0px;
                margin-right: auto; margin-top: 5px;">
                <div style="float: left; margin-left: 5px; margin-top: 5px;">
                    <asp:Image ID="Image2" ImageUrl="~/img/error.png" runat="server" />
                </div>
                <div style="float: left; margin-left: 5px; margin-top: 5px;">
                    <asp:Label runat="server" ID="errorMessage"></asp:Label>
                </div>
                <div style="clear: both">
                </div>
            </asp:Panel>
            <asp:Panel ID="successPanel" runat="server" CssClass="success" Visible="false" Style="margin-left: 0px;
                margin-right: auto; margin-top: 5px;">
                <div style="float: left; margin-left: 5px; margin-top: 5px;">
                    <asp:Image ID="Image3" ImageUrl="~/img/success.png" runat="server" />
                </div>
                <div style="float: left; margin-left: 5px; margin-top: 5px;">
                    <asp:Label runat="server" ID="successMessage"></asp:Label>
                </div>
                <div style="clear: both">
                </div>
            </asp:Panel>
        </div>
        <div>
            <div class="row">
                <div class="col1">
                    Social Security Number: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="SSN" OnTextChanged="SSN_TextChanged" AutoPostBack="True"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator ID="rfvSSN" ControlToValidate="SSN" runat="server" CssClass="errorValidator"
                        SetFocusOnError="true"><span>*SSN # required (No Dashes)</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    First Name: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="FirstName"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvFirstName"
                        ControlToValidate="FirstName" runat="server" SetFocusOnError="true"><span>*First Name is Required</span></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revFirstName" runat="server"
                        ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="FirstName" CssClass="errorValidator"
                        SetFocusOnError="true"><span>*Alphabetics only</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Middle Initial</div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="MiddleInitial" MaxLength="1" Style="width: 39px;
                        margin-left: 2px;"></asp:TextBox></div>
                <div class="col3">
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revMiddleInitial" runat="server"
                        ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="FirstName" CssClass="errorValidator"
                        SetFocusOnError="true"><span>*Alphabetics only</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Last Name: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="LastName"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvLastName"
                        ControlToValidate="LastName" runat="server" SetFocusOnError="true"><span>*Last Name is Required</span></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revLastName" runat="server"
                        ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ControlToValidate="LastName" CssClass="errorValidator"
                        SetFocusOnError="true"><span>*Alphabetics only</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Date of Birth: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="DateOfBirth" ClientIDMode="Static" Style="width: 111px;
                        margin-left: 2px;"></asp:TextBox>
                    (mm/dd/yyyy)</div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvDateOfBirth"
                        ControlToValidate="DateOfBirth" runat="server" SetFocusOnError="true"><span>*Date of Birth is Required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Address Line 1: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="AddressLine1"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvAddressLine1"
                        ControlToValidate="AddressLine1" runat="server" SetFocusOnError="true"><span>*Address Line 1 is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Address Line 2:</div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="AddressLine2"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    City: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="City"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvCity"
                        ControlToValidate="City" runat="server" SetFocusOnError="true"><span>*City is Required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    State:</div>
                <div class="col2">
                    MS</div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Zip: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="Zip" Style="width: 99px; margin-left: 2px;"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Phone: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="Phone"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvPhone"
                        ControlToValidate="Phone" runat="server" SetFocusOnError="true"><span>*Phone is Required</span></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revPhone" runat="server" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                        ControlToValidate="Phone" CssClass="errorValidator" SetFocusOnError="true"><span>*Invalid Phone Number</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    County: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:DropDownList ID="County" runat="server">
                        <asp:ListItem Value="None">Please select</asp:ListItem>
                        <asp:ListItem Value="Adams">Adams</asp:ListItem>
                        <asp:ListItem Value="Amite">Amite</asp:ListItem>
                        <asp:ListItem Value="Claiborne">Claiborne</asp:ListItem>
                        <asp:ListItem Value="Franklin">Franklin</asp:ListItem>
                        <asp:ListItem Value="Jefferson">Jefferson</asp:ListItem>
                        <asp:ListItem Value="Lawrence">Lawrence</asp:ListItem>
                        <asp:ListItem Value="Lincoln">Lincoln</asp:ListItem>
                        <asp:ListItem Value="Pike">Pike</asp:ListItem>
                        <asp:ListItem Value="Walthall">Walthall</asp:ListItem>
                        <asp:ListItem Value="Wilkinson">Wilkinson</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvCounty"
                        InitialValue="None" ControlToValidate="County" runat="server" SetFocusOnError="true"><span>*County is Required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Email Address:</div>
                <div class="col2">
                    <asp:TextBox runat="server" ID="Email" Style="width: 333px; margin-left: 2px;"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Gender: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:RadioButtonList ID="Gender" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Text="Male"></asp:ListItem>
                        <asp:ListItem Text="Female"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvGender"
                        ControlToValidate="Gender" runat="server" SetFocusOnError="true"><span>*Gender is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Currently Living at: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:DropDownList AutoPostBack="true" ID="ResidenceCode" RepeatDirection="Horizontal"
                        runat="server" OnSelectedIndexChanged="ResidenceCode_SelectedIndexChanged">
                        <asp:ListItem Text="Please select"></asp:ListItem>
                        <asp:ListItem Text="Home"></asp:ListItem>
                        <asp:ListItem Text="Nursing Facility"></asp:ListItem>
                        <asp:ListItem Text="Group Facility"></asp:ListItem>
                        <asp:ListItem Text="Assisted Living Facility"></asp:ListItem>
                        <asp:ListItem Text="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvResidenceCode"
                        InitialValue="Please select" ControlToValidate="ResidenceCode" runat="server"
                        SetFocusOnError="true"><span>*Currently Living at is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    <div style="padding-top: 100%; margin-top: -85%">
                        If "Other", please describe:</div>
                </div>
                <div class="col2">
                    <asp:TextBox Enabled="false" Columns="30" Rows="5" TextMode="MultiLine" ID="OtherInfo"
                        runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator Enabled="false" CssClass="errorValidator" Display="Dynamic"
                        ID="rfvOtherInfo" ControlToValidate="OtherInfo" runat="server" SetFocusOnError="true"><span>Other Residence Code is Required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Medicaid #:</div>
                <div class="col2">
                    <asp:TextBox ID="Medicaid" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Medicare #:</div>
                <div class="col2">
                    <asp:TextBox ID="Medicare" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Service(s) Needed:</div>
                <div class="col2" style="width: 700px">
                    <div style="width: 200px; float: left">
                        <asp:ListBox ID="ServicesNeededLeft" DataTextField="Name" DataValueField="ServiceId"
                            SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" Style="min-width: 200px;
                            max-width: 200px; height: 200px;"></asp:ListBox>
                        <asp:HiddenField ID="ServicesNeededLeftHidden" runat="server" />
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
                    <div style="width: 200px; float: left">
                        <asp:ListBox ID="ServicesNeededRight" DataTextField="Name" DataValueField="ServiceId"
                            SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" Style="min-width: 200px;
                            max-width: 200px; height: 200px;"></asp:ListBox>
                        <asp:HiddenField ID="ServicesNeededRightHidden" runat="server" />
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Contact Person's Name: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox ID="ContactPerson" runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvContactPerson"
                        ControlToValidate="ContactPerson" runat="server" SetFocusOnError="true"><span>*Contact Person's Name is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Contact's Relationship to Applicant: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox ID="RelationshiptoClient" runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvRelationshiptoClient"
                        ControlToValidate="RelationshiptoClient" runat="server" SetFocusOnError="true"><span>*Contact's Relationship to Applicant is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Contact's Phone #: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox ID="ContactPhone" runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="rfvContactPhone"
                        ControlToValidate="ContactPhone" runat="server" SetFocusOnError="true"><span>*Contact's Phone Number is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    <div style="padding-top: 100%; margin-top: -85%">
                        Directions to Home:</div>
                </div>
                <div class="col2">
                    <asp:TextBox Columns="30" Rows="5" TextMode="MultiLine" ID="Directions" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Referrer:</div>
                <div class="col2">
                    <asp:TextBox ID="ReferralSource" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Referrer's Phone #:</div>
                <div class="col2">
                    <asp:TextBox ID="ReferralPhone" runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revReferralPhone" runat="server"
                        ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                        ControlToValidate="ReferralPhone" CssClass="errorValidator" SetFocusOnError="true"><span>*Invalid Phone Number</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Physician's Name:</div>
                <div class="col2">
                    <asp:TextBox ID="Physician" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Physician's Phone #:</div>
                <div class="col2">
                    <asp:TextBox ID="PhysicianPhone" runat="server"></asp:TextBox></div>
                <div class="col3">
                    <asp:RegularExpressionValidator Display="Dynamic" ID="revPhysicianPhone" runat="server"
                        ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"
                        ControlToValidate="PhysicianPhone" CssClass="errorValidator" SetFocusOnError="true"><span>*Invalid Phone Number</span></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Physician's Address:</div>
                <div class="col2">
                    <asp:TextBox ID="PhysicianAddress" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Physician's City:</div>
                <div class="col2">
                    <asp:TextBox ID="PhysicianCity" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Physician's Zip:</div>
                <div class="col2">
                    <asp:TextBox ID="PhysicianZip" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Diagnosis:</div>
                <div class="col2">
                    <asp:TextBox ID="Diagnosis" runat="server"></asp:TextBox></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                </div>
                <div class="col2">
                    <img src="../img/ImageCode.GIF" /></div>
                <div class="col3">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <div class="col1">
                    Type the code shown above: <span style="color: Red"><b>*</b></span></div>
                <div class="col2">
                    <asp:TextBox ID="codeField" runat="server" Style="width: 117px; padding-left: 2px;"></asp:TextBox></div>
                <div class="col3">
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidatorCodeField"
                        runat="server" ValidationExpression="n17hv" ControlToValidate="codeField" CssClass="errorValidator"
                        SetFocusOnError="true"><span>*Invalid Code</span></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator CssClass="errorValidator" Display="Dynamic" ID="RequiredFieldValidator1"
                        ControlToValidate="codeField" runat="server" SetFocusOnError="true"><span>*Code is required</span></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row">
                <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Submit" />
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="False"
                    OnClick="btnCancel_Click" />
                <div class="clear">
                </div>
            </div>
        </div>
        <div style="width: 100%; padding-top: 60px;">
            <div style="text-align: center">
                <span style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;">
                    Developed and supported by</span> <a href="http://www.digiply.com" target="_blank"><span
                        style="font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; font-size: 10px;">
                        DigiPly</span></a>
            </div>
            <hr />
            <div style="text-align: center; font-size: x-small;">
                <a href="http://www.swmpdd.com/">Home</a> | <a href="http://www.swmpdd.com/services/services.asp">
                    Services</a> | <a href="http://www.swmpdd.com/Resources/Resources.asp">Resources</a>
                | <a href="http://www.swmpdd.com/directors/directors.asp">Board of Directors</a>
                | <a href="http://www.swmpdd.com/staff/staff.asp">Staff</a> | <a href="http://www.swmpdd.com/contact/contact.asp">
                    Contact Us</a>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $("#<%=ServicesNeededLeft.ClientID%> option").each(function (index, item) {
                    var data = new Object();
                    data.value = $(item).val();
                    data.text = $(item).text();
                    var exist = false;
                    $.each(leftArray, function (arrayIndex, arrayItem) {
                        if (arrayItem.value == data.value) {
                            exist = true;
                        }
                    });
                    if (!exist)
                        leftArray.push(data);
                    $("#<%=ServicesNeededLeftHidden.ClientID%>").val(JSON.stringify(leftArray));
                });
                $("#<%=ServicesNeededRight.ClientID%> option").each(function (index, item) {
                    var data = new Object();
                    data.value = $(item).val();
                    data.text = $(item).text();
                    var exist = false;
                    $.each(rightArray, function (arrayIndex, arrayItem) {
                        if (arrayItem.value == data.value) {
                            exist = true;
                        }
                    });
                    if (!exist)
                        rightArray.push(data);
                    $("#<%=ServicesNeededRightHidden.ClientID%>").val(JSON.stringify(rightArray));
                });
            });
        </script>
        </form>
    </div>
</body>
</html>
