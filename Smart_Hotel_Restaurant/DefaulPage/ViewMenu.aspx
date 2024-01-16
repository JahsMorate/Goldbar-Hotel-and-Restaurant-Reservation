<%@ Page Title="" Language="C#" MasterPageFile="~/DefaulPage/Default.Master" AutoEventWireup="true" CodeBehind="ViewMenu.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.ViewMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/DefaultPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid img-fluid" style="background-image: url('../DesignImages/smartMain01.jpg'); width: 100%; height: 100%; background-size: cover; background-repeat: no-repeat; background-position: center;">
        <br />
        <br />
        <br />
        <div class="container mt-1 mb-3 menu-s0" style="padding-top: 5%; padding-bottom: 5%;">
            <center>
                <div style="padding-top: 2px;">
                    <span style="font-weight: 700; color: white; font-size: 30px;">
                        <asp:Label Text="Our Services" runat="server" />
                    </span>
                </div>
                <div>
                    <p>
                        <span style="font-weight: 400; color: white; font-size: 20px;">"We offer both Dine-in and Take-out options for your orders, as well as table and hotel room reservations for your convenience."
                        </span>
                    </p>

                </div>
            </center>
            <div class="row ">

                <div class="col-lg-4 col-md-4 col-sm-12 mb-3 hover-card">
                    <a href="DefaultPageFoodsAndDrinks.aspx" style="text-decoration: none;" class="text-secondary ss">

                        <div class="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                            <img src="../DesignImages/MenuService/TableService.jpg" class="card-img-top" height="285" style="border-top-left-radius: 15px; border-top-right-radius: 15px;" />
                            <div class="card-body" style="background-color: #353b48f5;">
                                <div class="container-fluid">
                                    <div class="row p-0">
                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                            <span style="color: white; font-weight: 400; font-size: 20px;">
                                                <asp:Label Text="Foods and Drinks" runat="server" />
                                            </span>
                                        </div>
                                        <div style="text-decoration: none;" class=" text-white-50">
                                            <p>
                                                <span style="font-size: 16px; text-align: justify;">Offering both dine-in and take-out options allows customers the flexibility to enjoy their food and drinks in the way that best suits them.
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 ">
                    <a href="TableReservation.aspx" style="text-decoration: none;" class="text-secondary">

                        <div class="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                            <img src="../DesignImages/MenuService/TablReservation.jpg" class="card-img-top " height="285" style="border-top-left-radius: 15px; border-top-right-radius: 15px;" />
                            <div class="card-body" style="background-color: #353b48f5;">
                                <div class="container-fluid">
                                    <div class="row p-0">
                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                            <span style="color: white; font-weight: 400; font-size: 20px;">
                                                <asp:Label Text="Table Reservation" runat="server" />
                                            </span>
                                        </div>
                                        <div style="text-decoration: none;" class=" text-white-50">
                                            <p>
                                                <span style="font-size: 16px; text-align: justify;">Offering online table reservation can make the dining experience more convenient and efficient for customers, This can help them plan their dining experience in advance.
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 ">
                    <a href="UserRoomReservation.aspx" style="text-decoration: none;" class="text-secondary">
                        <div class="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                            <img src="../DesignImages/MenuService/RoomReservation.jpg" class="card-img-top" height="285" style="border-top-left-radius: 15px; border-top-right-radius: 15px;" />
                            <div class="card-body" style="background-color: #353b48f5;">
                                <div class="container-fluid">
                                    <div class="row p-0">
                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                            <span style="color: white; font-weight: 400; font-size: 20px;">
                                                <asp:Label Text="Room Reservation" runat="server" />
                                            </span>
                                        </div>
                                        <div style="text-decoration: none;" class=" text-white-50">
                                            <p>
                                                <span style="font-size: 16px; text-align: justify;">Offering online room reservation for tourists can make their stay more convenient and enjoyable. With the ability to reserve rooms online.
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>


</asp:Content>
