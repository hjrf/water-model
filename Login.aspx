<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="water_model.Login" %>

<!DOCTYPE HTML>
<html >
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</head>
       <%
        Label1.Text = "默认标题";
        String bgImgSrc = "images/bg.jpg";
        String sql = "select * from w_setting where s_id=1";
        System.Data.DataTable dt = hjr.SQL.SqlserverHelper.GetDataTable(sql);
        if (dt != null && dt.Rows.Count > 0)
        {
            if (dt.Rows[0][1].ToString().Trim() != "")
            {
                Label1.Text = dt.Rows[0][1].ToString().Trim();
            }
            if (dt.Rows[0][2].ToString().Trim() != "")
            {
                bgImgSrc = dt.Rows[0][2].ToString().Trim();
            }
        }
        else
        {
            Response.Write("<script>alert('没有找到数据库背景图片配置与标题配置信息，使用默认配置');</script>");
        }
    %>
<body id="login" style=" background: url(<%=bgImgSrc%>)no-repeat;
  background-size:cover;
  -webkit-background-size:cover;
  -moz-background-size:cover;
  -o-background-size:cover;
  -ms-background-size:cover;
  min-height:850px;"
    >
    <form id="form1" runat="server">
  <div class="login-logo">
    <a href="#">
      <asp:Label ID="Label1" runat="server" Text="水体纳污"></asp:Label>
      </a>&nbsp;
  </div>
  <h2 class="form-heading">login</h2>
  <div class="app-cam">
      <asp:TextBox ID="TextBox1" runat="server" type="text" class="text" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}"></asp:TextBox>
      <asp:TextBox ID="TextBox2" runat="server" type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"></asp:TextBox>
		<div class="submit">
            <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click"/>
		</div>
		<ul class="new">
			<li class="new_right"><p class="sign">新用户 ?<a href="Register.aspx"> 注册 </a></p></li>
			<div class="clearfix"></div>
		</ul>
  </div>
   <div class="copy_layout login">
            <p>Copyright &copy; 2016.C 北华大学 <a href="https://github.com/" target="_blank" title="github">https://github.com/</a> - hjr <a href="http://www.csdn.com/hjrcrj" title="博客" target="_blank">blon</a></p>
   </div>
    </form>
</body>
</html>
