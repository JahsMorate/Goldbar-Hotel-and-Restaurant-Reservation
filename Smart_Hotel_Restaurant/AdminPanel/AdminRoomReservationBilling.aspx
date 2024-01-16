<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeFile="AdminRoomReservationBilling.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.AdminRoomReservationBilling" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <span style="font-size: 25px; font-weight: bold;">Room Reservation Payment Form</span>
    <asp:Repeater ID="RRBilling" runat="server">
        <ItemTemplate>
            <div class="container-fluid mt-5">

                <div class="row">
                    <div class="col-lg-8 col-md-7 col-sm-12">
                        <div class="card" style="border-radius: 19px;">
                            <div class="card-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <center>
                                            <div>
                                                <span style="font-weight: 600; font-size: 20px;">Room Reservation Summary </span>
                                            </div>
                                        </center>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="card" style="border-radius: 9px;">
                                                <div class="card-body p-1">
                                                    <div class="container-fluid p-1">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-12 col-sm-12">
                                                                <center>
                                                                    <img src="<%# Utils.GetImageUrl(Eval("rimg01")) %>" style="max-height: 150px; max-width: 200px; min-width: 200px; min-height: 150px; border-radius: 12px;" class="img-fluid" />
                                                                </center>

                                                            </div>
                                                            <div class="col-lg-9 col-md-12 col-sm-12">

                                                                <span style="font-weight: 600; font-size: 25px; color: #fd7e14;"> <%# Eval("rrFname") %> <span style="font-weight: 400; font-size: 16px;" class="text-primary">Table No.: <%# Eval("rrnumber") %>
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
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr class="text-center">
                                                                                <th class="text-secondary"><%# Eval("rrBed") %> <small><i class="fa-solid fa-bed text-muted"></i></small></th>
                                                                                <td><%# Eval("rrCompability") %><small><i class="fa-solid fa-users text-muted"></i></small></td>
                                                                                <td>
                                                                                    <asp:Label ID="lblPrice" Text='<%# Eval("rrPrice") %>' runat="server" />/Per Night</td>
                                                                                <td><small><i class="fa-solid fa-stairs text-muted"></i></small></td>
                                                                                <td><%# Eval("rrFloor") %> <small><i class="fa-solid fa-bath text-muted"></i></small></td>
                                                                                <td>Free wifi <small><i class="fa-solid fa-wifi text-muted"></i></small></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="col-lg-12 col-md-12 col-sm-12 pt-2">
                                                                <span style="font-weight: 400; font-size: 20px;">Room Descriptions: </span>
                                                                <br />
                                                                <div>
                                                                    <p><%# Eval("rrDescription") %> </p>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                                            <span style="font-weight: 400; font-size: 18px;">Payment  </span>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                    <div class="card" style="border-radius: 19px;">
                                                        <div class="card-body">
                                                            <span class="text-muted"><small>CHECK-IN</small></span>
                                                            <br />

                                                            <span class="text-dark" style="font-weight: 500;"><%# Convert.ToDateTime(Eval("roomDate")).ToString("ddd, MMMM dd, yyyy") %> </span>
                                                            <div>
                                                                <span class="text-dark" style="font-weight: 400;"><small>From <%# Convert.ToDateTime(Eval("roomDate")).ToString("h:mmtt") %></small></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                    <div class="card" style="border-radius: 19px;">
                                                        <div class="card-body">
                                                            <span class="text-muted"><small>CHECK-OUT</small></span>
                                                            <br />

                                                            <span class="text-dark" style="font-weight: 500;"><%# Convert.ToDateTime(Eval("RRCheckOut")).ToString("ddd, MMMM dd, yyyy") %></span>
                                                            <div>
                                                                <span class="text-dark" style="font-weight: 400;"><small>To <%# Convert.ToDateTime(Eval("RRCheckOut")).ToString("h:mmtt") %></small></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <br />
                                            <div class="row">

                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="card" style="border-radius: 19px;">
                                                        <div class="card-body">
                                                            <div class="container-fluid">
                                                                <div class=" table-responsive">
                                                                    <table class="table table-borderless table-responsive">
                                                                        <thead class="text-muted text-center">
                                                                            <tr>
                                                                                <th scope="col">Name</th>
                                                                                <th scope="col">Table No.</th>
                                                                                <th scope="col">Price</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr class="text-center">

                                                                                <td><%# Eval("rrFname") %></td>
                                                                                <td><%# Eval("rrnumber") %></td>
                                                                                <td>
                                                                                    <asp:Label ID="lblPrices" Text='<%# Eval("rrPrice") %>' runat="server" />/Per Night</td>
                                                                             
                                                                              
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <asp:HiddenField ID="hndRRUID" Value='<%# Eval("userID_fk") %>' runat="server" />
                                                            <asp:HiddenField ID="hndRR" Value='<%# Eval("roomID_fk") %>' runat="server" />
                                                            <div class="bx-pull-right">
                                                                <asp:LinkButton ID="lnkConfirm" CommandArgument='<%# Eval("userID_fk") %>' CssClass="btn btn-primary" runat="server" OnClientClick="return confirm('Are you sure do you want to Confirm?')" OnClick="lnkConfirm_Click"><i class="fa-solid fa-check"></i> Confirm</asp:LinkButton>
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

                    <div class="col-lg-4 col-md-5 col-sm-12">
                        <div class="card" style="border-radius: 19px;">
                            <div class="card-body">
                                <div class="container-fluid">
                                    <div class="row">
                                       
                                        <div>
                                            <center>
                                                <span style="font-weight: 600; font-size: 25px;" class="text-primary"><%# Eval("fname") %> <%# Eval("mi") %> <%# Eval("lname") %></span>
                                            </center>
                                        </div>
                                        <div>
                                            <span class="text-muted"><small><b>Customer Information</b></small></span>
                                        </div>

                                        <div class="col-lg-12 col-md-6 col-sm-12">
                                            <b>
                                                <asp:Label Text="Email: " runat="server" /></b>

                                         
                                                <asp:Label ID="lblUserEmail" Text='<%# Eval("email") %>' runat="server" />
                                        </div>
                                        <div class="col-lg-12 col-md-6 col-sm-12">
                                            <b>
                                                <asp:Label Text="Gcash No.: " runat="server" /></b>

                                            <asp:Label Text='<%# Eval("gnumber") %>' runat="server" />

                                        </div>
                                        <div class="col-lg-12 col-md-6 col-sm-12">
                                            <b>
                                                <asp:Label Text="Contact No.: " runat="server" /></b>

                                            <asp:Label Text='<%# Eval("number") %>' runat="server" />

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
    <div>
        <center>
            <asp:LinkButton ID="CheckOut" CssClass="text-secondary" runat="server">
                <center>
                    <h1>
                        <b>This is to inform you that your check-in process is currently underway.</b>
                    </h1>
                </center>
            </asp:LinkButton>
        </center>
    </div>
    <br />
    <br />
</asp:Content>
