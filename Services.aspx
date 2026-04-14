<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Choose a Service</h2>

    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>

    <div class="mb-3">
        <label>Select Category</label><br />
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select" Width="300px">
            <asp:ListItem Value="">-- Please select a category --</asp:ListItem>
            <asp:ListItem>Emergency Mechanic (On road)</asp:ListItem>
            <asp:ListItem>Home Mechanic Visit</asp:ListItem>
            <asp:ListItem>Tow / Car Tow</asp:ListItem>
            <asp:ListItem>Battery Jump Start</asp:ListItem>
            <asp:ListItem>Tyre / Puncture Service</asp:ListItem>
            <asp:ListItem>Car Wash Booking</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="mb-3">
        <label>Radius (KM)</label><br />
        <asp:TextBox ID="txtRadius" runat="server" CssClass="form-control" Width="120px" Text="1" />
    </div>

    <!-- Hidden fields to store lat/lng -->
    <asp:HiddenField ID="hdnLat" runat="server" />
    <asp:HiddenField ID="hdnLng" runat="server" />

    <div class="mb-3">
        <asp:Button ID="btnGetLocation" runat="server" Text="Get My Location" CssClass="btn btn-secondary"
            OnClientClick="getLocation(); return false;" />
        <asp:Button ID="btnSearch" runat="server" Text="Find Nearby Garages" CssClass="btn btn-primary"
            OnClick="btnSearch_Click" />
    </div>

    <div id="map" style="width:100%; height:400px; border:1px solid #ccc; margin-bottom:20px;"></div>

    <asp:GridView ID="gvGarages" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Garage Name" />
        <asp:BoundField DataField="DistanceKm" HeaderText="Distance (KM)" DataFormatString="{0:0.00}" />
        <asp:HyperLinkField HeaderText="Profile"
            Text="View"
            DataNavigateUrlFields="GarageId"
            DataNavigateUrlFormatString="GarageDetails.aspx?id={0}" />
    </Columns>
</asp:GridView>


    <!-- Leaflet CSS & JS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

    <script>
        var map, userMarker;

        function initMap() {
            // Default location = Multan Haram Gate
            var defaultPos = [30.1575, 71.5249];

            map = L.map('map').setView(defaultPos, 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a>'
            }).addTo(map);

            userMarker = L.marker(defaultPos).addTo(map).bindPopup("Default Location");
        }

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (pos) {
                    var lat = pos.coords.latitude;
                    var lng = pos.coords.longitude;

                    document.getElementById('<%= hdnLat.ClientID %>').value = lat;
                    document.getElementById('<%= hdnLng.ClientID %>').value = lng;

                    map.setView([lat, lng], 15);
                    if (userMarker) map.removeLayer(userMarker);
                    userMarker = L.marker([lat, lng]).addTo(map).bindPopup("You are here").openPopup();
                }, function (err) {
                    alert('Could not get location: ' + err.message);
                });
            } else {
                alert('Geolocation is not supported by this browser.');
            }
        }

        // Server markers
        function addMarker(lat, lng, title) {
            L.marker([lat, lng]).addTo(map).bindPopup(title);
        }

        window.onload = initMap;
    </script>

</asp:Content> 