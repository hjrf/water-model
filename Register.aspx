<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="water_model.Register" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Register</title>
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

<body  id="login" style=" background: url(<%=bgImgSrc%>)no-repeat;
  background-size:cover;
  -webkit-background-size:cover;
  -moz-background-size:cover;
  -o-background-size:cover;
  -ms-background-size:cover;
  min-height:850px;"
    >
  <div class="login-logo">
    <a href="#">
      <asp:Label ID="Label1" runat="server" Text="水体纳污"></asp:Label>
      </a>&nbsp;
  </div>
  <h2 class="form-heading">Register</h2>
  <form runat="server" class="form-signin app-cam">
      <p>输入个人信息</p>
      <asp:TextBox ID="TextBox1"  runat="server" type="text" class="form-control1" placeholder="姓名" autofocus=""></asp:TextBox>
      <asp:TextBox ID="TextBox2"  runat="server" type="text" class="form-control1" placeholder="地址" autofocus=""></asp:TextBox>
      <asp:TextBox ID="TextBox3"  runat="server" type="text" class="form-control1" placeholder="邮箱" autofocus=""></asp:TextBox>
      <asp:TextBox ID="TextBox4"  runat="server" type="text" class="form-control1" placeholder="单位" autofocus=""></asp:TextBox>
      <div class="radios">
        <label for="radio-01" class="label_radio">
            <asp:RadioButton ID="RadioButton1" Checked="true" GroupName="sex" Text="男" runat="server" />
        </label>
        <label for="radio-02" class="label_radio">
            <asp:RadioButton ID="RadioButton2" Text="女" GroupName="sex" runat="server" />
        </label>
	  </div>
	  <p>输入账号信息</p>
      <asp:TextBox ID="TextBox5"  runat="server" type="text" class="form-control1" placeholder="用户名" autofocus=""></asp:TextBox>
      <asp:TextBox ID="TextBox6"  runat="server" type="password" class="form-control1" placeholder="密码" autofocus=""></asp:TextBox>
      <asp:TextBox ID="TextBox7"  runat="server" type="password" class="form-control1" placeholder="再次输入密码" autofocus=""></asp:TextBox>
      <label class="checkbox-custom check-success">
          <asp:CheckBox ID="CheckBox1" runat="server" /><label for="checkbox1">我同意使用该软件服务并遵守协议</label>
      </label>
      <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-success1 btn-block" Text="注册" OnClick="Button1_Click" />
      <div class="registration">
          已经注册过了.
          <a class="" href="Login.aspx">
              登录
          </a>
      </div>
  </form>
   <div class="copy_layout login register">
      <p>Copyright &copy; 2016.C 北华大学 <a href="https://github.com/hjrf" target="_blank" title="github">http://github.com/hjrf</a> - hjr <a href="http://blog.csdn.net/hjrcrj" title="博客" target="_blank">blon</a></p>
   </div>
</body>
</html>
