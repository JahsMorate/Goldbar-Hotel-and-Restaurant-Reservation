<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="CheckOutFoods.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.CheckOutFoods" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--This is the primary key of USER--%>
    <asp:HiddenField ID="hndUserID" runat="server" />
    <%--This is the primary key of USER--%>

    <%--This is the primary key of payment--%>
    <asp:Label ID="lbldate" Visible="false" runat="server"></asp:Label>
    <%--This is the primary key of payment--%>

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">

                <div>
                    <span style="color: #ee4d2d;">
                        <i class="fa-solid fa-utensils pr-3 fa-2x"></i>
                        <span style="font-weight: 600; font-size: 27px;">Foods & Drinks</span>
                        <span style="margin-left: 0.9375rem; border-left: 0.0625rem solid #ee4d2d; color: #ee4d2d; font-size: 1.25rem; line-height: 1.875rem; height: 1.875rem; padding-left: 0.9375rem; margin-bottom: 0.0625rem; text-transform: capitalize;">Checkout</span>
                    </span>
                    <hr style="height: 3px; width: 100%; background-position-x: -30px; background-size: 116px 3px; background-image: repeating-linear-gradient(45deg,#6fa6d6,#6fa6d6 33px,transparent 0,transparent 41px,#f18d9b 0,#f18d9b 74px,transparent 0,transparent 82px);" />
                </div>
            </div>

            <div>
                <span>
                    <a href="HomeRoom.aspx" class="nav-link text-dark">
                        <i class="fa-solid fa-cart-shopping" style="color: #d35400;"></i>
                        Continue Shopping
                    </a>
                </span>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <span style="font-size: 1.125rem; color: #ee4d2d; margin-bottom: 20px; text-transform: capitalize;">
                                            <label>
                                                Transaction Details
                                            </label>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <asp:Repeater ID="R_UserInformation" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-12" style="font-weight: 700; color: #222f3e;">
                                            <span>
                                                <i class="fa-solid fa-user text-primary pr-2"></i>
                                                <asp:Label Text='<%# Eval("fname") %>' runat="server" />
                                                <asp:Label Text='<%# Eval("mi") %>' runat="server" />
                                                <asp:Label Text='<%# Eval("lname") %>' runat="server" />
                                            </span>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-12">
                                            <span>
                                                <i class="fa-solid fa-address-book" style="color: #ff9f43;"></i>
                                                <b>
                                                    <asp:Label Text="Contact No:" runat="server" /></b>
                                                <asp:Label Text='<%# Eval("number") %>' runat="server" />
                                            </span>
                                        </div>
                                        <div class="col-lg-5 col-md-4 col-sm-12">
                                            <span>
                                                <img src="../DesignImages/Icon/GcashPaymeny.png" width="20" />
                                                <b>
                                                    <asp:Label Text="Gcash E-Wallet:" runat="server" /></b>
                                                <asp:Label Text='<%# Eval("gnumber") %>' runat="server" />
                                            </span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-1"></div>

            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <span style="font-size: 1.125rem; color: #ee4d2d; margin-bottom: 20px; text-transform: capitalize;">
                                        <label>
                                            Purchase Order
                                        </label>
                                    </span>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead style="background-color: #353b48;">
                                            <tr class="text-center">
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Image</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Food Name</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Category</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Specialty</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Price</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Qty</th>
                                                <th scope="col" class="text-center text-white  pt-3 pb-3">Total Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="R_CheckOutFoods" runat="server">
                                                <ItemTemplate>
                                                    <tr class="text-center">
                                                        <th scope="row">

                                                            <asp:Image ID="firstImage" ImageUrl='<%# Utils.GetImageUrl( Eval("Crt_imageFood"))%>' style="max-width: 40px; max-height: 40px;" class=" img-fluid" runat="server" />
                                                        </th>
                                                        <td>
                                                            <asp:HiddenField ID="hndCartID"  Value='<%# Eval("crtId") %>' runat="server" />
                                                            <asp:Label ID="LblFoodName" CssClass="text-center" Style="color: #212121;" runat="server" Text='<%# Eval("foodName") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" CssClass="text-center" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" CssClass="text-center" runat="server" Text='<%# Eval("fStatus") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            
                                                            <asp:Label ID="LblPrice" CssClass="text-center" runat="server" Text='<%# Eval("Crt_OriginalPrice","{0:N2}") %>'></asp:Label>
                                                        </td>
                                                         <td>
                                                            <asp:Label ID="Label1" CssClass="text-center" runat="server" Text='<%# Eval("Crt_Qty","{0:N2}") %>'></asp:Label>
                                                        </td>
                                                         <td>
                                                             <span style="color: #f57224; font-size: 18px; line-height: 28px; font-weight: 500; margin-bottom: 4px;">₱</span>
                                                            <asp:Label ID="Label2" CssClass="text-center" Style="color: #f57224; font-size: 18px; line-height: 28px; font-weight: 500; margin-bottom: 4px;" runat="server" Text='<%# Eval("Crt_TotalPrice","{0:N2}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>

                                    </table>

                                    <center>
                                        <asp:LinkButton ID="LnkNoCart" OnClick="LnkNoCart_Click" CssClass="nav-link" runat="server">
                                           <center>
                                               <div style="color: #bdc3c7;">
                                               <div>
                                                   <h1>No Order Available</h1>
                                               </div>
                                               <div>
                                                   <h6>Please Click Here to Continue Shopping...</h6>
                                               </div>
                                           </div>
                                           </center>
                                        </asp:LinkButton>
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">

                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <span style="font-size: 1.125rem; color: #ee4d2d; margin-bottom: 20px; text-transform: capitalize;">
                                        <label>
                                            Reminder from <span style="color: #947641;">Goldbar Hotel & Restaurant</span>
                                        </label>
                                    </span>
                                    <hr />
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">

                                    <label>
                                        <span style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;"><span class="text-primary" style="font-weight: 500;">Dear Customers,</span>


                                        </span>

                                    </label>
                                    <br />
                                    <div style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px; text-align: justify;" class="pb-2">
                                        Kindly provide the accurate figures for both the total cost of your order and the amount to be paid through Gcash. In the event that the Gcash payment does not match the total cost of the order, it will be subject to review and monitoring by the administrator.
                                             
                                    </div>
                                    <div style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px; text-align: justify;" class="pb-2">

                                        <span class="text-success">The order request will be approved upon receipt of at least 70% of the partial payment. The outstanding balance must be paid in person at the cashier.</span> <span class="text-danger">If the partial payment is less than 70%, the administrator will initiate a refund of the payment to the customer via the Gcash platform.</span>
                                        Take note, your gcash number that you registered will be the same number when you send your payment through gcash.
                                        So please, to put accordingly so that there will be no problem, Thank you!
                                    </div>
                                    <div style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px; text-align: justify;" class="pb-2">
                                        Remember, the Gcash number you registered with should be used when making your payment through Gcash.
                                    </div>
                                    <div style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px; text-align: justify;" class="pb-2">
                                        Lastly, Once you have placed your order, it will remain as pending and cannot be cancelled or modified. This is to prevent any food from being unnecessarily wasted, as our chef has already begun preparing it.
                                    </div>
                                    <div style="font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px; text-align: justify;">
                                        Kindly provide the required information in an accurate manner to avoid any complications. Your consideration in this matter is greatly appreciated. Thank you.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <span style="font-size: 1.125rem; color: #ee4d2d; margin-bottom: 20px; text-transform: capitalize;">
                                        <label>
                                            Payment Method
                                        </label>
                                    </span>
                                    <hr />
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <center>
                                        <div>
                                            <span>Send To: </span>
                                            <span style="font-weight: 600;" class="text-primary">09706122212</span>
                                        </div>
                                        <div>
                                            or
                                        </div>
                                        <div>
                                            <span style="font-weight: 600;" class="text-primary">Send via QR code</span>
                                        </div>
                                    </center>
                                    <img src="../DesignImages/Icon/IMG_20230126_161321.jpg" class=" img-thumbnail" />
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-12">

                                    <div class="card">
                                        <div class="card-body">
                                            <center>
                                                <div>
                                                    <span style="font-weight: bold; font-size: 18px;">
                                                        <asp:Label Text="Payment" runat="server" />
                                                    </span>
                                                </div>
                                            </center>

                                            <div class="container-fluid">
                                                <div class="row p-3">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <hr />
                                                    </div>

                                                    <asp:Repeater ID="R_OrderSummaryCheckOut" runat="server">
                                                        <ItemTemplate>
                                                            <div style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                                <asp:Label Text="Total Order" runat="server" />
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
                                                                    <asp:Label ID="LblTotalPrice" runat="server" Text='<%# Eval("totalPrice","{0:N2}") %>'></asp:Label>
                                                                </span>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:Repeater>


                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <div class="form-group">
                                                            <span style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                                <label>Amount</label></span>
                                                            <asp:TextBox ID="TxtAmount" TextMode="Number" Style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;" CssClass="form-control" placeholder="Enter your Amount" runat="server"></asp:TextBox>
                                                            <small>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Please Enter Amount" ControlToValidate="TxtAmount"></asp:RequiredFieldValidator></small>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <div class="form-group">
                                                            <span style="display: flex; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                                <label>Your Order Status</label></span>
                                                            <asp:DropDownList ID="DdlOrderStatus" CssClass="form-control" Style="-webkit-box-flex: 1; -ms-flex: 1; flex: 1; display: -webkit-box; display: -ms-flexbox; display: flex; -webkit-box-pack: start; -ms-flex-pack: start; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;" runat="server">
                                                                <asp:ListItem Text="Dine-in" Value="Dine-in"></asp:ListItem>
                                                                <asp:ListItem Text="Take-out" Value="Take-out"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <span style="font-weight: 600; display: flex; justify-content: flex-start; font-size: 14px; color: #757575; letter-spacing: 0; line-height: 21px;">
                                                            <span class="pr-2">Downpayment:</span>
                                                            <img src="../DesignImages/Icon/GcashPaymeny.png" class="mr-2" width="20" />
                                                           
                                                        </span>
                                                    </div>
                                                </div>
                                                <br />

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 p-0">
                                                        <asp:LinkButton ID="LnkProceedToContinue" OnClick="LnkProceedToContinue_Click" CssClass="btn btn-primary btn-block" OnClientClick="return confirm('Are you sure do you want to Order?')" runat="server">
                                                       <i class="fa-solid fa-check pr-2"></i> Order Now
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
        </div>
    </div>
    <br />

</asp:Content>
