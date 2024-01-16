<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="CartFoods.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.CartFoods" EnableEventValidation="false" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <%--This is the primary key of USER--%>
        <asp:HiddenField ID="hndUserID" runat="server" />


        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <span style="color: #d35400;">

                    <i class="fa-solid fa-cart-shopping pr-3 fa-3x"></i>
                    <span style="font-weight: bolder; font-size: 30px;">My Cart</span>
                </span>
                <hr style="font-weight: bolder; border: 2px solid #353b48db;" />
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                <div>
                    <span>
                        <a href="HomeRoom.aspx" class="nav-link text-dark">
                            <i class="fa-solid fa-cart-shopping" style="color: #d35400;"></i>
                            Continue Shopping
                        </a>
                    </span>
                </div>
                <div class="card p-0">
                    <div class="card-header" style="background-color: white; border-bottom: none;">
                        <span style="font-size: 17px; font-weight: bold;">
                            <%--We have to fetch the data all items --%>
                            <span>
                                <span style="font-weight: 400;">All Items</span>
                                <asp:Repeater ID="AllitemFoods" runat="server">
                                    <itemtemplate>

                                        <span style="font-weight: 400;">(<asp:Label ID="lblAllItems" Style="font-weight: 400;" runat="server" Text='<%# Eval("Items") %>'></asp:Label>)
                                        </span>
                                    </itemtemplate>
                                </asp:Repeater>

                            </span>
                        </span>

                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 col-md-12 col-12">
                                <table class=" table p-0 m-0 table-responsive  table-stripe table-hover">
                                    <tbody>
                                        <%--This is listview started for all cart --%>
                                        <asp:ListView ID="ListViewCart" OnPagePropertiesChanging="ListViewCart_PagePropertiesChanging" GroupPlaceholderID="GroupID" ItemPlaceholderID="itemID" runat="server">
                                            <layouttemplate>
                                                <thead>
                                                    <tr style="background-color: #353b48;">
                                                        <th scope="col" class="text-center text-white  pt-3 pb-3">Image</th>
                                                        <th scope="col" class="text-center  text-white pt-3 pb-3">Food Name</th>
                                                        <th scope="col" class="text-center  text-white pt-3 pb-3">Category</th>
  <%--                                                      <th scope="col" class="text-center  text-white pt-3 pb-3">Specialty</th>--%>
                                                        <th scope="col" class="text-center  text-white pt-3 pb-3">Price</th>
                                                        <th scope="col" class="text-center text-white pt-3 pb-3">Qty</th>
                                                        <th scope="col" class="text-center text-white pt-3 pb-3">Total</th>
                                                        <th scope="col" class="text-center  text-white pt-3 pb-3">Update Qty</th>
                                                        <th scope="col" class="text-center text-white  pt-3 pb-3">Remove</th>
                                                    </tr>
                                                    <tr id="GroupID" runat="server"></tr>
                                                    <tr>
                                                        <td colspan="9" style="text-align: center;">
                                                            <asp:DataPager ID="dataPageAll" runat="server" PagedControlID="ListViewCart" PageSize="5">
                                                                <fields>
                                                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                                                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-warning" NextPreviousButtonCssClass="btn btn-warning" NumericButtonCssClass="btn btn-outline-primary" />
                                                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                                                                </fields>
                                                            </asp:DataPager>
                                                        </td>
                                                    </tr>
                                                </thead>
                                                </thead>
                                            </layouttemplate>
                                            <grouptemplate>
                                                <tr>
                                                    <tr id="itemID" runat="server"></tr>
                                                </tr>
                                            </grouptemplate>
                                            <itemtemplate>
                                                <tr class="table-secondary">
                                                    <td class="text-center text-secondary" scope="row">

                                                        <%-- This is the primary key of CartID--%>

                                                        <img src="<%# Utils.GetImageUrl(Eval("Crt_imageFood")) %>" class="img-fluid" style="max-width: 50px; max-height: 50px; width: 50px; height: 50px;" />
                                                    </td>

                                                    <td class="text-center text-secondary">
                                                        <asp:Label ID="LblFoodName" Style="color: #212121;" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                                    </td>

                                                    <td class="text-center text-secondary">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                                        <asp:HiddenField ID="cartID" Value='<%# Eval("crtId") %>' runat="server" />
                                                    </td>
                                                    

                                                    <td class="text-center text-secondary">
                                                        <span style="color: #f57224; font-size: 18px; line-height: 28px; font-weight: 500; margin-bottom: 4px;">₱</span>
                                                        <asp:Label ID="LblPrice" runat="server" Text='<%# Eval("fprice","{0:N2}") %>'></asp:Label>
                                                    </td>
                                                    <td class="text-center text-secondary">

                                                        <asp:TextBox ID="txtQty" TextMode="Number" CssClass="form-control" Text='<%# Eval("Crt_Qty","{0:N0}") %>' runat="server"></asp:TextBox>

                                                    </td>
                                                    <td class="text-center text-secondary">
                                                        <span style="color: #f57224; font-size: 18px; line-height: 28px; font-weight: 500; margin-bottom: 4px;">₱</span>
                                                        <asp:Label ID="lblTotalPrice" runat="server" Style="color: #f57224; font-size: 18px; line-height: 28px; font-weight: 500; margin-bottom: 4px;" Text='<%# Eval("Crt_TotalPrice","{0:N2}") %>'></asp:Label>
                                                    </td>
                                                    <td class="text-center text-secondary">
                                                        <asp:LinkButton ID="LnkUpdate" CommandArgument='<%# Eval("crtId") %>' CausesValidation="true" CssClass="btn btn-sm btn-primary" OnClick="LnkUpdate_Click" runat="server">
                                                            <small>Update</small>
                                                        </asp:LinkButton>

                                                    </td>
                                                    <td class="text-center text-secondary">
                                                        <asp:LinkButton ID="LnkRemove" CommandArgument='<%# Eval("crtId") %>' CausesValidation="true" CssClass="nav-link text-danger" OnClientClick="return confirm('Are you sure do you want to Remove?')" runat="server" OnClick="LnkRemove_Click">
                                                            <i class="fa-solid fa-trash"></i>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </itemtemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>

                                <div>
                                    <center>
                                        <asp:LinkButton ID="LnkNoCart" OnClick="LnkNoCart_Click" CssClass="nav-link" runat="server">
                                            <center>
                                                <div style="color: #bdc3c7;">
                                                    <div>
                                                        <h1>No Order Available</h1>
                                                    </div>
                                                    <div>
                                                        <h6>Please click here to Continue Shopping...</h6>
                                                    </div>
                                                </div>
                                            </center>
                                        </asp:LinkButton>
                                    </center>
                                </div>
                            </div>

                    <div class="col-lg-12 col-sm-12 col-md-12 fa-pull-right">
                        <br />
                        <div class=" fa-pull-right">

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 pr-0 pl-0 pb-2">
                                        <span style="font-size: 20px; color: #212121; margin-bottom: 14px; position: relative; font-weight: 700;">
                                            <asp:Label Text="Order Summary" runat="server" />
                                        </span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                        <hr />
                                    </div>

                                    <asp:Repeater ID="R_OrderSummary" runat="server">
                                        <itemtemplate>
                                            <div style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                <asp:Label Text="All Item" runat="server" />
                                            </div>
                                            <div style="font-size: 16px; line-height: 21px; text-align: right; color: #202020; letter-spacing: -.44px; vertical-align: middle;">
                                                <span style="margin-right: 5px;">
                                                    <%# Eval("Allitems_SP") %>
                                                </span>
                                            </div>

                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                            </div>
                                            <div style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                <asp:Label Text="Total Amount" runat="server" />
                                            </div>
                                            <div style="font-size: 16px; line-height: 21px; text-align: right; color: #202020; letter-spacing: -.44px; vertical-align: middle;">
                                                <span style="margin-right: 5px; color: #f57224; font-size: 18px;">₱
                                                </span>
                                                <span style="margin-right: 5px; color: #f57224; font-size: 18px;">
                                                    <%# Eval("totalPrice","{0:N2}") %>
                                                </span>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>

                                    <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pr-0 pl-0">
                                        <asp:LinkButton ID="LnkBTnCheckOUt" OnClick="LnkBTnCheckOUt_Click1" Enabled="true" CssClass="btn btn-block btn-md btn-dark" runat="server">
                                            <i class="fa-solid fa-check"></i>Proceed to Checkout
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
    </div>

    </div>

    <br />
</asp:Content>
