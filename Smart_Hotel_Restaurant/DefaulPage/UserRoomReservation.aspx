<%@ Page Title="Room Reservation" Language="C#" MasterPageFile="~/DefaulPage/Default.Master" AutoEventWireup="true" CodeBehind="UserRoomReservation.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.UserRoomReservation" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/BigHover.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid img-fluid" style="background-color: white;">

        <div>

            <div class="container">
                <div>
                    <center>
                        <span style="font-weight: 700; font-size: 45px;" class="text-secondary">Room Reservation
                        </span>
                    </center>
                    <ul class="nav justify-content-center mt-3 mb-3 text-secondary" style="font-size: 20px;">


                        <li class="nav-item">
                            <a href="ViewMenu.aspx" class="text-secondary pl-3 pr-3 nav-link">

                                <i class="fa-solid fa-arrow-left"></i>

                            </a>
                        </li>

                        <li class="nav-item">
                            <asp:LinkButton ID="LnkALl" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" OnClick="LnkALl_Click" runat="server">
                      All
                            </asp:LinkButton>
                        </li>

                     <%--   <li class="nav-item">
                            <asp:LinkButton ID="Lnk1stFloor" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="Lnk1stFloor_Click">
                      1st Floor
                            </asp:LinkButton>
                        </li>--%>

                        <li class="nav-item">
                            <asp:LinkButton ID="Lnk2ndFloor" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="Lnk2ndFloor_Click">
                     2nd Floor
                            </asp:LinkButton>
                        </li>

                        <li class="nav-item">
                            <asp:LinkButton ID="Lnk3rdFloor" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="Lnk3rdFloor_Click">
    
                     3rd Floor
                            </asp:LinkButton>
                        </li>
                       <%-- <li class="nav-item">
                            <asp:LinkButton ID="LnkOnePersonssss" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="LnkOnePersonssss_Click">
    
                   1 Person
                            </asp:LinkButton>--%>
                     <%--   </li>--%>
                        <li class="nav-item">
                            <asp:LinkButton ID="LnkTwoPersonss" Visible="false" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="LnkTwoPersonss_Click">
    
                    2 Persons
                            </asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="LnkFourPersonss" Visible="false" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="LnkFourPersonss_Click">
    
                     4 Persons
                            </asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="LnkSixPersonsss" Visible="false" Style="font-size: 15px;" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="LnkSixPersonsss_Click">
                    6 Persons
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
                    <div class="col-lg-5 col-md-6 col-sm-12">
                    </div>

                </div>
                <div class="row">
                    <asp:Repeater ID="RRReservation" runat="server">
                        <ItemTemplate>

                            <div class="col-lg-3 col-md-6 col-sm-12 pb-4 " id="AttachmenFilesHover">
                                <a style="text-decoration: none;" data-toggle="modal" data-target="#exampleModal" class="text-secondary">
                                    <div class="card bg-dark" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                                        <img src="<%# Utils.GetImageUrl(Eval("rimg01")) %>" class="card-img-top img-fluid" style="border-top-left-radius: 15px; border-top-right-radius: 15px; max-height: 200px; min-height: 200px; max-width: 100%; min-width: 100%;" />
                                        <div class="card-body">
                                            <div class="container-fluid pr-0 pl-0">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <small>
                                                            <asp:Label ID="lblSpinner" Visible="true" runat="server"></asp:Label></small>
                                                        <asp:Label ID="lblStatus" Visible="true" runat="server" Text='<%# Eval("rrStatus") %>'></asp:Label>

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <asp:Label ID="lblName" Style="font-weight: 400; font-size: 20px; color: #fd7e14;" Visible="true" runat="server" Text='<%# Eval("rrFname") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-6 col-md-6">

                                                        <span style="font-size: 15px; font-weight: 400;" class="text-white">
                                                            <asp:Label Text="No.: " runat="server" />
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("rrnumber") %>'></asp:Label>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                                        <span style="font-size: 15px; font-weight: 400;" class="text-white">
                                                            <asp:Label ID="lblArea" Visible="true" runat="server" Text='<%# Eval("rrCompability") %>'></asp:Label>
                                                        </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div style="font-weight: 400; font-size: 18px; color: #ffff;">
                                                    ₱
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("rrPrice", "{0:N2}") %>'></asp:Label>
                                                    <span class="text-white">/Per Night</span>

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


    </div>




</asp:Content>
