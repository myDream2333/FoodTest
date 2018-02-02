<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAdd.aspx.cs" Inherits="LazyEating.UI.Web.Admin.UserAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
    <style type="text/css">
        #butn {
            width: 57px;
        }
    </style>
</head>
<body>
    <script type="text/javascript" language="javascript">
    function $$(id) {
        return document.getElementById(id);
    }
    function setErrorInfo() {
        var Pass1 = $$("txtPassword");
        var Pass2 = $$("txtPassword2");
        if (Pass1.value == Pass2.value) {
            Pass2.setCustomValidity("")
            return false;
            /*$$("tishi").innerHTML="<font color='green'>两次密码相同</font>";
            $$("submit").disabled=false;*/
        }
        else {
            Pass2.setCustomValidity("两次密码不同！")
            return true;
            /*$$("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
            $$("submit").disabled=true;*/
        }
    }
</script>
<script type="text/javascript" >
    function $$(id) {
        return document.getElementById(id);
    }
    //读取cookies
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }
    function CheckCookie() {
        var txt = $$("txtCode");
        if (txt.value.toUpperCase() == getCookie("CheckCode")) {
            txt.setCustomValidity("")
            return false;
        }
        else {
            txt.setCustomValidity("验证码输入错误！")
            return true;
        }
    }
</script>
    <div class="main">
		<h3>添加管理员</h3>
		<div class="content">
                <table>
                    <tr>
                        <td class="td1" align="right">用户名：</td>
                        <td colspan="2" class="td23">
                            <input id="txtUserName" name="txtUserName" type="text" />
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" 
                                ControlToValidate="txtUserName" ErrorMessage="请输入昵称"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="auto-style1"><h4 style=" text-align:left">密码中限6-16位字符</h4></td>
                    </tr>
                    <tr>
                        <td class="td1" align="right">密码：</td>
                        <td colspan="2" class="td23">
                            <input id="txtPassword" name="txtPassword" type="password" pattern="^[a-zA-Z]\w{5,7}$" maxlength="16" />
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1" align="right">确认密码：</td>
                        <td colspan="2" class="td23">
                            <input id="txtPassword2" name="txtPassword2" type="password" onkeyup="setErrorInfo()" />
                            <asp:RequiredFieldValidator ID="rfvPassword2" runat="server" 
                                ControlToValidate="txtPassword2" ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1" align="right">&nbsp;验证码：</td>
                        <td  class="td2">
                            <input id="txtCode" name="code" type="text" onkeyup="CheckCookie();"  />
                        </td>
                        <td class="td3">
                            <img id="ImgValidator" height="32px" width="72px" alt="看不清楚，点击刷新" onclick=" src = src + '?' " src="UserValidator/NumAndLetCheckCode.aspx"  />
                        </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Message" ForeColor="Red" runat="server"/></td>
                        <td><input id="butn" type="submit" value="添加"/></td>
                        <td></td>
                    </tr>
                </table>
			</div>
        </div>
</body>
</html>
