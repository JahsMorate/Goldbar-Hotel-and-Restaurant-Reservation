<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="RoomReservationPreview.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.RoomReservationPreview" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--This is for the user ID--%>
    <asp:HiddenField ID="HndUserID" runat="server" />
    <%--This is for the user ID--%>
    <asp:TextBox ID="txtEmail" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtfname" Visible="false" runat="server"></asp:TextBox>

    <div class="container mt-3">
        <div class="row p-2">
            <nav aria-label="breadcrumb" style="background-color: #ffff;">
                <ol class="breadcrumb" style="background-color: #ffff;">
                    <li class="breadcrumb-item">
                        <a href="HomeRoom.aspx" class="nav-link" style="color: #e67e22;">Table Reservation
                        </a>
                    </li>
                    <li class="breadcrumb-item active nav-link" aria-current="page">Table Reservation Decriptions</li>
                </ol>
            </nav>
        </div>
        
        <div class="row">
            <asp:Repeater ID="RPreveiwsTable" runat="server">
                <ItemTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card" style="border-radius: 19px;">
                            <div class="card-body p-0">
                                <div class="container-fluid">
                                    <div class="row">

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="container-fluid p-2">
                                                <div class="row">
                                                    <div class="col-lg-5 col-md-12 col-sm-12 p-0">
                                                        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                                            <div class="carousel-indicators">
                                                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                                            </div>
                                                            <div class="carousel-inner">
                                                                <div class="carousel-item active" data-bs-interval="10000">
                                                                    <asp:Image ID="firstImage" ImageUrl='<%# Utils.GetImageUrl( Eval("rimg01"))%>' Style="max-height: 350px; max-width: 450px; min-width: 450px; min-height: 350px; border-radius: 12px;" class="img-fluid" runat="server" />
                                                                </div>
                                                                <div class="carousel-item" data-bs-interval="2000">
                                                                    <img src="<%# Utils.GetImageUrl( Eval("rimg02"))  %>" style="max-height: 350px; max-width: 450px; min-width: 450px; min-height: 350px; border-radius: 12px;" class="img-fluid" />
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img src="<%# Utils.GetImageUrl( Eval("rimg03"))  %>" style="max-height: 350px; max-width: 450px; min-width: 450px; min-height: 350px; border-radius: 12px;" class="img-fluid" />
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
                                                    <div class="col-lg-7 col-md-12 col-sm-12">
                                                        <span style="font-weight: 600; font-size: 35px; color: #fd7e14;"><%# Eval("rrFname") %> <span style="font-weight: 400; font-size: 16px;" class="text-primary">Table No.:
                                                    <asp:Label ID="lblrrnumber" runat="server" Text='<%# Eval("rrnumber") %>'></asp:Label>
                                                        </span>
                                                        </span>
                                                        <div>
                                                            
                                                            <small>
                                                                 <asp:Label ID="lblSpinner" runat="server"></asp:Label>
                                                            </small>
                                                            <asp:Label ID="lblRRstatus" Text='<%# Eval("rrStatus") %>' runat="server" />
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

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr class="text-center">
                                                                        <th class="text-secondary">
                                                                            <%# Eval("rrBed") %>
                                                                            <small><i class="fa-solid fa-bed text-muted"></i></small>
                                                                            <asp:HiddenField ID="hndRRRID" Value='<%# Eval("RRId") %>' runat="server" />
                                                                        </th>
                                                                        <td>
                                                                            <asp:Label ID="lblCompability" class="text-secondary" runat="server" Text='<%# Eval("rrCompability") %>'></asp:Label><small><i class="fa-solid fa-users text-muted"></i></small></td>
                                                                        <td>
                                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("rrPrice","{0:N2}") %>'></asp:Label></td>
                                                                        <td><%# Eval("rrFloor") %> <small><i class="fa-solid fa-stairs text-muted"></i></small></td>
                                                                        <td><%# Eval("rrBathroom") %> <small><i class="fa-solid fa-bath text-muted"></i></small></td>
                                                                        <td>Free wifi <small><i class="fa-solid fa-wifi text-muted"></i></small></td>

                                                                    </tr>
                                                                </tbody>
                                                            </table>
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
                                                        <div class="row">
                                                            <div class="col-lg-5 col-md-7 col-sm-12">
                                                                <asp:LinkButton ID="LnkReserveTable" CommandArgument='<%# Eval("RRId") %>' CssClass="btn btn-primary" runat="server" OnClick="LnkReserveTable_Click">
                                                                     Request booking
                                                                </asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                        <br />

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
