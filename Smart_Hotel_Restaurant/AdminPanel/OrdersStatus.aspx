<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrdersStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.OrdersStatus" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 25px; font-weight: bold;">Orderlist Form</span>
    <div class="container-fluid mt-5">
        <div class="row">

            <div class="col-lg-3 col-sm-12 col-md-3">
                <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border: none;" >
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <asp:Repeater ID="R_Pending" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7">
                                                    <center>
                                                        <span CssClass="text-warning" style=" font-size: 60px; font-weight: 600;">

                                                            <asp:Label  CssClass="text-warning" Text='<%# Eval("Pending") %>' runat="server" />
                                                        </span>
                                                    </center>
                                                    <center>
                                                        <span>
                                                            <asp:Label CssClass="text-warning" Style=" font-size: 17px; font-weight: 600;" Text="Pending" runat="server" /></span>
                                                    </center>
                                                </div>
                                                <div class="col-lg-5 col-md-5 col-sm-5 text-warning">
                                                    <br />
                                                    <i class="fa-solid fa-circle-pause fa-4x img-fluid "></i>
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-3">
                <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border: none;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <asp:Repeater ID="R_TotalApproved" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7">
                                                    <center>
                                                        <span style=" font-size: 60px; font-weight: 600;">

                                                            <asp:Label CssClass="text-primary" Text='<%# Eval("Approveds") %>' runat="server" />
                                                        </span>
                                                    </center>
                                                    <center>
                                                        <div>
                                                            <asp:Label CssClass="text-primary" Style=" font-size: 17px; font-weight: 600;" Text="Approved" runat="server" />
                                                        </div>
                                                    </center>
                                                </div>

                                                <div class="col-lg-5 col-md-5 col-sm-5">
                                                    <br />

                                                    <i class="fa-sharp fa-solid fa-thumbs-up text-primary fa-4x img-fluid"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-3">
                <div class="card "  style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border: none;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">

                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-lg-7 col-md-7 col-sm-7">
                                            <center>
                                                <span class="text-danger" style=" font-size: 60px; font-weight: 600;">
                                                    <asp:Repeater ID="R_ReturnPayment" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label  Text='<%# Eval("K") %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </span>
                                            </center>
                                            <center>
                                                <div>
                                                    <asp:Label class="text-danger" Style="font-size: 17px; font-weight: 600;" Text="Return" runat="server" />
                                                </div>
                                            </center>
                                        </div>

                                        <div class="col-lg-5 col-md-5 col-sm-5">
                                            <br />
                                            <i class="fa-solid fa-thumbs-down text-danger fa-4x img-fluid"></i>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-12 col-md-3">
                <div class="card" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; border: none;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">

                                <asp:Repeater ID="R_OverAll" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-7 col-md-7 col-sm-7">
                                                    <center>
                                                        <span class="text-success" style=" font-size: 60px; font-weight: 600;">

                                                            <asp:Label Text='<%# Eval("OverAll") %>' runat="server" />
                                                        </span>
                                                    </center>
                                                    <center>
                                                        <span>
                                                            <asp:Label class="text-success" Style=" font-size: 17px; font-weight: 600;" Text="Total" runat="server" />
                                                        </span>
                                                    </center>
                                                </div>
                                                <div class="col-lg-5 col-md-5 col-sm-5">
                                                    <br />
                                                    <i class="fa-solid fa-circle-plus text-success fa-4x img-fluid"></i>

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <%-- thi is for approval order list start--%>
            <div class="col-lg-8 col-md-8 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div>
                                        <span style="font-size: 20px; font-weight: 700;">List of Order
                                        </span>
                                        <hr />
                                    </div>
                                    <div class="table table-responsive text-secondary table-bordered">

                                        <table class="table text-secondary table-sm">
                                            <thead style="background-color: #fd7e14;" class="text-white">
                                                <tr>
                                                    
                                                    <th scope="col" class="pt-2 pb-2">Name</th>
                                                    <th scope="col" class="pt-2 pb-2">Orders</th>
                                                    <th scope="col" class="pt-2 pb-2">Gcash No.</th>
                                                    <th scope="col" class="pt-2 pb-2">Contact No.</th>
                                                    <th scope="col" class="pt-2 pb-2">Date Purchased</th>
                                                    <th scope="col" class="pt-2 pb-2">View Order</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="R_OrderlistForApproval" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            
                                                            <td>
                                                                <span style="font-weight: bold;">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span class="text-primary">
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("orderStatus") %>'></asp:Label>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("gnumber") %>'></asp:Label>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("number") %>'></asp:Label>

                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("orderDate") %>'></asp:Label>

                                                                </span>
                                                            </td>
                                                            <td>
                                                                <a href="ViewListOrder.aspx?datePurchase=<%# Eval("orderDate") %>" class="btn btn-outline-primary btn-sm">View Order
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>

                                    </div>

                                    <center>
                                        <asp:LinkButton ID="LnkNoOrderFound" Visible="false" Enabled="false" runat="server">
                                        <span style="font-weight: bold; font-size:20px;" class="text-secondary">No Order Found</span>
                                        </asp:LinkButton>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- this is for approval order list end--%>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid p-0">
                            <div class="row ml-0 mr-0 p-0">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div>
                                        <span style="font-size: 20px; font-weight: 700;">List of Approved
                                        </span>
                                        <hr />
                                    </div>
                                    <div class="table table-responsive table-sm table-bordered">
                                        <table class="table table-sm">
                                            <thead class="text-white bg-primary">
                                                <tr>
                                                   
                                                    <th scope="col" class="pt-2 pb-2">Name</th>
                                                    <th scope="col" class="pt-2 pb-2">Date Purchased</th>
                                                    <th scope="col" class="pt-2 pb-2">Transaction</th>
                                                </tr>
                                            </thead>
                                            <asp:Repeater ID="R_SucessfullyTransactionTable" runat="server">
                                                <ItemTemplate>
                                                    <tbody>
                                                        <tr>
                                                           
                                                            <td>
                                                                <small>
                                                                    <asp:Label Text='<%# Eval("fname") %>' runat="server" />
                                                                    <asp:Label Text='<%# Eval("mi") %>' runat="server" />
                                                                    <asp:Label Text='<%# Eval("lname") %>' runat="server" />
                                                                </small>
                                                            </td>
                                                            <td>
                                                                <small style="font-size: 12px;">
                                                                    <asp:Label Text='<%# Eval("orderDate") %>' runat="server" />
                                                                </small>
                                                            </td>
                                                            <td>
                                                                <small style="color: green; font-size: 12px; font-weight: 600;">
                                                                    <i class="fa-solid fa-check"></i>
                                                                    Successfully!
                                                                </small>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
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
