<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoomReservation.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.RoomReservation" Async="true" %>
<%@ Import Namespace="Smart_Hotel_Restaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <span style="font-size: 25px; font-weight: bold;">Room Reservation Form</span>
    <div class="container-fluid mt-5">
        <div class="row">

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">

                                    <img src="../DesignImages/MenuService/available.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-success" style="text-align: right;">Available</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-success">22
                                                    </span>
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

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/Pending.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-warning" style="text-align: right;">Pending</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-warning">22
                                                    </span>
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

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/occupied.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-primary" style="text-align: right;">Occupied</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-primary">22
                                                    </span>
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

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/TableArea.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Total Table</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-secondary">22
                                                    </span>
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

        <br />
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="input-group">
                <asp:TextBox ID="TxtSearch" CssClass="form-control" Style="border-radius: 20px;" placeholder="Search here" runat="server"></asp:TextBox>
                <asp:LinkButton class=" btn ml-3" ID="lnkSearch" runat="server" Style="color: white; background-color: #fd7e14; border-radius: 20px;" >
                           <i class="fa-solid fa-magnifying-glass"></i>
                </asp:LinkButton>
            </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card" style="border-radius: 10px;">
                    <div class="card-body">
                        <div class="container-fluid p-1">
                            <div class="row p-0">
                                <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                    Here you write the table
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
