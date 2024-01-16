<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.EditProfile" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#toggle_pwd").click(function () {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                $("[id*=txtPassword]").attr("type", type);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                
                <nav aria-label="breadcrumb" style="background-color: #ffff;">
                    <ol class="breadcrumb p-1" style="background-color: #ffff;">
                        <li class="breadcrumb-item">
                            <a href="HomeRoom.aspx" style="color: #e67e22;">
                                <i class="fa-solid fa-house"></i>
                                Home
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="ViewProfile.aspx" style="color: #e67e22;">User Profile
                            </a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                    </ol>
                </nav>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container mt-3">
                            <span style="font-weight: bold; font-size: 25px; color: #34495e">
                                <center>
                                    <asp:Label Text="Edit Profile" runat="server" />
                                </center>

                            </span>
                            <hr style="border-bottom: 3px solid #d35400;" />

                            <div class="row">
                                <div class="col-lg-4 co-md-4 col-sm-12" style="border-right: 1px solid #bdc3c7;">


                                    <center>
                                        <img id="imgview" src="../DesignImages/userlogo.png" width="150" />
                                        <br />
                                        <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" runat="server" />
                                        <br />

                                        <br />
                                    </center>
                                </div>
                                <div class=" col-md-8 col-lg-8 col-sm-12 ">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <asp:Label Text="First Name" runat="server" />
                                            <asp:TextBox ID="txtFname" placeholder="Enter New First Name" CssClass="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <asp:Label Text="Middle Name" runat="server" />
                                            <asp:TextBox ID="txtMI" placeholder="Enter New Middle Name" CssClass="form-control" runat="server" required></asp:TextBox>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <asp:Label Text="Last Name" runat="server" />
                                            <asp:TextBox ID="txtLname" placeholder="Enter New Last Name" CssClass="form-control" runat="server" required></asp:TextBox>
                                        </div>

                                    </div>
                                    <br />
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>Gender:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlUserGender" CssClass="form-control" runat="server" required>

                                                        <asp:ListItem Text="Male"></asp:ListItem>
                                                        <asp:ListItem Text="Female"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Birth of Date:</td>
                                                <td>
                                                    <asp:TextBox ID="TxtBOD" CssClass="form-control" TextMode="Date" runat="server" required> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Place of Birth:</td>
                                                <td>
                                                    <asp:TextBox ID="txtPOB" placeholder="Enter New Place of Birth" CssClass="form-control" runat="server" required></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Current Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtAddress" placeholder="Enter New Address" CssClass="form-control" runat="server" required></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Contact Number:</td>
                                                <td>
                                                    <asp:TextBox ID="txtContact" placeholder="Enter New Contact Number" CssClass="form-control" runat="server" required></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gcash Number:</td>
                                                <td>
                                                    <asp:TextBox ID="txtGcash" placeholder="Enter New Gcash Number" CssClass="form-control" runat="server" required></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtEmail" placeholder="Enter New Email" TextMode="Email" CssClass="form-control" runat="server" required></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Username:</td>
                                                <td>
                                                    <asp:TextBox ID="txtUsername" TextMode="Email" placeholder="Enter New Username" CssClass="form-control" runat="server" required></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <div class="form-group">
                                                        <div class="input-group flex-nowrap">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" id="saddon-wrapping">
                                                                    <i class="fa-solid fa-lock"></i>
                                                                </span>
                                                            </div>
                                                            <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" placeholder="Atleast 8 Characters" CssClass="form-control" aria-describedby="saddon-wrapping" runat="server" required></asp:TextBox>
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" id="saddon-wrappins">
                                                                    <span id="toggle_pwd" class="fa fa-fw fa-eye field_icon" style="cursor: pointer;"></span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be contain 8 character/1 Upper case/1 Lower case/ 1 Number and Special Character." ControlToValidate="txtPassword" ForeColor="#FF3300" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!$*?&amp;]{8,}"></asp:RegularExpressionValidator>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="LnkUpdate" OnClick="LnkUpdate_Click" CssClass="btn btn-success" runat="server">
                                     Update Profile
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <br />
</asp:Content>
