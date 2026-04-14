using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@Email AND Phone=@Phone", con);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            if (count > 0)
            {
                Session["ResetEmail"] = txtEmail.Text.Trim();
                Response.Redirect("ResetPassword.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid email or phone number.";
            }
        }
    }
}
