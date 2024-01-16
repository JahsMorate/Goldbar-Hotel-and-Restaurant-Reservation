<%@ Page Title="" Language="C#" MasterPageFile="~/DefaulPage/Default.Master" AutoEventWireup="true" CodeBehind="DefaultPageFoodsAndDrinks.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.DefaultPageFoodsAndDrinks" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/BigHover.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid img-fluid" style="background-color: white;">

        <div class="container mt-2 mb-3">
            <div>
                <center>
                    <span style="font-weight: 700; font-size: 45px;" class="text-secondary">Foods and Drinks
                    </span>
                </center>
            </div>
            <div>
                <ul class="nav justify-content-center mt-3 mb-3 " style="color: white; font-size: 20px;">
                    <li class="nav-item">
                        <a href="ViewMenu.aspx" class="text-secondary pl-3 pr-3 nav-link">

                            <i class="fa-solid fa-arrow-left"></i>

                        </a>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkAll" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkAll_Click">
                      All
                        </asp:LinkButton>
                    </li>

                    <li class="nav-item">
                        <asp:LinkButton ID="LnkBeverage" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkBeverage_Click">
                    Beverage
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkBreakfast" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkBreakfast_Click">
                     Breakfast
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkLunch" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkLunch_Click">
    
                     Lunch
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkDinner" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkDinner_Click">
    
                     Dinner
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkFastFoods" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkFastFoods_Click">
    
                    Fast foods
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="Lnk" Visible="false" Style="font-size: 15px;" OnClick="Lnk_Click" class="nav-link text-secondary pl-3 pr-3" runat="server">
                    Dessert
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="lnkRegular" Style="font-size: 15px;" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="lnkRegular_Click">
    
                     Regular
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LnkBestSeller" Style="font-size: 15px;" OnClick="LnkBestSeller_Click" class="nav-link text-secondary pl-3 pr-3" runat="server">
                         Best Seller
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item">
                        <div class="input-group">

                            <asp:TextBox ID="TxtSearch" CssClass="form-control" Style="border-radius: 20px;" placeholder="Search here" runat="server"></asp:TextBox>
                            <asp:LinkButton class=" btn ml-2" ID="lnkSearch" runat="server" Style="color: white; background-color: #fd7e14; border-radius: 20px;" OnClick="lnkSearch_Click">
                           <i class="fa-solid fa-magnifying-glass"></i>
                            </asp:LinkButton>
                        </div>
                    </li>
                </ul>
            </div>
            <hr />

            <div class="row">

                <asp:Repeater ID="RFoods" Visible="true" runat="server">
                    <ItemTemplate>

                        <div class="col-lg-3 col-md-6 col-sm-12 pb-4" id="AttachmenFilesHover">
                            <a style="text-decoration: none;" data-toggle="modal" data-target="#exampleModal" class="text-secondary">
                                <div class="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                                    <img src="<%# Utils.GetImageUrl( Eval("fimg02"))  %>" class="card-img-top img-fluid" style="border-top-left-radius: 15px; border-top-right-radius: 15px; max-height: 190px;" />
                                    <div class="card-body" style="background-color: #353b48f5; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
                                        <div class="container-fluid pr-0 pl-0">
                                            <div class="row">
                                                <div class="col-lg-6 col-sm-6 col-md-6">
                                                    <span style="font-size: 15px; font-weight: 400;">
                                                        <asp:Label ID="LblStatus" CssClass="text-primary" runat="server" Text='<%# Eval("fStatus") %>'></asp:Label>
                                                    </span>
                                                </div>
                                                <div class="col-lg-6 col-sm-6 col-md-6">
                                                    <span style="font-size: 15px; font-weight: 400;">

                                                        <asp:Label ID="LblCategory" CssClass="text-white-50" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                                    </span>
                                                </div>

                                            </div>
                                            <div>

                                                <span style="font-size: 20px; font-weight: 500;">
                                                    <asp:Label ID="LblFoodsNames" CssClass="text-white" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                                </span>
                                            </div>

                                            <div>
                                                <span style="font-size: 23px; font-weight: 400; color: #fa983a;">₱<span>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fprice","{0:N2}") %>'></asp:Label>
                                                </span></span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <center>
                    <div>

                        <asp:LinkButton ID="LnkNoSearchFound" Visible="false" CssClass="nav-link" runat="server">
                       
                        <br /><br /><br />
                        <center>
                            <h1><span class="text-secondary">No search found</span></h1>
                        </center>
                         <br /><br />
                         <br />
                        </asp:LinkButton>

                    </div>
                </center>
            </div>
        </div>
    </div>


</asp:Content>
