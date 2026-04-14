using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadProfile();
        }
    }

    private void LoadProfile()
    {
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT FullName, Email, Phone, CarType, CarCompany, CarName, CarModel, CarCC, ProfilePic " +
                "FROM Users WHERE FullName = @name", con);

            cmd.Parameters.AddWithValue("@name", Session["UserName"].ToString());

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblName.Text = dr["FullName"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();

                    // Car Details
                    lblCar.Text = dr["CarName"].ToString() + " (" +
                                  dr["CarModel"].ToString() + ") - " +
                                  dr["CarCC"].ToString() + "cc";

                    // Profile Pic
                    string pic = dr["ProfilePic"] == DBNull.Value ? "" : dr["ProfilePic"].ToString();
                    imgProfile.ImageUrl = string.IsNullOrWhiteSpace(pic) ? "~/default-profile.png" : pic;
                }
                else
                {
                    lblMsg.Text = "User not found.";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}
