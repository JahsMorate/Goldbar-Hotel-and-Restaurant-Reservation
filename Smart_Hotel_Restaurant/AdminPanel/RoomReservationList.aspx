<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeFile="RoomReservationList.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.RoomReservationList" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
    <span style="font-size: 25px; font-weight: bold;">Room Reservation Form</span>
    <div class="container-fluid mt-5">
        <br />
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card" style="border-radius: 10px;">
                    <div class="card-body">
                        <div class="container-fluid p-1">
                            <div class="row p-0">
                                <div class="col-lg-12 col-md-12 col-sm-12 p-0">

                                    <div class="table table-responsive table-bordered mb-1">
                                        <table class="table table-bordered">
                                            <thead style="background-color: #353b48;">
                                                <tr class="text-center text-white  pt-3 pb-3">
                                                    <th scope="col" class="text-center  pt-3 pb-3">Name</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Room No</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Price/Per Night</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Description</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Date of Reservation</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Status</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Action</th>
                                                </tr>
                                                
                                            </thead>
                                            <asp:Repeater ID="R_RReservation" runat="server">
                                                <ItemTemplate>
                                                    <tbody>
                                                        <tr>
                                                            <td class="text-center text-secondary">
                                                                <asp:HiddenField ID="hndRRID" Value='<%# Eval("RRId") %>' runat="server" />
                                                                <asp:HiddenField ID="userID" Value='<%# Eval("cusId") %>' runat="server" />
                                                                <asp:HiddenField ID="hndResrvationID" Value='<%# Eval("userID_fk") %>' runat="server" />
                                                                <asp:HiddenField ID="rrID" Value='<%# Eval("userID_fk") %>' runat="server" />
                                                                <asp:Label ID="lblFname" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                                                                <asp:Label ID="lblmi" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                                                <asp:Label ID="lbllname" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                            </td>

                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="lblRRNUmber" runat="server" Style="color: #d35400;" Text='<%# Eval("rrnumber") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="lblPrice" runat="server" Style="color: #d35400;" Text='<%# Eval("rrPrice") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="LblStatus" runat="server" CssClass="text-primary" Text='<%# Eval("rrStatus") %>'></asp:Label>
                                                                <asp:Label ID="lblEmail" runat="server" Visible="false" CssClass="text-primary" Text='<%# Eval("email") %>'></asp:Label>
                                                            </td>

                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="LblCategory" runat="server" Text='<%# Convert.ToDateTime(Eval("roomDate")).ToString("dddd, MMMM dd yyyy h:mm:ss tt") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="lblStatusssss" runat="server" Text='<%# Eval("urstatus") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">

                                                                <asp:LinkButton ID="LnkAcccept" CommandArgument='<%# Eval("userID_fk") %>' CssClass="btn btn-primary btn-sm" OnClientClick="return confirm('Are you sure do you want to Confirm?')" runat="server" OnClick="LnkAcccept_Click">
                                                                     <span>Accept</span>
                                                                </asp:LinkButton>

                                                                <asp:LinkButton ID="LnkDecline" OnClick="LnkDecline_Click" Visible="false" CommandArgument='<%# Eval("userID_fk") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure do you want to Cancel Reservation Request?')" runat="server" >        
                                                                      Cancel
                                                                </asp:LinkButton>
                                                              
                                                                <asp:LinkButton ID="LnkViewForPayment" Visible="false" CommandArgument='<%# Eval("userID_fk") %>' CssClass="btn btn-success btn-sm" runat="server" OnClick="LnkViewForPayment_Click">     
                                                                      View Payment
                                                                </asp:LinkButton>
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
