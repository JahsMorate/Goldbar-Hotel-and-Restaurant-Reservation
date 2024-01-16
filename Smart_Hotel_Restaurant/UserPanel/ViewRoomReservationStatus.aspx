<%@ Page Title="Room Reservation" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="ViewRoomReservationStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.ViewRoomReservationStatus" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hndUserID" runat="server" />


    <div class="container pb-5">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div>
                    <span class=" text-dark">

                        <span style="font-weight: 600; font-size: 27px;">Room Reservation</span>

                    </span>
                    <hr style="height: 3px; width: 100%; background-position-x: -30px; background-size: 116px 3px; background-image: repeating-linear-gradient(45deg,#FF8C00,#FF8C00 33px,transparent 0,transparent 41px,#353b48 0,#353b48 74px,transparent 0,transparent 82px);" />
                </div>
            </div>

            <%--This is for the Repeater control--%>
            <asp:Repeater ID="RroomreservationStatus" runat="server">
                <ItemTemplate>
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
                                                                        <img src="<%# Utils.GetImageUrl( Eval("rimg01")) %>" style="max-height: 150px; max-width: 200px; min-width: 200px; min-height: 150px; border-radius: 12px;" class="img-fluid" />
                                                                    </center>
                                                                </div>
                                                                <div class="col-lg-9 col-md-12 col-sm-12">


                                                                    <%--this is the hidden filed of primary and foreign key--%>
                                                                    <asp:HiddenField ID="hdnUserID" Value='<%# Eval("userID_fk") %>' runat="server" />
                                                                    <asp:HiddenField ID="hndRRID" Value='<%# Eval("roomID_fk") %>' runat="server" />
                                                                    <asp:HiddenField ID="hdnUserRRID" Value='<%# Eval("userID_fk") %>' runat="server" />
                                                                    <%--this is the hidden filed of primary and foreign key--%>

                                                                    <span style="font-weight: 600; font-size: 30px; color: #fd7e14;"><%# Eval("rrFname") %> <span style="font-weight: 400; font-size: 16px;" class="text-primary">Table No.: <%# Eval("rrnumber") %> 
                                                                    </span>
                                                                    </span>
                                                                    <div>
                                                                        <span style="font-weight: 500; font-size: 20px; color: #2ecc71">
                                                                            <asp:Label ID="lblDateOfConfirm" Text='<%# Convert.ToDateTime( Eval("roomDate")).ToString("dddd, MMMM dd, yyyy h:mm tt") %>' runat="server" />
                                                                            <span style="font-weight: 400; font-size: 16px; color: #2f3640;">Date of CHECK-IN 
                                                                            </span>
                                                                        </span>
                                                                    </div>

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
                                                                                    <th class="text-secondary"><%# Eval("rrBed") %> <small><i class="fa-solid fa-bed text-muted"></i></small></th>
                                                                                    <td><%# Eval("rrCompability") %> <small><i class="fa-solid fa-users text-muted"></i></small></td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblPricePerHour" Text='<%# Eval("rrPrice", "{0:N2}") %>' runat="server" />/per hour</td>
                                                                                    <td><%# Eval("rrFloor") %> <small><i class="fa-solid fa-stairs text-muted"></i></small></td>
                                                                                    <td><%# Eval("rrBathroom") %> <small><i class="fa-solid fa-bath text-muted"></i></small></td>
                                                                                    <td>Free wifi <small><i class="fa-solid fa-wifi text-muted"></i></small></td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblStatus" Text='<%# Eval("rrStatus") %>' CssClass="text-warning" runat="server" />
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                                            <div>
                                                                                <asp:LinkButton ID="lnkCheckOut" CommandArgument='<%# Eval("userID_fk") %>' Visible="false" CssClass="btn btn-primary" runat="server" OnClick="lnkCheckOut_Click">
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
                                                                        <p><%# Eval("rrDescription") %></p>
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
                </ItemTemplate>
            </asp:Repeater>
            <%--This is for the Repeater control--%>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <center>
                        <div>
                            <center>
                                <asp:LinkButton ID="LnkNoReservation" CssClass="text-secondary nav-link" Enabled="false" Visible="false" runat="server">
                          <div>
                    <br /><br />
                    <center>
                        <h1> <span class="tex-secondary" style="font-weight: 500;">No Reservation History</span></h1>
                    </center>
                    <br /><br />
                         </div>
                                </asp:LinkButton>
                            </center>
                        </div>
                    </center>
                </div>
            </div>
        </div>

    </div>
    <br />
    <br />
</asp:Content>
