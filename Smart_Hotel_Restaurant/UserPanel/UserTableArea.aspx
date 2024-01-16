<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="UserTableArea.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.UserTableArea" Async="true" %>

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
            <asp:LinkButton ID="lnkRoomReservation" class="nav-link" Style="color: black; font-size: 15px;" OnClick="lnkRoomReservation_Click" runat="server">

               <center>
                    <img src="../DesignImages/Icon/bedroom.png" width="60" /><br />
                   <span> Room Reservation</span>
               </center>
            </asp:LinkButton>
        </li>

        <li class="nav-item">
            <asp:LinkButton ID="lnkVisayas" class="nav-link" Style="color: black; font-size: 15px;" OnClick="lnkVisayas_Click" runat="server">
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
                    <asp:LinkButton ID="LnkALl" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkALl_Click" runat="server">
                      All
                    </asp:LinkButton>
                </li>

                <li class="nav-item">
                    <asp:LinkButton ID="LnkLuzonsss" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkLuzonsss_Click"   runat="server">
                      Luzon
                    </asp:LinkButton>
                </li>

                <li class="nav-item">
                    <asp:LinkButton ID="LnkVisayasss" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkVisayasss_Click" runat="server">
                     Visayas
                    </asp:LinkButton>
                </li>

                <li class="nav-item">
                    <asp:LinkButton ID="LnkMindanaoss" class="text-secondary pl-3 pr-3 nav-link"  OnClick="LnkMindanaoss_Click"  runat="server">
    
                    Mindanao
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkOnePersonssss" Visible="false" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkOnePersonssss_Click" runat="server">
    
                   1 Person
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkTwoPersonss" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkTwoPersonss_Click" runat="server">
    
                    2 Persons
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkFourPersonss" class="text-secondary pl-3 pr-3 nav-link" OnClick="LnkFourPersonss_Click" runat="server">
    
                     4 Persons
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LnkSixPersonsss" class="nav-link text-secondary pl-3 pr-3" OnClick="LnkSixPersonsss_Click" runat="server">
                    6 Persons
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkFamilySize" class="nav-link text-secondary pl-3 pr-3" OnClick="lnkFamilySize_Click" runat="server">
                    Family Size
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
            <asp:Repeater ID="RTable" runat="server">
                <ItemTemplate>

                    <div class="col-lg-3 col-md-6 col-sm-12 pb-4 " id="AttachmenFilesHover">
                        <a style="text-decoration: none;" href="TalblePreview.aspx?TblID=<%# Eval("TblId") %>" class="text-secondary">
                            <div class="card bg-dark" style="box-shadow: rgba(17, 17, 26, 0.05) 0px 1px 0px, rgba(17, 17, 26, 0.1) 0px 0px 8px; border: none; border-radius: 15px;">
                                <img src="<%# Utils.GetImageUrl( Eval("timage01"))  %>" class="card-img-top img-fluid" style="border-top-left-radius: 15px; border-top-right-radius: 15px; max-height: 200px; min-height: 200px; max-width: 100%; min-width: 100%;" />
                                <div class="card-body">
                                    <div class="container-fluid pr-0 pl-0">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <small>
                                                    <asp:Label ID="lblSpinner" Visible="true" runat="server"></asp:Label></small>
                                                <asp:Label ID="lblStatus" Visible="true" runat="server" Text='<%# Eval("table_status") %>'></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-6 col-sm-6 col-md-6">

                                                <span style="font-size: 15px; font-weight: 400;" class="text-white">


                                                    <asp:Label ID="lblArea" Visible="true" runat="server" Text='<%# Eval("table_area") %>'></asp:Label>
                                                </span>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-md-6">
                                                <span style="font-size: 15px; font-weight: 400;" class="text-white">

                                                    <asp:Label ID="LblCategory" runat="server" Text='<%# Eval("table_type") %>'></asp:Label>
                                                </span>
                                            </div>

                                        </div>

                                        <div style="font-weight: 400; font-size: 18px; color: #fd7e14;">
                                            <asp:Label Text="Table Number" runat="server" />
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("table_No") %>'></asp:Label>

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
