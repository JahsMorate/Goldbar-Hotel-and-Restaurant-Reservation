<%@ Page Title="Registration Form" Language="C#" MasterPageFile="~/DefaulPage/Default.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.Registration" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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

    <div class="container-fluid img-fluid" style="background-image: url('../DesignImages/smartMain01.jpg'); width: 100%; height: 100%; background-size: cover; background-repeat: no-repeat; background-position: center;">



        <div class="container pt-5 pb-5">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="card p-4" style="background-color: #fffbfbe0; border-radius: 10px;">
                        <div class="card-body">
                            <div>
                                <center>
                                    <h1><span style="color: #57606f;">Registration Form</span></h1>
                                </center>
                            </div>

                            <hr style="border-width: 1px; border-color: #d35400;" />
                            <label class="text-muted"><b>Customer's Information Data</b></label>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 pt-0 pb-0">
                                    <label>Last Name <span style="color: red;"><b>*</b></span></label>
                                    <asp:TextBox ID="TxtLastName" MaxLength="20" placeholder="Enter Last Name" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div>
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="TxtLastName" ForeColor="#ff3300" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Lastname is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 pt-0 pb-0">
                                    <label>First Name <span style="color: red;"><b>*</b></span></label>
                                    <asp:TextBox ID="TxtFistName" MaxLength="20" placeholder="Enter First Name" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div>
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="TxtFistName" ForeColor="#ff3300" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Firstname is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 pt-0 pb-0">
                                    <label>Middle Name <span>(Optional)</span></label>
                                    <asp:TextBox ID="TxtMI" MaxLength="20" placeholder="Enter Middle Name" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-6 pt-0 pb-0">
                                    <label>Gender <span style="color: red;"><b>*</b></span></label>
                                    <asp:DropDownList ID="ddlUserGender" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div>
                                        <small>
                                            <asp:RequiredFieldValidator InitialValue="Select" ControlToValidate="ddlUserGender" ForeColor="#ff3300" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Gender is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 pt-0 pb-0">
                                    <label>Contact Number<span style="color: red;"><b>*</b></span></label>
                                    <asp:TextBox ID="txtUser_ContactNo" TextMode="Number" MaxLength="13" placeholder="Enter Mobile Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div>
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="txtUser_ContactNo" ForeColor="#ff3300" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Contact No. is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 pt-0 pb-0">
                                    <label>Gcash Account <span style="color: red;"><b>*</b></span></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtGcashNumber" TextMode="Number" MaxLength="15" placeholder="Enter Gcash Account Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="p-0">
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="txtGcashNumber" ForeColor="#ff3300" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Gcash No. is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 pt-0 pb-0">
                                    <label>Email <span style="color: red;"><b>*</b></span></label>
                                    <asp:TextBox ID="txtUserEmail" MaxLength="50" TextMode="Email" placeholder="Enter Active Email" CssClass="form-control" runat="server"></asp:TextBox>
                                    <div class="p-0">
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="txtUserEmail" ForeColor="#ff3300" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 pt-0 pb-0">
                                    <label>Username <span style="color: red;"><b>*</b></span></label>
                                    <div class="input-group flex-nowrap">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="saddon-wrapping2">
                                                <i class="fa-solid fa-user"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox ID="TxtUser_Username" MaxLength="20" Style="border: none;" placeholder="Create New Username" CssClass="form-control" onkeyup="javascript:validate()" aria-describedby="saddon-wrapping" runat="server"></asp:TextBox>

                                    </div>
                                    <div>
                                        <small>
                                            <asp:RequiredFieldValidator ControlToValidate="TxtUser_Username" ForeColor="#ff3300" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                                        </small>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 pt-0 pb-0">
                                    <label>Password <span style="color: red;"><b>*</b></span></label>
                                    <div class="form-group p-0">
                                        <div class="input-group flex-nowrap">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="saddon-wrapping">
                                                    <i class="fa-solid fa-lock"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" Style="border: none;" placeholder="Atleast 8 Characters" CssClass="form-control" aria-describedby="saddon-wrapping" runat="server"></asp:TextBox>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="saddon-wrappins">
                                                    <span id="toggle_pwd" class="fa fa-fw fa-eye field_icon" style="cursor: pointer;"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div>
                                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ValidationExpression="^.{4,}$" ErrorMessage="Password must be at least 4 characters long"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row pb-3">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <asp:Button ID="BtnRegistered" CssClass="btn btn-primary btn-block" runat="server" Text="Create my account" Style="font-weight: 400;" OnClick="BtnRegistered_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
