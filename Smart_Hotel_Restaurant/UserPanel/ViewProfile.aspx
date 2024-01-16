<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.ViewProfile" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hndUserID" runat="server" />

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
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
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container">
                            <div class="row p-0">

                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <a href="FoodOrderStatus.aspx">
                                        <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                            <div class="card-body">
                                                <div class="container-fluid">
                                                    <div class="row p-0">
                                                        <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                            <span class="bg-warning" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                                <i class="fa-solid fa-cart-shopping"></i>
                                                            </span>

                                                            <div class=" mt-3 fa-pull-right">

                                                                <span class="text-secondary" style="text-align: right;">Food Order Status</span>
                                                                <h4>
                                                                    <center>
                                                                        <center>
                                                                            <asp:Repeater ID="R_FoodOrderStatus" runat="server">
                                                                                <ItemTemplate>
                                                                                    <span style="font-size: 30px;">
                                                                                        <%# Eval("TotalOrder") %>
                                                                                    </span>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
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
                                    </a>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <a href="ViewRoomReservationStatus.aspx">

                                        <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                            <div class="card-body">
                                                <div class="container-fluid">
                                                    <div class="row p-0">
                                                        <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                            <span class="bg-primary" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                                <i class="fa-solid fa-bed"></i>
                                                            </span>

                                                            <div class=" mt-3 fa-pull-right">

                                                                <span class="text-secondary" style="text-align: right;">Room Reservation Status</span>

                                                                <h4>
                                                                    <center>
                                                                        <center>
                                                                            <span style="font-size: 30px;">
                                                                                <asp:Repeater ID="RoomStatus" runat="server">
                                                                                    <ItemTemplate><%# Eval("roomStatus") %></ItemTemplate>
                                                                                </asp:Repeater>
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

                                    </a>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-12 pt-2 pb-2">
                                    <a href="TableReservationStatus.aspx">
                                        <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                                        <div class="card-body">
                                            <div class="container-fluid">
                                                <div class="row p-0">
                                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                                        <span class="bg-success" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                                            <i class="fa-solid fa-table"></i>
                                                        </span>

                                                        <div class=" mt-3 fa-pull-right">

                                                            <span class="text-secondary" style="text-align: right;">Table Reservation Status</span>

                                                            <h4>
                                                                <center>
                                                                    <center>
                                                                        <span style="font-size: 30px;">
                                                                            <asp:Repeater ID="RTTReservationStats" runat="server">
                                                                                <ItemTemplate>
                                                                                    <%# Eval("TableStatus") %>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
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
                                    </a>
                                </div>

                            </div>

                            <span style="font-weight: bold; font-size: 25px; color: #34495e">
                                <center>
                                    <asp:Label Text="My Profile" runat="server" />
                                </center>
                            </span>
                            <hr style="border-bottom: 3px solid #d35400;" />
                            <div class="table table-responsive">
                                <asp:Repeater ID="RViewProfile" OnItemCommand="RViewProfile_ItemCommand" runat="server">
                                    <ItemTemplate>
                                        <div class="row">
                                           
                                            <div class=" col-md-9 col-lg-9 ">
                                                <div>
                                                    <span style="font-weight: bold; font-size: 25px; color: #d35400">

                                                        <asp:Label ID="lblFname" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                                                        <asp:Label ID="lblMI" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                                        <asp:Label ID="lblLname" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                        <asp:TextBox ID="TextBox1" Visible="false" Text='<%# Eval("fname") %>' runat="server"></asp:TextBox>
                                                    </span>
                                                </div>
                                                <table class="table table-user-information text-secondary">
                                                    <tbody>
                                                        <tr>
                                                            <td>Gender:</td>
                                                            <td>
                                                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                       
                                                     
                                                        <tr>
                                                            <td>Contact Number:</td>
                                                            <td>
                                                                <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("number") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Gcash Number:</td>
                                                            <td>
                                                                <asp:Label ID="lblGcash" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Email:</td>
                                                            <td><a href="mailto:<%# Eval("email") %>">
                                                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                            </a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Username:</td>
                                                            <td>
                                                                <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Password:</td>
                                                            <td>
                                                                <asp:Label ID="hndPassword" runat="server" Text='<%# Eval("passs") %>'></asp:Label>

                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
