using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security; // FormsAuthentication ke liye

public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand("sp_User_Login", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // User ko authenticated mark karo
                    FormsAuthentication.SetAuthCookie(txtEmail.Text.Trim(), false);

                    // Session me user name save karo
                    Session["UserName"] = dr["FullName"].ToString();

                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid login!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
