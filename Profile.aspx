<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; align-items: center; justify-content: space-between; 
                padding: 40px; 
                background: linear-gradient(90deg, #f7f9fc 0%, #e3e7ed 100%);
                border-radius: 15px; 
                box-shadow: 0 0 15px rgba(0,0,0,0.05); 
                max-width: 900px; margin: auto;">

        <!-- Left: User Details -->
        <div style="flex: 1; padding-right: 30px;">
            <h2 style="font-family: 'Segoe UI', Tahoma, sans-serif; color: #222; font-size: 32px; margin-bottom: 10px;">
                My <span style="color:#007bff;">Profile</span>
            </h2>
            <p style="font-size: 18px; color: #555; margin-bottom: 25px;">
                Here are your account details:
            </p>

            <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
            <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
            <p><strong>Car:</strong> <asp:Label ID="lblCar" runat="server" /></p>

            <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
        </div>

        <!-- Right: Profile Picture -->
        <div style="flex-shrink: 0; text-align: center;">
            <asp:Image ID="imgProfile" runat="server"
                 AlternateText="Profile Picture"
                 Style="width: 200px; height: 200px; border-radius: 50%; object-fit: cover; border: 3px solid #007bff;" />
        </div>
    </div>

</asp:Content>
