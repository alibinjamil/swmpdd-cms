<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SWMPDD.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href='~/css/swmpdd.login.css' rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div id="loginArea">            
            <div style="padding-top:108px"><center><b>AUTHORIZED ACCESS ONLY</b></center></div>
            <div>Enter your user name and password, and then click &quot;Sign In&quot; to
          access the Elderly &amp; Disabled Medicaid Waiver Program Case 
          Management System.</div>
            <div >
                <asp:Label Text="User Name:" Width="200px" runat="server"></asp:Label>
                <asp:TextBox runat="server" Width="200px" ID="tbUserName"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label1" Text="Password:" Width="200px" runat="server"></asp:Label>
                <asp:TextBox runat="server" Width="200px" ID="tbPassword" TextMode="Password"></asp:TextBox>        
            </div>
            <div>
            
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    onclick="btnLogin_Click" />
            
            </div>
        </div>
    </center>
    </form>
</body>
</html>
