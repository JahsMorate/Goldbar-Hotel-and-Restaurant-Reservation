<%@ Page Title="List Food Order" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewListOrder.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.ViewListOrder" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="HndPaymendID" runat="server" />
    <asp:TextBox ID="TxtTotalPrice" Visible="false" runat="server"></asp:TextBox>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">

                    <div class="card-body">

                        <div class="container-fluid">
                            <div>
                                <span style="font-weight: 800; font-size: 28px;">
                                    <asp:Label Text="User Profile & Orders Information" CssClass="text-secondary" runat="server" />
                                </span>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <asp:Repeater ID="R_UserOrderListInfo" runat="server">
                                                <ItemTemplate>
                                                    <div class="row">

                                                        <center>
                                                            <div>
                                                                <small class="text-muted">Customer Information</small>
                                                            </div>
                                                        </center>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div>
                                                                <span>
                                                                    <i class="fa-solid fa-user text-primary"></i>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    <i class="fa-sharp fa-solid fa-phone text-warning"></i>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("number") %>'></asp:Label>

                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    <img src="../DesignImages/Icon/GcashPaymeny.png" width="20" />
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("gnumber") %>'></asp:Label>

                                                                </span>
                                                            </div>
                                                           
                                                            <div>
                                                                <span>
                                                                    <a href="mailto:<%# Eval("email") %>">
                                                                        <i class="fa-solid fa-envelope text-success"></i>
                                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                                    </a>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="card">
                                        <div class="card-header" style="background-color: white; border-bottom: 4px solid #20c997;">
                                            <span style="font-weight: 500; font-size: 22px;">
                                                <asp:Label Text="Order Summary" CssClass="text-secondary" runat="server" />
                                            </span>
                                        </div>
                                        <div class="card-body">
                                            <table class="table table-borderless table-user-information text-secondary">

                                                <tbody>
                                                    <asp:Repeater ID="R_OrderSummary" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>Order Mode</td>
                                                                <td>
                                                                    <span class="text-primary">
                                                                        <asp:Label ID="LblorderStatus" Style="font-weight: bold;" runat="server" Text='<%# Eval("orderStatus") %>'></asp:Label>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Date Purchased</td>
                                                                <td>
                                                                    <asp:Label ID="OrderDate" runat="server" Style="font-weight: bold;" Text='<%# Eval("orderDate") %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                    <asp:Repeater ID="R_AmountTotalRemainingBalanced" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>Total Payment</td>

                                                                <td>
                                                                    <asp:Label ID="lblTotalPayment" CssClass="text-success" Style="font-weight: bold;" runat="server" Text='<%# Eval("bayadan", "{0:N2}") %>'></asp:Label>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>Amount Paid</td>

                                                                <td>
                                                                    <asp:Label ID="Amount" CssClass="text-success" Style="font-weight: bold;" runat="server" Text='<%# Eval("gebaydan", "{0:N2}") %>'></asp:Label>
                                                                    <label>Equavalent to</label>
                                                                    <asp:Label ID="Label8" CssClass="text-success" Style="font-weight: bold;" runat="server" Text='<%# Eval("finalPurcento","{0:N2}") %>'></asp:Label><span>%</span>
                                                                </td>

                                                            </tr>


                                                            <tr>
                                                                <td>Remaining Balanced</td>

                                                                <td>
                                                                    <asp:Label ID="Label7" CssClass="text-danger" Style="font-weight: bold;" runat="server" Text='<%# Eval("customerBalanced", "{0:N2}") %>'></asp:Label>
                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <span style="font-weight: 500; color: #fa983a; font-size: 22px;">
                                <asp:Label Text="List of Food Order" runat="server" />
                            </span>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="table table-responsive table-bordered mb-1">
                                        <table class="table table-bordered">
                                            <thead style="background-color: #353b48;">
                                                <tr class="text-center text-white  pt-2 pb-2">
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Image</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Name</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Description</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">Category</th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Specialty</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Price</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Qty</center>
                                                    </th>
                                                    <th scope="col" class=" pt-2 pb-2">
                                                        <center>Total</center>
                                                    </th>

                                                </tr>
                                            </thead>
                                            <asp:Repeater ID="R_ListOrder" runat="server">
                                                <ItemTemplate>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <img src="<%# Utils.GetImageUrl(Eval("foodImage")) %>" width="50" style="max-height: 50px; max-width: 50px;" class="img-fluid" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblFname" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <small>
                                                                    <asp:Label ID="lblDecription" CssClass="text-muted" runat="server" Text='<%# Eval("fDecription") %>'></asp:Label></small>
                                                            </td>
                                                            <td>
                                                                <small>
                                                                    <asp:Label ID="lblCategory" CssClass="text-primary" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label></small>
                                                            </td>
                                                            <td>
                                                                <small>
                                                                    <asp:Label ID="lblSpecialty" CssClass="text-danger" runat="server" Text='<%# Eval("fStatus") %>'></asp:Label></small>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Crt_OriginalPrice","{0:N2}") %>'></asp:Label>
                                                            </td>
                                                            <td>

                                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("Crt_Qty","{0:N2}") %>'></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label10" Style="color: #fd7e14; font-weight: bold;" runat="server" Text='<%# Eval("Crt_TotalPrice","{0:N2}") %>'></asp:Label>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                    <div class="fa-pull-right">
                                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" OnClientClick="return confirm('Are you sure do you want to Return Payment?')" CssClass="btn btn-outline-danger" runat="server">
                                        Return Payment
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LnkConfirm" OnClientClick="return confirm('Are you sure do you want to Confirm?')" OnClick="LnkConfirm_Click" CssClass="btn btn-primary" runat="server">
                                        Confirm Order
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>






    </div>

</asp:Content>
