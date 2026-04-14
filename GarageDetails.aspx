<%@ Page Title="Garage Details" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GarageDetails.aspx.cs" Inherits="GarageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>

    <!-- Main Flex Container -->
    <div style="display: flex; align-items: center; justify-content: space-between; 
                padding: 40px; 
                background: linear-gradient(90deg, #f7f9fc 0%, #e3e7ed 100%);
                border-radius: 15px; 
                box-shadow: 0 0 15px rgba(0,0,0,0.05); margin-bottom:20px;">

        <!-- Left Side: Garage Info -->
        <div style="flex: 1; padding-right: 30px;">
            <h2 style="font-family: 'Segoe UI', Tahoma, sans-serif; color: #222; font-size: 32px; margin-bottom: 10px;">
                <asp:Label ID="lblName" runat="server" CssClass="text-primary"></asp:Label>
            </h2>
            <p style="font-size: 18px; color: #555; margin: 0;">
                <strong>Address:</strong> <asp:Label ID="lblAddress" runat="server"></asp:Label>
            </p>
            <p style="font-size: 18px; color: #555; margin: 5px 0 0;">
                <strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server"></asp:Label>
            </p>
        </div>

        <!-- Right Side: Image -->
        <div style="flex-shrink: 0; text-align: center;">
            <img src="m.png" alt="Garage Image" 
                 style="max-width: 280px; height: auto; border-radius: 10px;" />
        </div>
    </div>

    <script>
        var map;
        function initMap(lat, lng, title) {
            var loc = { lat: lat, lng: lng };
            map = new google.maps.Map(document.getElementById('map'), {
                center: loc,
                zoom: 15
            });
            var marker = new google.maps.Marker({
                position: loc,
                map: map,
                title: title
            });
        }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_KEY"></script>
</asp:Content>
