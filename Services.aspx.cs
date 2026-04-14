using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Agar page secure hai to yahan bhi check kar lo:
        // if (Session["UserId"] == null) Response.Redirect("Login.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";

        // Service category check (optional)
        if (ddlCategory.SelectedValue == "")
        {
            lblMsg.Text = "Please select a service category first.";
            return;
        }

        if (string.IsNullOrWhiteSpace(hdnLat.Value) || string.IsNullOrWhiteSpace(hdnLng.Value))
        {
            lblMsg.Text = "Please click \"Get My Location\" first.";
            return;
        }

        double lat, lng, radius;
        if (!double.TryParse(hdnLat.Value, out lat) || !double.TryParse(hdnLng.Value, out lng))
        {
            lblMsg.Text = "Location invalid. Please get your location again.";
            return;
        }

        if (!double.TryParse(txtRadius.Text, out radius))
        {
            radius = 1; 
        }

        Session["CurrentLat"] = lat;
        Session["CurrentLon"] = lng;

        // DB call
        string cs = ConfigurationManager.ConnectionStrings["FixnGoDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("sp_GetGaragesWithinRadius", con))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            // **Parameter names database wale hi use karo**
            cmd.Parameters.AddWithValue("@CurrentLat", lat);
            cmd.Parameters.AddWithValue("@CurrentLon", lng);
            cmd.Parameters.AddWithValue("@RadiusKm", radius);

            DataTable dt = new DataTable();
            try
            {
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }

                gvGarages.DataSource = dt;
                gvGarages.DataBind();

                // Map markers
                RegisterMarkersScript(dt);
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }

    private void RegisterMarkersScript(DataTable dt)
    {
        if (dt == null || dt.Rows.Count == 0) return;

        StringBuilder sb = new StringBuilder();
        sb.Append("<script>");
        foreach (DataRow row in dt.Rows)
        {
            double glat = Convert.ToDouble(row["Latitude"]);
            double glng = Convert.ToDouble(row["Longitude"]);
            string gname = row["Name"].ToString().Replace("'", "\\'");
            sb.AppendFormat("addMarker({0}, {1}, '{2}');", glat, glng, gname);
        }
        sb.Append("</script>");

        ClientScript.RegisterStartupScript(this.GetType(), "markers", sb.ToString());
    }
}
