<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="TalblePreview.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.TalblePreview" Async="true" %>

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
        <div class="row p-3">

            <asp:Repeater ID="RPreveiwsTable" runat="server">
                <ItemTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                        <div classs="card" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; background-color: white; border-radius: 14px;">
                            <div class="card-body p-0">
                                <div class="container-fluid p-0">
                                    <div class="row ">
                                        <div class="col-lg-6 col-md-6 col-sm-12 p-0">
                                            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                                <div class="carousel-indicators">
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>

                                                </div>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active" data-bs-interval="10000">
                                                        <asp:Image ID="firstImage" ImageUrl='<%# Utils.GetImageUrl( Eval("timage01"))%>' Style="max-width: 100%; max-height: 450px; min-width: 100%; min-height: 450px;" class=" img-fluid" runat="server" />
                                                    </div>
                                                    <div class="carousel-item" data-bs-interval="2000">
                                                        <img src="<%# Utils.GetImageUrl( Eval("timage02"))  %>" style="max-width: 100%; max-height: 450px; min-width: 100%; min-height: 450px;" class=" img-fluid" />
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img src="<%# Utils.GetImageUrl( Eval("timage02"))  %>" style="max-width: 100%; max-height: 450px; min-width: 100%; min-height: 450px;" class=" img-fluid" />
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
                                        <div class="col-lg-6 col-md-6 col-sm-12 bg-white">
                                            <br />
                                            <div style="font-size: 1.875rem; font-weight: 500; color: #fd7e14;">
                                                <asp:Label Text="Table Number " runat="server" />
                                                <asp:Label ID="lblTablNo" runat="server" Text='<%# Eval("table_No") %>'></asp:Label>
                                            </div>
                                            <div style="font-weight: 500; line-height: 1.5rem; font-size: 1.25rem; overflow-wrap: break-word;">
                                                <span class="text-secondary">Status: </span>

                                                <asp:Label ID="lblStaus" class="text-secondary" runat="server" Text='<%# Eval("table_status") %>'></asp:Label>
                                                <%--This is the tblID--%>
                                                <asp:HiddenField ID="hndTblID" Value='<%# Eval("TblId") %>' runat="server" />
                                                <%--This is the tblID--%>
                                            </div>
                                            <hr />
                                            <div style="font-size: 18px; font-weight: 400; color: #2c3e50;">
                                                <asp:Label class="text-secondary" Text="Area: " runat="server" />
                                                <asp:Label ID="lblArea" class="text-secondary" runat="server" Text='<%# Eval("table_area") %>'></asp:Label>
                                            </div>
                                            <div style="font-size: 18px; font-weight: 400; color: #2c3e50;">
                                                <asp:Label class="text-secondary" Text="Compability: " runat="server" />
                                                <asp:Label ID="lblType" class="text-secondary" runat="server" Text='<%# Eval("table_type") %>'></asp:Label>
                                            </div>
                                            <br />

                                            <div style="font-size: 18px; font-weight: 600; color: #2c3e50;">
                                                <asp:Label Text="Table Details" class="text-secondary" runat="server" /><br />
                                                <asp:Label ID="LblFDesription" class="text-secondary" Style="font-size: 16px; font-weight: 400; color: #2c3e50;" runat="server" Text='<%# Eval("table_desc") %>'></asp:Label>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-5 col-md-7 col-sm-12">
                                                    <asp:LinkButton ID="LnkReserveTable" CommandArgument='<%# Eval("TblId") %>' CssClass="btn btn-primary" OnClick="LnkReserveTable_Click" runat="server">
                                                       Reserve Now
                                                    </asp:LinkButton>
                                                </div>


                                            </div>


                                            <br />
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
