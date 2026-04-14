using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate car model dropdown (1980 to 2025)
            for (int year = 2025; year >= 1980; year--)
            {
                ddlCarModel.Items.Add(year.ToString());
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;

        // Save Profile Picture
        string filePath = "";
        if (fuProfilePic.HasFile)
        {
            string fileName = Path.GetFileName(fuProfilePic.PostedFile.FileName);
            filePath = "~/Uploads/" + fileName;
            fuProfilePic.SaveAs(Server.MapPath(filePath));
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("sp_User_Register", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@ProfilePic", filePath);
            cmd.Parameters.AddWithValue("@CarType", ddlCarType.SelectedValue);
            cmd.Parameters.AddWithValue("@CarCompany", ddlCarCompany.SelectedValue);
            cmd.Parameters.AddWithValue("@CarName", txtCarName.Text.Trim());
            cmd.Parameters.AddWithValue("@CarModel", ddlCarModel.SelectedValue);
            cmd.Parameters.AddWithValue("@CarCC", ddlCarCC.SelectedValue);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Registration successful!";
                lblMessage.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "DB Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }
    }
}
