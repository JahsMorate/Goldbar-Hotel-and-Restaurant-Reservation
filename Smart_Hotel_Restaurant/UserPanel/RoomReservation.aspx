<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="RoomReservation.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.RoomReservation" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../CSS/BigHover.css" rel="stylesheet" />
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
            <asp:LinkButton ID="LNkResrvation" class="nav-link" Style="color: black; font-size: 15px;" OnClick="LNkResrvation_Click" runat="server">

               <center>
                    <img src="../DesignImages/Icon/bedroom.png" width="60" /><br />
                   <span> Room Reservation</span>
               </center>
            </asp:LinkButton>
        </li>

        <li class="nav-item">
            <asp:LinkButton ID="LnkFoods" class="nav-link" Style="color: black; font-size: 15px;" OnClick="LnkFoods_Click" runat="server">
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
                    <asp:LinkButton ID="LnkALl" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkALl_Click">
                      All
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="Lnk1stFloor" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="Lnk1stFloor_Click">
    
                   1 Floor
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="Lnk2ndFloor" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="Lnk2ndFloor_Click">
    
                   2 Floors
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="Lnk3rdFloor" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="Lnk3rdFloor_Click">
    
                   3 Floors
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkOnePersonssss" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkOnePersonssss_Click">
    
                   1 Person
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkTwoPersonss" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkTwoPersonss_Click">
    
                    2 persons
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkFourPersonss" class="text-secondary pl-3 pr-3 nav-link" runat="server" OnClick="LnkFourPersonss_Click">
    
                     4 persons
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkSixPersonsss" class="nav-link text-secondary pl-3 pr-3" runat="server" OnClick="LnkSixPersonsss_Click">
                    6 persons
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
                        <a style="text-decoration: none;" href="RoomReservationPreview.aspx?RRI=<%# Eval("RRId") %>" class="text-secondary">
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
                                            <span class="text-white">/Per Nigth</span>

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
