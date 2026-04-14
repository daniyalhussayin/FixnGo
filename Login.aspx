<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width:400px; margin:30px auto; padding:20px; border:1px solid #ccc; border-radius:8px; box-shadow:0px 0px 10px rgba(0,0,0,0.1);">
        <h3 style="text-align:center; color:#007bff;">User Login</h3>
        <hr />

        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block" />

        <div style="margin-bottom:15px;">
            <label>Email</label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                CssClass="text-danger" ErrorMessage="Email is required" />
        </div>

        <div style="margin-bottom:15px;">
            <label>Password</label><br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Width="100%" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                CssClass="text-danger" ErrorMessage="Password is required" />
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login"
            CssClass="btn btn-primary" Width="100%" OnClick="btnLogin_Click" />
        <p style="text-align:center; margin-top:10px;">
    <a href="ForgotPassword.aspx" style="color:#007bff; text-decoration:none;">Forgot Password?</a>
</p>
    </div>
</asp:Content>
