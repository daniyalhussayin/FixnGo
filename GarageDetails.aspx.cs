using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;

public partial class GarageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int garageId;
            if (!int.TryParse(Request.QueryString["id"], out garageId))
            {
                lblMsg.Text = "Invalid Garage ID.";
                return;
            }

            LoadGarage(garageId);
        }
    }

    private void LoadGarage(int garageId)
    {
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT Name, Address, Phone, Latitude, Longitude FROM Garages WHERE GarageId=@id", con))
        {
            cmd.Parameters.AddWithValue("@id", garageId);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // pnlDetails.Visible = true;  <-- REMOVE THIS LINE

                    lblName.Text = dr["Name"].ToString();
                    lblAddress.Text = dr["Address"].ToString();
                    lblPhone.Text = dr["Phone"].ToString();

                    double lat = Convert.ToDouble(dr["Latitude"]);
                    double lng = Convert.ToDouble(dr["Longitude"]);

                    // Show map marker using JS
                    string safeTitle = HttpUtility.JavaScriptStringEncode(lblName.Text);
                    string js = string.Format(
                        CultureInfo.InvariantCulture,
                        "initMap({0}, {1}, '{2}');",
                        lat, lng, safeTitle
                    );
                    ClientScript.RegisterStartupScript(this.GetType(), "mapInit", js, true);
                }
                else
                {
                    lblMsg.Text = "Garage not found.";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}
