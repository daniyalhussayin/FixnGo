<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width:400px; margin:30px auto; padding:20px; border:1px solid #ccc; border-radius:8px; box-shadow:0px 0px 10px rgba(0,0,0,0.1);">
        <h3 style="text-align:center; color:#007bff;">Forgot Password</h3>
        <hr />
        
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block" />

        <div style="margin-bottom:15px;">
            <label>Email</label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                CssClass="text-danger" ErrorMessage="Email is required" />
        </div>

        <div style="margin-bottom:15px;">
            <label>Phone Number</label><br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                CssClass="text-danger" ErrorMessage="Phone number is required" />
        </div>

        <asp:Button ID="btnVerify" runat="server" Text="Verify"
            CssClass="btn btn-primary" Width="100%" OnClick="btnVerify_Click" />
    </div>
</asp:Content>
