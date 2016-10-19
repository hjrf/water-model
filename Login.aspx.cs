using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace water_model
{
    public partial class Login : System.Web.UI.Page
    {
        String sql = null;
        DataTable dt = null;
        String username = null;
        String password = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        String check()
        { 
            username = TextBox1.Text;
            password = TextBox2.Text;
            password = hjr.Tools.Str.MD5(password);
            if (username == "" || password == "")
            {
                return "error:用户名或密码不能为空！";
            }
            sql = "select u_password from w_user where u_username = '" + username + "'";
            dt = hjr.SQL.SqlserverHelper.GetDataTable(sql);
            if (dt != null && dt.Rows.Count > 0)
            {
                if (password != dt.Rows[0][0].ToString().Trim())
                {
                    return "error:密码错误！";
                }
            }
            else
            {
                return "error:用户不存在！";
            }
            return "success";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (check().Contains("error"))
            {
                Response.Write("<script>alert('" + check() + "');</script>");
                return;
            }
            Response.Write("<script>alert('登录成功');</script>");
        }
    }
}