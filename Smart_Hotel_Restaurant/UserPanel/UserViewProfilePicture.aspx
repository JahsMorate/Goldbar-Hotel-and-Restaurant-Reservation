<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="UserViewProfilePicture.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.UserViewProfilePicture" %>

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
    <div class="container pt-3 pb-3">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card p-0">
                    <div class="card-body">
                        <asp:HiddenField ID="hnval" runat="server" />
                        <div class="container-fluid p-0">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                    <nav aria-label="breadcrumb" style="background-color: #ffff;">
                                        <ol class="breadcrumb p-1" style="background-color: #ffff;">
                                            <li class="breadcrumb-item">
                                                <a href="HomeRoom.aspx" class="nav-link" style="color: #e67e22;">
                                                    <i class="fa-solid fa-house"></i>
                                                    Home
                                                </a>
                                            </li>
                                            <li class="breadcrumb-item active nav-link" aria-current="page">User Profile</li>
                                        </ol>
                                    </nav>


                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 p-0 ml-3 mb-3">
                                    <h4>My Profile</h4>
                                    <div>
                                        <p>Overview Profiles</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-0">

                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                        <div class="card-body">
                                            <div class="container-fluid">
                                                <div class="row p-0">
                                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                        <span class="bg-warning" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                            <i class="fa-solid fa-cart-shopping"></i>
                                                        </span>

                                                        <div class=" mt-3 fa-pull-right">

                                                            <span class="text-secondary" style="text-align: right;">Food Cart</span>

                                                            <h4>
                                                                <center>
                                                                    <center>
                                                                        <span style="font-size: 30px;">23</span>
                                                                    </center>
                                                                </center>
                                                                <span style="font-size: 15px;"></span>
                                                            </h4>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                        <div class="card-body">
                                            <div class="container-fluid">
                                                <div class="row p-0">
                                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                        <span class="bg-primary" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                            <i class="fa-solid fa-bed"></i>
                                                        </span>

                                                        <div class=" mt-3 fa-pull-right">

                                                            <span class="text-secondary" style="text-align: right;">Food Cart</span>

                                                            <h4>
                                                                <center>
                                                                    <center>
                                                                        <span style="font-size: 30px;">23</span>
                                                                    </center>
                                                                </center>
                                                                <span style="font-size: 15px;"></span>
                                                            </h4>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                        <div class="card-body">
                                            <div class="container-fluid">
                                                <div class="row p-0">
                                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                        <span class="bg-success" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                            <i class="fa-solid fa-table"></i>
                                                        </span>

                                                        <div class=" mt-3 fa-pull-right">

                                                            <span class="text-secondary" style="text-align: right;">Food Cart</span>

                                                            <h4>
                                                                <center>
                                                                    <center>
                                                                        <span style="font-size: 30px;">23</span>
                                                                    </center>
                                                                </center>
                                                                <span style="font-size: 15px;"></span>
                                                            </h4>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <%-- This is for the user profile--%>

                            <asp:Repeater ID="R_UserProfile" runat="server">
                                <ItemTemplate>
                                    <div class="row pt-3 pr-4 pl-4">

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <center>

                                                <img id="imgview" src="<%# Utils.GetImageUrl(Eval("profileImage")) %>" class="img-fluid" style="max-height: 150px; max-width: 150px; min-width: 150px; min-height: 150px; border-radius: 50%;" />
                                                <div>
                                                    <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" runat="server" />
                                                </div>
                                                <div>
                                                    <h4>
                                                        <span>
                                                            <%# Eval("CCusername") %>
                                                        </span>
                                                    </h4>
                                                </div>
                                            </center>
                                        </div>



                                    </div>
                                    <div class="row pt-3 pr-4 pl-4">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <h5><span><b>My Information</b></span></h5>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="First Name" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtFname" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("fname") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Middle Initial" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtMI" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("mi") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Last Name" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtLast" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("lname") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Gender" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtGender" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("gender") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-3 pr-4 pl-4">

                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Place of Birth" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtPob" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("pob") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Addrress" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtAddress" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("address") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Email" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtEmail" TextMode="Email" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("Cemail") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Contact No." CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtContactNo" TextMode="Number" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("contactNo") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-3 pr-4 pl-4">
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Gcash No." CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />
                                                <asp:TextBox ID="txtGcash" TextMode="Number" Style="text-align: center; border-radius: 10px;" CssClass="form-control" Text='<%# Eval("gcashNo") %>' runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <asp:Label Text="Password" CssClass="text-secondary bold" Style="font-weight: 600;" runat="server" />

                                                <div class="form-group">
                                                    <div class="input-group flex-nowrap">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="saddon-wrapping">
                                                                <i class="fa-solid fa-lock"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox ID="txtPassword" MaxLength="20" Text='<%# Eval("CCpass") %>' placeholder="Atleast 8 Characters" CssClass="form-control" aria-describedby="saddon-wrapping" runat="server" required></asp:TextBox>
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="saddon-wrappins">
                                                                <span id="toggle_pwd" class="fa fa-fw fa-eye field_icon" style="cursor: pointer;"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                           
                                        </div>
                                         <div class="col-lg-3 col-md-6 col-sm-12">
                                                <br />
                                                <asp:LinkButton ID="lnkUpdate" Style="border-radius: 10px;" CssClass="btn btn-block btn-primary" runat="server">Update Profile</asp:LinkButton>
                                            </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <%-- This is for the user profile--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
