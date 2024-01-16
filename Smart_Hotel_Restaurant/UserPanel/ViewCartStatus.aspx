<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="ViewCartStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.ViewCartStatus" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--This is the primary key of USER--%>
    <asp:HiddenField ID="hndUserID" runat="server" />
    <%--This is the primary key of USER--%>
    <br />
    <br />

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
                                                                <center>Img</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Food Name</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Category</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Description</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Qty</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Price</center>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="RAllOrderStatus" runat="server">
                                                            <ItemTemplate>
                                                                <tr class="text-center">
                                                                    <td>

                                                                        <img src="<%# Utils.GetImageUrl(Eval("foodImage")) %>" width="50" style="max-height: 50px; max-width: 50px;" class="img-fluid" />
                                                                    </td>
                                                                    <td>
                                                                        <span><%# Eval("foodName") %></span>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("fCategory") %>
                                                                    </td>
                                                                    <td>
                                                                        <small><%# Eval("fDecription") %></small>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("Crt_Qty", "{0:N2}") %>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Label ID="lblCartStatus" Text='<%# Eval("Crt_Status") %>' runat="server" />
                                                                        <span style="color: #fd7e14; font-weight: 500;">
                                                                            <%# Eval("Crt_TotalPrice", "{0:N2}") %>
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                                <div class=" fa-pull-right">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div>
                                                                <span style="font-weight: 500;">Payment Summary
                                                                </span>
                                                            </div>
                                                            <asp:Repeater ID="ROderSummary" runat="server">
                                                                <ItemTemplate>
                                                                    <div>
                                                                        <span>Total Price: <span style="color: #fd7e14; font-weight: 500;">₱  <%# Eval("bayadan", "{0:N2}") %> </span></span>
                                                                    </div>
                                                                    <div>
                                                                        <span>Amount Paid: <span style="color: #fd7e14; font-weight: 500;">₱  <%# Eval("gebaydan","{0:N2}") %> </span></span>
                                                                    </div>
                                                                    <div>
                                                                        <span>Remaining Balanced: <span style="color: #fd7e14; font-weight: 500;">₱  <%# Eval("customerBalanced", "{0:N2}") %> </span></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <center>
                                                <div>
                                                    <asp:LinkButton ID="lnkOrderSuccesfully" Enabled="false" CssClass="nav-link" Visible="false" runat="server">
                                                        <center>
                                                            <div>
                                                                <img src="../DesignImages/NoOrdersFOudn.png" />
                                                            </div>
                                                        </center>
                                                          <center>
                                                            <div>
                                                              <h4> <span class="text-success">
                                                                   You're order has been successfully approved
                                                               </span></h4>
                                                            </div>
                                                        </center>
                                                         <br /><br />
                                                    </asp:LinkButton>
                                                </div>
                                                <div>
                                                    <asp:LinkButton ID="lnkReturn" Enabled="false" CssClass="nav-link" Visible="false" runat="server">
                                                        <center>
                                                            <div>

                                                                <img src="../DesignImages/Ordercanel.png" />
                                                            </div>
                                                        </center>
                                                          <center>
                                                            <div>
                                                               <h4><span class="text-danger">
                                                                   I'm sorry to inform you that your Order was decline by the due the payment transaction
                                                               </span></h4>
                                                            </div>
                                                        </center>
                                                        <br /><br />
                                                    </asp:LinkButton>
                                                </div>
                                            </center>
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
