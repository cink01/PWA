using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prihlas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_log_Click(object sender, EventArgs e)
    {
#pragma warning disable CS0618 // Typ nebo člen je zastaralý.
        if (FormsAuthentication.Authenticate(TextBox_login.Text, TextBox_pw.Text))
#pragma warning restore CS0618 // Typ nebo člen je zastaralý.
        {
            Session["login"] = TextBox_login.Text;
            try
            {
                //FormsAuthentication.RedirectFromLoginPage(LoginTb.Text, false);
                FormsAuthentication.SetAuthCookie(TextBox_login.Text, false);
                if (TextBox_login.Text == "spravce")
                    Response.Redirect("spravce/Default.aspx");
                if (TextBox_login.Text == "Tomas")
                    Response.Redirect("Tomas/Default.aspx");
                if (TextBox_login.Text == "Honza")
                    Response.Redirect("Honza/Default.aspx");
            }
            catch (Exception)
            {

                
            }

        }
    }
}