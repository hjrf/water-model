using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace water_model
{
    public partial class Register : System.Web.UI.Page
    {
        String sql = null;
        DataTable dt = null;
        String name = null;
        String address = null;
        String email = null;
        String unit = null;
        String sex = null;
        String username = null;
        String password = null;
        String password2 = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Init();
            }
        }
        void Init()
        {
            sql = "if not exists (select 1 from  sysobjects where id = object_id('[w_user]') and type = 'U') create table w_user (u_id int identity(1,1) primary key,u_name varchar(30),u_address varchar(30),u_email varchar(30),u_unit varchar(30),u_sex varchar(30),u_username varchar(30),u_password varchar(100),)";
            hjr.SQL.SqlserverHelper.ExecuteScalar(sql);
           
            sql = "if not exists (select 1 from  sysobjects where id = object_id('[w_setting]') and type = 'U') create table w_setting (s_id int identity(1,1) primary key,s_title varchar(30),s_bgimg varchar(30))";
            hjr.SQL.SqlserverHelper.ExecuteScalar(sql);
        }
        String check()
        {
            name = TextBox1.Text;
            address = TextBox2.Text;
            email = TextBox3.Text;
            unit = TextBox4.Text;
            username = TextBox5.Text;
            password = TextBox6.Text;
            password2 = TextBox7.Text;
            if (RadioButton1.Checked)
            {
                sex = "男";
            }
            else if (RadioButton2.Checked)
            {
                sex = "女";
            }   
            if (username == "" || password == "")
            {
                return "error:用户名或密码不能为空！";
            }
            if (password != password2)
            {
                return "error:两次密码不同！";
            }
            if (!CheckBox1.Checked)
            {
                return "error:请确认协议！";
            }
            sql = "select * from w_user where u_username ='" + username + "'";
            dt = hjr.SQL.SqlserverHelper.GetDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
            {
                return "error:该用户已存在，请重新输入用户名！";
            }
            return "success";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (check().Contains("error"))
            {
                Response.Write("<script>alert('"+ check() +"');</script>");
                return;
            }
            password = hjr.Tools.Str.MD5(password);
            sql = "insert into w_user(u_name,u_address,u_email,u_unit,u_sex,u_username,u_password) values('"+ name.Trim() + "','" + address.Trim() + "','" + email.Trim() + "','" + unit.Trim() + "','" + sex.Trim() + "','" + username.Trim() + "','" + password.Trim() + "')";
            hjr.SQL.SqlserverHelper.ExecuteScalar(sql);
            Response.Write("<script>alert('注册成功');window.location = 'Login.aspx';</script>");
        }
    }
  
}