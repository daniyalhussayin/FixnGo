<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width:400px; margin:30px auto; padding:20px; border:1px solid #ccc; border-radius:8px; box-shadow:0px 0px 10px rgba(0,0,0,0.1);">
        <h3 style="text-align:center; color:#007bff;">Reset Password</h3>
        <hr />
        
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block" />

        <div style="margin-bottom:15px;">
            <label>New Password</label><br />
            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" Width="100%" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPassword"
                CssClass="text-danger" ErrorMessage="New password is required" />
        </div>

        <div style="margin-bottom:15px;">
            <label>Confirm Password</label><br />
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" Width="100%" TextMode="Password" />
            <asp:CompareValidator runat="server" ControlToCompare="txtNewPassword"
                ControlToValidate="txtConfirmPassword" CssClass="text-danger" ErrorMessage="Passwords do not match" />
        </div>

        <asp:Button ID="btnReset" runat="server" Text="Update Password"
            CssClass="btn btn-success" Width="100%" OnClick="btnReset_Click" />
    </div>
</asp:Content>
