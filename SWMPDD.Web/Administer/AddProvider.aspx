<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Administer.master" AutoEventWireup="true" EnableEventValidation="false" 
    CodeBehind="AddProvider.aspx.cs" Inherits="SWMPDD.Web.Administer.AddProvider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style type="text/css">
        .row
        {
            padding: 5px;
        }
        .col1
        {
            float: left;
            width: 20%;
        }
        .col2
        {
            float: left;
            width: 30%;
        }
        .col3
        {
            float: left;
            width: 50%;
        }
    </style>
    <script type="text/javascript">
        var leftArray = new Array();
        var rightArray = new Array();
        var countyLeftArray = new Array();
        var countyRightArray = new Array();
        $(function () {
            checkItem();
            checkCountyItem();
            checkMove();
            checkCountyMove();
        });
        function checkCountyItem() {
            var jsonObject = $.parseJSON($("#<%=CountyLeftHidden.ClientID%>").val());
            if (jsonObject != null && jsonObject != "") {
                countyLeftArray = jsonObject;
                $.each(countyLeftArray, function (index, item) {
                    if ($("#<%=CountyLeft.ClientID%> option[value='" + item.value + "']").length <= 0) {
                        $("#<%=CountyLeft.ClientID%>").append("<option value=" + item.value + ">" + item.text + "</option>");
                    }
                });
            }
            var jsonObject = $.parseJSON($("#<%=CountyRightHidden.ClientID%>").val());
            if (jsonObject != null && jsonObject != "") {
                countyRightArray = jsonObject;
                $.each(countyRightArray, function (index, item) {
                    if ($("#<%=CountyRight.ClientID%> option[value='" + item.value + "']").length <= 0) {
                        $("#<%=CountyRight.ClientID%>").append("<option value=" + item.value + ">" + item.text + "</option>");
                    }
                });
            }
            if (countyLeftArray != null) {
                $.each(countyLeftArray, function (index, item) {
                    $("#<%=CountyRight.ClientID%> option[value='" + item.value + "']").remove();
                });
            }
            if (countyRightArray != null) {
                $.each(countyRightArray, function (index, item) {
                    $("#<%=CountyLeft.ClientID%> option[value='" + item.value + "']").remove();
                });
            }
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
        function checkCountyMove() {
            if ($("#<%=CountyRight.ClientID%> option").size() == 0 && $("#<%=CountyLeft.ClientID%> option").size() == 0) {
                //$("#<%=CountyRightButton.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                //$("#<%=CountyLeftButton.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=CountyRightButton.ClientID%>").attr("disabled", true);
                $("#<%=CountyLeftButton.ClientID%>").attr("disabled", true);
            } else if ($("#<%=CountyRight.ClientID%> option").size() == 0 && $("#<%=CountyLeft.ClientID%> option").size() != 0) {
                //$("#<%=CountyRightButton.ClientID%>").attr("src", "../img/bt_rem.png");
                //$("#<%=CountyLeftButton.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=CountyRightButton.ClientID%>").attr("disabled", false);
                $("#<%=CountyLeftButton.ClientID%>").attr("disabled", true);
            } else if ($("#<%=CountyRight.ClientID%> option").size() != 0 && $("#<%=CountyLeft.ClientID%> option").size() == 0) {
                // $("#<%=CountyRightButton.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                //$("#<%=CountyLeftButton.ClientID%>").attr("src", "../img/bt_add.png");
                $("#<%=CountyRightButton.ClientID%>").attr("disabled", true);
                $("#<%=CountyLeftButton.ClientID%>").attr("disabled", false);
            } else if ($("#<%=CountyRight.ClientID%> option").size() != 0 && $("#<%=CountyLeft.ClientID%> option").size() != 0) {
                // $("#<%=CountyRightButton.ClientID%>").attr("src", "../img/bt_rem.png");
                // $("#<%=CountyLeftButton.ClientID%>").attr("src", "../img/bt_add.png");
                $("#<%=CountyRightButton.ClientID%>").attr("disabled", false);
                $("#<%=CountyLeftButton.ClientID%>").attr("disabled", false);
            }
        }
        function checkMove() {
            if ($("#<%=ServicesNeededRight.ClientID%> option").size() == 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() == 0) {
                // $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                // $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() == 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                // $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_rem.png");
                //  $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_dis_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", false);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", true);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() == 0) {
                //  $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_dis_rem.png");
                //  $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", true);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", false);
            } else if ($("#<%=ServicesNeededRight.ClientID%> option").size() != 0 && $("#<%=ServicesNeededLeft.ClientID%> option").size() != 0) {
                //  $("#<%=ImageButtonRight.ClientID%>").attr("src", "../img/bt_rem.png");
                //  $("#<%=ImageButtonLeft.ClientID%>").attr("src", "../img/bt_add.png");
                $("#<%=ImageButtonRight.ClientID%>").attr("disabled", false);
                $("#<%=ImageButtonLeft.ClientID%>").attr("disabled", false);
            }
        }
        function moveCountyLeft() {
            $("#<%=CountyRight.ClientID%> option:selected").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                countyLeftArray.push(data);
                if (countyRightArray != null) {
                    $.each(countyRightArray, function (i) {
                        if (countyRightArray[i].value === data.value) {
                            countyRightArray.splice(i, 1);
                            $("#<%=CountyRightHidden.ClientID%>").val(JSON.stringify(countyRightArray));
                            return false;
                        }
                    });
                }
                $("#<%=CountyLeft.ClientID%>").append(item);
            });
            $("#<%=CountyLeftHidden.ClientID%>").val(JSON.stringify(countyLeftArray));
            checkCountyMove();
            return false;
        }
        function moveCountyRight() {
            $("#<%=CountyLeft.ClientID%> option:selected").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                countyRightArray.push(data);
                if (countyLeftArray != null) {
                    $.each(countyLeftArray, function (i) {
                        if (countyLeftArray[i].value === data.value) {
                            countyLeftArray.splice(i, 1);
                            $("#<%=CountyLeftHidden.ClientID%>").val(JSON.stringify(countyLeftArray));
                            return false;
                        }
                    });
                }
                $("#<%=CountyRight.ClientID%>").append(item);
            });
            $("#<%=CountyRightHidden.ClientID%>").val(JSON.stringify(countyRightArray));
            checkCountyMove();
            return false;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
     <div id="mainContentArea" style="padding-left:10px;">
        <div class="heading">
            <h3>ADD/EDIT Provider</h3>
        </div>
            
        <div class="row">
            <div class="col1">
                Provider Name:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbProviderName"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbProviderName"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true"><span>Provider Name is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                Telephone:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbTelephone"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tbTelephone"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Phone is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="tbTelephone"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"><span>Invalid Phone Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                Fax:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbFax"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tbFax"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Fax is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="tbFax"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"><span>Invalid Fax Number</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                Address:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbAddress"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tbAddress"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Address is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                City:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbCity"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbCity"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>City is Required</span></asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                State:</div>
            <div class="col2">
                <asp:Label runat="server" ID="Label1" Text="MS"></asp:Label>
            </div>
            <div class="col3">
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                ZIP Code:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbZipCode"></asp:TextBox>
            </div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbZipCode"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>ZIP Code is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbZipCode"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"
                    ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$"><span>Invalid ZIP Code</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">
                Email:</div>
            <div class="col2">
                <asp:TextBox runat="server" ID="tbEmail"></asp:TextBox></div>
            <div class="col3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbEmail"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"><span>Email is Required</span></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RequiredFieldValidator3" ControlToValidate="tbEmail"
                    runat="server" CssClass="errorValidator" SetFocusOnError="true" Display="Dynamic"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><span>Invalid Email Address</span></asp:RegularExpressionValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="row">
            <div class="col1">Service(s):</div>
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
        <div class="row">
            <div class="col1">Counties(s):</div>
            <div class="col2" style="width:700px">
                <div style="width:200px;float:left">
                    <asp:ListBox ID="CountyLeft" SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" style="min-width:200px;max-width:200px;height:200px;">
                    </asp:ListBox>
                    <asp:HiddenField ID="CountyLeftHidden" runat="server"/>
                </div>
                <div style="width: 80px; float: left">
                    <div style="padding: 10px;">
                        <asp:Button runat="server" Text="< Add" ID="CountyLeftButton" OnClientClick="return moveLeft()"
                            Style="width: 60px" />
                    </div>
                    <div style="padding: 10px;">
                        <asp:Button Text="Rem >" ID="CountyRightButton" OnClientClick="return moveRight()"
                            runat="server" Style="width: 60px" />
                    </div>
                </div>
                <div style="width:200px;float:left">
                    <asp:ListBox ID="CountyRight" SelectionMode="Multiple" RepeatDirection="Horizontal" runat="server" style="min-width:200px;max-width:200px;height:200px;">
                    </asp:ListBox>
                    <asp:HiddenField ID="CountyRightHidden" runat="server"/>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="col3"></div>
            <div class="clear"></div>
        </div>
        <div class="row" style="margin-left: 50px;">
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
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
            $("#<%=CountyLeft.ClientID%> option").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                var exist = false;
                $.each(countyLeftArray, function (arrayIndex, arrayItem) {
                    if (arrayItem.value == data.value) {
                        exist = true;
                    }
                });
                if (!exist)
                    countyLeftArray.push(data);
                $("#<%=CountyLeftHidden.ClientID%>").val(JSON.stringify(countyLeftArray));
            });
            $("#<%=CountyRight.ClientID%> option").each(function (index, item) {
                var data = new Object();
                data.value = $(item).val();
                data.text = $(item).text();
                var exist = false;
                $.each(countyRightArray, function (arrayIndex, arrayItem) {
                    if (arrayItem.value == data.value) {
                        exist = true;
                    }
                });
                if (!exist)
                    countyRightArray.push(data);
                $("#<%=CountyRightHidden.ClientID%>").val(JSON.stringify(countyRightArray));
            });
        });
    </script>
</asp:Content>
