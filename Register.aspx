<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="max-width:600px; margin:30px auto; padding:20px; border:1px solid #ccc; border-radius:8px; box-shadow:0px 0px 10px rgba(0,0,0,0.1);">
        <h3 style="text-align:center; color:#007bff;">User Registration</h3>
        <hr />

        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <!-- Full Name -->
        <div style="margin-bottom:15px;">
            <label>Name</label><br />
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
                CssClass="text-danger" ErrorMessage="Name is required" />
        </div>

        <!-- Email -->
        <div style="margin-bottom:15px;">
            <label>Email</label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                CssClass="text-danger" ErrorMessage="Email is required" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
                CssClass="text-danger" ErrorMessage="Invalid email"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
        </div>

        <!-- Phone -->
        <div style="margin-bottom:15px;">
            <label>Phone</label><br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Width="100%" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                CssClass="text-danger" ErrorMessage="Phone number is required" />
            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPhone"
                CssClass="text-danger" ErrorMessage="Invalid phone number"
                ValidationExpression="^[0-9]{10,15}$" />
        </div>

        <!-- Password -->
        <div style="margin-bottom:15px;">
            <label>Password</label><br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Width="100%" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                CssClass="text-danger" ErrorMessage="Password is required" />
        </div>

        <!-- Confirm Password -->
        <div style="margin-bottom:15px;">
            <label>Confirm Password</label><br />
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" Width="100%" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                CssClass="text-danger" ErrorMessage="Confirm password is required" />
            <asp:CompareValidator runat="server" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" CssClass="text-danger"
                ErrorMessage="Passwords do not match" />
        </div>

        <!-- Profile Picture -->
        <div style="margin-bottom:15px;">
            <label>Profile Picture</label><br />
            <asp:FileUpload ID="fuProfilePic" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="fuProfilePic"
                CssClass="text-danger" InitialValue="" ErrorMessage="Profile picture is required" />
        </div>

        <!-- Car Details -->
        <h4 style="margin-top:20px; color:#007bff;">Car Details (Optional)</h4>

        <div style="margin-bottom:15px;">
            <label>Car Type</label><br />
            <asp:DropDownList ID="ddlCarType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Type" Value="" />
                <asp:ListItem Text="Sedan" Value="Sedan" />
                <asp:ListItem Text="Hatchback" Value="Hatchback" />
                <asp:ListItem Text="SUV" Value="SUV" />
                <asp:ListItem Text="Truck" Value="Truck" />
            </asp:DropDownList>
        </div>

        <div style="margin-bottom:15px;">
            <label>Car Company</label><br />
            <asp:DropDownList ID="ddlCarCompany" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Company" Value="" />
                <asp:ListItem Text="Toyota" Value="Toyota" />
                <asp:ListItem Text="Honda" Value="Honda" />
                <asp:ListItem Text="Suzuki" Value="Suzuki" />
                <asp:ListItem Text="Mitsubishi" Value="Mitsubishi" />
                <asp:ListItem Text="Changan" Value="Changan" />
            </asp:DropDownList>
        </div>

        <!-- Car Name -->
        <div style="margin-bottom:15px;">
            <label>Car Name</label><br />
            <asp:TextBox ID="txtCarName" runat="server" CssClass="form-control" Width="100%" />
        </div>

        <div style="margin-bottom:15px;">
            <label>Car Model</label><br />
            <asp:DropDownList ID="ddlCarModel" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Model" Value="" />
            </asp:DropDownList>
        </div>

        <div style="margin-bottom:15px;">
            <label>Car CC</label><br />
            <asp:DropDownList ID="ddlCarCC" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select CC" Value="" />
                <asp:ListItem Text="660" Value="660" />
                <asp:ListItem Text="800" Value="800" />
                <asp:ListItem Text="1000" Value="1000" />
                <asp:ListItem Text="1300" Value="1300" />
                <asp:ListItem Text="1500" Value="1500" />
                <asp:ListItem Text="1800" Value="1800" />
                <asp:ListItem Text="2000" Value="2000" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register"
            CssClass="btn btn-success" Width="100%" OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="d-block mt-3"></asp:Label>
    </div>
</asp:Content>
