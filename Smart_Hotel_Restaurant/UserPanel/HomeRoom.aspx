<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="HomeRoom.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.HomeRoom" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/BigHover.css" rel="stylesheet" />

    <script type="text/javascript">
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="nav justify-content-center mt-3 mb-3 " style="color: black; font-size: 15px;">

        <asp:HiddenField ID="hndUserID" runat="server" />
        <li class="nav-item">
            <asp:LinkButton ID="LnkTable" class="nav-link" Style="color: black; font-size: 15px;" OnClick="LnkTable_Click" runat="server">
                <center>
                    <img src="../DesignImages/Icon/fine-dining.png" width="60" /><br />
                    <span>Table Reservation</span>
                </center>
               
            </asp:LinkButton>
        </li>

        <li class="nav-item">
            <asp:LinkButton ID="LnkRoomReservation" OnClick="LnkRoomReservation_Click" class="nav-link" Style="color: black; font-size: 15px;" runat="server">

               <center>
                    <img src="../DesignImages/Icon/bedroom.png" width="60" /><br />
                   <span> Room Reservation</span>
               </center>
            </asp:LinkButton>
        </li>

        <li class="nav-item">
            <asp:LinkButton ID="lnkFoodAndDrinks" class="nav-link" Style="color: black; font-size: 15px;" OnClick="lnkFoodAndDrinks_Click" runat="server">
                <center>
                    <img src="../DesignImages/Icon/grocery.png" width="60" /><br />
                    <span>Foods and Drinks</span>
                </center>
            </asp:LinkButton>
        </li>

    </ul>

    <%-- this is the dynamic--%>
    <div class="container">
        <div>

            <ul class="nav justify-content-center mt-3 mb-3 " style="color: black; font-size: 15px;">

                <asp:HiddenField ID="HiddenField1" runat="server" />


                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton7" class="text-secondary pl-3 pr-3 nav-link" OnClick="LinkButton7_Click" runat="server">
                      All
                    </asp:LinkButton>
                </li>

                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton8" OnClick="LinkButton8_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
                    Beverage
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton9" OnClick="LinkButton9_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
                     Breakfast
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton10" OnClick="LinkButton10_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
    
                     Lunch
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
    
                     Dinner
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton3" OnClick="LinkButton3_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
    
                    Fast foods
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkDessert" Visible="false" OnClick="LnkDessert_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
    
                     Dessert
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkRegular" OnClick="lnkRegular_Click" class="text-secondary pl-3 pr-3 nav-link" runat="server">
    
                     Regular
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkBestSeller" OnClick="LnkBestSeller_Click" class="nav-link text-secondary pl-3 pr-3" runat="server">
                     Best Seller
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <div class="input-group">

                        <asp:TextBox ID="TxtSearch" CssClass="form-control" Style="border-radius: 20px;" placeholder="Search here" runat="server"></asp:TextBox>
                        <asp:LinkButton class=" btn ml-2" OnClick="lnkSearch_Click" ID="lnkSearch" runat="server" Style="color: white; background-color: #fd7e14; border-radius: 20px;">
                           <i class="fa-solid fa-magnifying-glass"></i>
                        </asp:LinkButton>
                    </div>
                </li>
            </ul>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-12">
            </div>

        </div>
        <div class="row">

            <asp:Repeater ID="RFoods" runat="server">
                <ItemTemplate>

                    <div class="col-lg-3 col-md-6 col-sm-12 pb-4 " id="AttachmenFilesHover">
                        <a style="text-decoration: none;" href="Previews.aspx?FoodID=<%# Eval("FoodId") %>" class="text-secondary">
                            <div class="card bg-dark" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                                <img src="<%# Utils.GetImageUrl( Eval("fimg01"))  %>" class="card-img-top img-fluid" style="border-top-left-radius: 15px; border-top-right-radius: 15px; max-height: 190px;" />
                                <div class="card-body">
                                    <div class="container-fluid pr-0 pl-0">
                                        <div class="row">
                                            <div class="col-lg-6 col-sm-6 col-md-6">

                                                <span style="font-size: 15px; font-weight: 400; color: #f1c40f;">
                                                    <asp:LinkButton ID="LinkStart" Visible="false" runat="server">
                                                        <span style="color: #f1c40f; font-size: 13px;">
                                                            <small>
                                                                <i class="fa-solid fa-star"></i>
                                                                <i class="fa-solid fa-star"></i>
                                                                <i class="fa-solid fa-star"></i>
                                                                <i class="fa-solid fa-star"></i>
                                                                <i class="fa-solid fa-star"></i>
                                                            </small>
                                                        </spa>
                                                    </asp:LinkButton>
                                                    <asp:Label ID="LblStatus" Visible="true" runat="server" Text='<%# Eval("fStatus") %>'></asp:Label>
                                                </span>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-md-6">
                                                <span style="font-size: 15px; font-weight: 400; color: #007bff;">

                                                    <asp:Label ID="LblCategory" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                                </span>
                                            </div>

                                        </div>
                                        <div>

                                            <span style="font-size: 20px; font-weight: 500; color: white;">
                                                <asp:Label ID="LblFoodsNames" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                            </span>
                                        </div>


                                        <div>
                                            <span style="font-size: 23px; font-weight: 600; color: #fa983a;">₱<span>
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
    <br />
</asp:Content>
