<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="FoodOrderStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.FoodOrderStatus" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--This is the primary key of USER--%>
    <asp:HiddenField ID="hndUserID" runat="server" />
    <%--This is the primary key of USER--%>

    <div class="container pt-lg-5 pb-5">
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
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">


                                    <div class="row">

                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">

                                            <div class="table table-responsive">
                                                <table class="table table-stripped">
                                                    <thead>
                                                        <tr class="text-centery text-white" style="background-color: #fd7e14;">

                                                            <th scope="col" class="text-centery">
                                                                <center>Mode</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Date Purchase</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Amount Paid</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Food Status</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Details</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Stats</center>
                                                            </th>
                                                           
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="ROrderStatusUser" runat="server">
                                                            <ItemTemplate>
                                                                <tr class="text-center">

                                                                    <td><%# Eval("orderStatus") %></td>
                                                                    <td><%# Convert.ToDateTime(Eval("orderDate")).ToString("F") %></td>
                                                                    <td>
                                                                        <span style="color: #fd7e14; font-weight: 600;">₱
                                                                            <%# Eval("txtAmount", "{0:N2}") %>
                                                                        </span>
                                                                    </td>
                                                                    <th>
                                                                        <small></small>

                                                                        <asp:Label ID="lblStatus" Text='<%# Eval("approval") %>' CssClass="text-warning" runat="server" /></th>
                                                                    <td>
                                                                        <a href="ViewCartStatus.aspx?datePurchase=<%# Eval("orderDate") %>">View Details</a>
                                                                    </td>
                                                                    <td><small>
                                                                        <asp:Label ID="lblSpinner" Visible="true" runat="server"></asp:Label>
                                                                    </small></td>
                                                                    
                                                                        <span style="color: #fd7e14; font-weight: 600;">
                                                                            <asp:LinkButton ID="lnkClearMessage" Visible="false" runat="server">Clear Message</asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkPending" Visible="false" runat="server">Pending</asp:LinkButton>
                                                                        </span>
                                                                  
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                    <%-- if waray mo tunga na orders --%>
                                    <center>
                                        <div>

                                            <asp:LinkButton ID="LnkOrderFoodStatus" Visible="false" CssClass="nav-link" Enabled="false" runat="server">
                                                <br />
                                                <center>
                                                    <div>
                                                      <h1 class="nav-link text-secondary"> NO ORDERS FOUND</h1> 
                                                </div>
                                                    <div>
                                                        <img src="../DesignImages/NoOrdersFOudn.png" />
                                                    </div>
                                                </center>
                                                <br />
                                            </asp:LinkButton>

                                        </div>
                                    </center>
                                    <%-- if waray mo tunga na orders --%>
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
