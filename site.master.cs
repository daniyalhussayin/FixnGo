using System;
using System.Web.UI;

public partial class FixnGo_SiteMaster : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool logged = Session["UserName"] != null;

        liLogin.Visible = !logged;
        liRegister.Visible = !logged;
        liLogout.Visible = logged;
        liServices.Visible = logged;
        liProfile.Visible = logged; 
    }
}
