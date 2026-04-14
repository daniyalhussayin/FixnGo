<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; align-items: center; justify-content: space-between; 
                padding: 40px; 
                background: linear-gradient(90deg, #f7f9fc 0%, #e3e7ed 100%);
                border-radius: 15px; 
                box-shadow: 0 0 15px rgba(0,0,0,0.05);">

        <!-- Left Side: Welcome Text -->
        <div style="flex: 1; padding-right: 30px;">
            <h2 style="font-family: 'Segoe UI', Tahoma, sans-serif; color: #222; font-size: 36px; margin-bottom: 10px;">
                Welcome to <span style="color:#007bff;">FixnGo</span>
            </h2>
            <p style="font-size: 18px; color: #555; margin-bottom: 25px;">
                Your trusted roadside rescue & car care partner 🚗🔧
            </p>
            <asp:Panel ID="phNeedLogin" runat="server">
                <p style="font-size: 16px;">
                    Please 
                    <a href="Login.aspx" style="color: #007bff; font-weight: bold; text-decoration: none;">Login</a> 
                    or 
                    <a href="Register.aspx" style="color: #007bff; font-weight: bold; text-decoration: none;">Register</a> 
                    to continue.
                </p>
            </asp:Panel>
            <asp:Panel ID="phWelcome" runat="server" Visible="false">
                <h3 style="color: #333;">Welcome, <asp:Label ID="lblName" runat="server"></asp:Label>!</h3>
            </asp:Panel>
        </div>

        <!-- Right Side: Mechanic Image -->
        <div style="flex-shrink: 0; text-align: center;">
            <img src="m.png" alt="Mechanic" 
                 style="max-width: 280px; height: auto; object-fit: cover;" />
        </div>
    </div>

</asp:Content>
