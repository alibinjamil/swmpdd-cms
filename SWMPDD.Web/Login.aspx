<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SWMPDD.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href='~/css/swmpdd.login.css' rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="loginArea">            
            <div style="padding-top:108px">
                <center><b>AUTHORIZED ACCESS ONLY</b></center>
            </div>
            <div>Enter your user name and password, and then click &quot;Sign In&quot; to
          access the Elderly &amp; Disabled Medicaid Waiver Program Case 
          Management System.</div>
          <div class="row">
                <div class="row">
                    <div class="col2"><asp:TextBox runat="server" Width="150px" ID="tbUserName"></asp:TextBox></div>
                    <div class="col1 col1Text">
                        <asp:Label Text="User Name:" runat="server"></asp:Label>
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div>
                    <div class="col2"><asp:TextBox runat="server" Width="150px" ID="tbPassword" TextMode="Password"></asp:TextBox></div>
                    <div class="col1 col1Text"><asp:Label ID="Label1" Text="Password:" runat="server"></asp:Label></div>
                    <div style="clear:both"></div>
                </div>
                <div>
                    <div class="col2"><asp:Button ID="btnLogin" runat="server" Text="Sign In" 
                        onclick="btnLogin_Click" /></div>
                    <div class="col1">&nbsp;</div>
                    <div style="clear:both"></div>
                </div>
                <div class="textRow">
                    <div class="col2">Forgot password? <a href="">Click here</a></div>
                    <div class="col1">&nbsp;</div>
                    <div style="clear:both"></div>
                </div>
                <div class="textRow">
                    <div class="col2">Need sign-in credentials? <a href="">Contact us</a></div>
                    <div class="col1">&nbsp;</div>
                    <div style="clear:both"></div>
                </div>
            </div>
            <div class="textRow">
                Microsoft® Internet Explorer® 8 or higher preferred. <a href="">Click here</a> for free download.
            </div>
            <div class="textRow">
                Adobe Reader® required. <a href="">Click here</a> for free download.</div>
            <div class="textRow">
                1024x768 or higher screen resolution preferred. <a href="">Click here</a> for help.
            </div>
        </div>
        <div id="lowerLoginArea">
            <div style="float:right;font-size:x:small;padding:0px">
                <a href="http://www.digiply.com" target="_blank">DigiPly</a>
            </div>
            <div style="clear:both">
            </div>
        </div>
    </form>
</body>
</html>
