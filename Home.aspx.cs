using System;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool logged = Session["UserName"] != null;
        phWelcome.Visible = logged;
        phNeedLogin.Visible = !logged;

        if (logged)
        {
            lblName.Text = Session["UserName"].ToString();
        }
    }
}
