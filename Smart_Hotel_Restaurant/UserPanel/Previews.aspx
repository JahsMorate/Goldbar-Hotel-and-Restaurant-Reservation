<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="Previews.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.Previews" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:HiddenField ID="HndUserID" runat="server" />
    <div class="container mt-3">
        <div class="row">
            <div>
                <nav aria-label="breadcrumb" style="background-color: #ffff;">
                    <ol class="breadcrumb" style="background-color: #ffff;">
                        <li class="breadcrumb-item">
                            <a href="HomeRoom.aspx" class="nav-link" style="color: #e67e22;">
                                <i class="fa-solid fa-burger"></i>
                                Foods & Drinks
                            </a>
                        </li>
                        <li class="breadcrumb-item active nav-link" aria-current="page">Food & Drink Decriptions</li>
                    </ol>
                </nav>
            </div>
            <asp:Repeater ID="RPreveiws" runat="server">
                <ItemTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div classs="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; background-color: white; border-radius: 14px;">
                            <div class="card-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 pt-2">
                                            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                                <div class="carousel-indicators">
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>

                                                </div>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active" data-bs-interval="10000">
                                                        <asp:Image ID="firstImage" ImageUrl='<%# Utils.GetImageUrl( Eval("fimg01"))%>' Style="max-width: 450px; max-height: 450px; min-width: 450px; min-height: 450px;" class=" img-fluid" runat="server" />
                                                    </div>
                                                    <div class="carousel-item" data-bs-interval="2000">
                                                        <img src="<%# Utils.GetImageUrl( Eval("fimg02"))  %>" style="max-width: 450px; max-height: 450px; min-width: 450px; min-height: 450px;" class=" img-fluid" />
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img src="<%# Utils.GetImageUrl( Eval("fimg03"))  %>" style="max-width: 450px; max-height: 450px; min-width: 450px; min-height: 450px;" class=" img-fluid" />
                                                    </div>

                                                </div>
                                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <br />
                                            <div style="font-weight: 500; line-height: 1.5rem; font-size: 1.25rem; overflow-wrap: break-word;">
                                                <asp:Label ID="LbkFoodsName" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                                <asp:HiddenField ID="hdnFoodID" Value='<%# Eval("FoodId") %>' runat="server" />
                                            </div>

                                            <div style="font-size: 20px; font-weight: 400; color: #1e90ff;">
                                                <asp:Label ID="LblStatu" runat="server" Text='<%# Eval("fStatus") %>'></asp:Label>
                                            </div>
                                            <hr />
                                            <div style="font-size: 18px; font-weight: 400; color: #2c3e50;">
                                                <asp:Label Text="Category: " runat="server" />
                                                <asp:Label ID="LblbCatory" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                            </div>

                                            <div style="font-size: 1.875rem; font-weight: 500; color: #ee4d2d;">
                                                <asp:Label Text="₱ " runat="server" />
                                                <asp:Label ID="LblPrice" runat="server" Text='<%# Eval("fprice") %>'></asp:Label>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <asp:TextBox ID="txtPrice" TextMode="Number" placeholder="Enter Quantity" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <div>
                                                        <small>
                                                            <asp:RequiredFieldValidator InitialValue="0" ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Please Enter Quantity" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                    <asp:LinkButton ID="LnkAddtoCart" CommandArgument='<%# Eval("FoodId") %>' CssClass="btn text-white" Style="background-color: #ee4d2d;" runat="server" OnClick="LnkAddtoCart_Click">
                                                        <i class="fa-solid fa-cart-shopping"></i>
                                                        Add to Cart
                                                    </asp:LinkButton>

                                                </div>
                                            </div>
                                            <div style="font-size: 18px; font-weight: 600; color: #2c3e50;">
                                                <asp:Label Text="Foods Details" runat="server" /><br />
                                                <asp:Label ID="LblFDesription" Style="font-size: 16px; font-weight: 400; color: #2c3e50;" runat="server" Text='<%# Eval("fDecription") %>'></asp:Label>
                                            </div>
                                            <br />
                                            <div class="row">

                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
    <br />
</asp:Content>
