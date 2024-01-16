<%@ Page Title="Table Reservation" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="ViewTableReservationStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.ViewTableReservationStatus" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pb-5">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div>
                    <span style="color: #ee4d2d;">
                        <i class="fa-solid fa-utensils pr-3 fa-2x"></i>
                        <span style="font-weight: 600; font-size: 27px;">Foods & Drinks</span>
                        <span style="margin-left: 0.9375rem; border-left: 0.0625rem solid #ee4d2d; color: #ee4d2d; font-size: 1.25rem; line-height: 1.875rem; height: 1.875rem; padding-left: 0.9375rem; margin-bottom: 0.0625rem; text-transform: capitalize;">Order Status</span>
                    </span>
                    <hr style="height: 3px; width: 100%; background-position-x: -30px; background-size: 116px 3px; background-image: repeating-linear-gradient(45deg,#6fa6d6,#6fa6d6 33px,transparent 0,transparent 41px,#f18d9b 0,#f18d9b 74px,transparent 0,transparent 82px);" />
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card p-2" style="border-radius: 19px;">
                    <div class="card-body p-1">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="container-fluid">
                                        <div class="row">

                                            <div class="col-lg-12 col-md-12 col-sm-12 p-0">

                                                <div class="container-fluid p-1">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-12 col-sm-12">
                                                            <center>
                                                                <img src="../Images/FoodImage/theCorner-HD-19.jpg" style="max-height: 150px; max-width: 200px; min-width: 200px; min-height: 150px; border-radius: 12px;" class="img-fluid" />
                                                            </center>

                                                        </div>
                                                        <div class="col-lg-9 col-md-12 col-sm-12">

                                                            <span style="font-weight: 600; font-size: 25px; color: #fd7e14;">Family size <span style="font-weight: 400; font-size: 16px;" class="text-primary">Table No.: 30
                                                            </span>
                                                            </span>

                                                            <div class=" table-responsive">
                                                                <table class="table table-borderless table-responsive">
                                                                    <thead class="text-muted text-center">
                                                                        <tr>
                                                                            <th scope="col">Bed</th>
                                                                            <th scope="col">Guest</th>
                                                                            <th scope="col">Price</th>
                                                                            <th scope="col">Floor</th>
                                                                            <th scope="col">Bathroom</th>
                                                                            <th scope="col">Connection</th>
                                                                            <th scope="col">Availability</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr class="text-center">
                                                                            <th class="text-secondary">2 <small><i class="fa-solid fa-bed text-muted"></i></small></th>
                                                                            <td>3 <small><i class="fa-solid fa-users text-muted"></i></small></td>
                                                                            <td>100.00/per hour</td>
                                                                            <td>3 <small><i class="fa-solid fa-stairs text-muted"></i></small></td>
                                                                            <td>2 <small><i class="fa-solid fa-bath text-muted"></i></small></td>
                                                                            <td>Free wifi <small><i class="fa-solid fa-wifi text-muted"></i></small></td>
                                                                            <td>
                                                                                <asp:Label Text="Pending" CssClass="text-warning" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <div>
                                                                        <asp:LinkButton ID="lnkCheckOut" CssClass="btn btn-primary" runat="server">
                                                                            CHECK-OUT
                                                                        </asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 pt-2">
                                                            <span style="font-weight: 400; font-size: 20px;">Room Descriptions: </span>
                                                            <br />
                                                            <div>
                                                                <p>This is Room is good for the family and this is flexible</p>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />

</asp:Content>
