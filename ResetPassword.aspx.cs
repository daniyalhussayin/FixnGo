using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class ResetPassword : System.Web.UI.Page
{
    protected void btnReset_Click(object sender, EventArgs e)
    {
        if (Session["ResetEmail"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        string email = Session["ResetEmail"].ToString();
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("UPDATE Users SET Password=@Password WHERE Email=@Email", con);
            cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            cmd.ExecuteNonQuery();
            Session["ResetEmail"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}
