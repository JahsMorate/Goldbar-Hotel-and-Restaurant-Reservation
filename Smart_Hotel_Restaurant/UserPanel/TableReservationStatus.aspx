<%@ Page Title="Table | Reservation" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="TableReservationStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.TableReservationStatus" Async="true" %>

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
                    <span class=" text-dark">

                        <span style="font-weight: 600; font-size: 27px;">Table Reservation</span>

                    </span>
                    <hr style="height: 3px; width: 100%; background-position-x: -30px; background-size: 116px 3px; background-image: repeating-linear-gradient(45deg,#FF8C00,#FF8C00 33px,transparent 0,transparent 41px,#353b48 0,#353b48 74px,transparent 0,transparent 82px);" />
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">


                                    <div class="row">

                                        <div class="col-lg-12 col-md-12 col-sm-12 p-0">

                                            <div class="table table-responsive">
                                                <table class="table table-bordered table-stripped">
                                                    <thead>
                                                        <tr class="text-centery text-white" style="background-color: #fd7e14;">

                                                            <th scope="col" class="text-centery">
                                                                <center>Table No</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Table Area</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Guest</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Date of Reservation</center>
                                                            </th>
                                                            <th scope="col" class="text-centery">
                                                                <center>Reservation Status</center>
                                                            </th>
                                                            <th scope="col">
                                                                <center>Availability</center>
                                                            </th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="RTTableStatusUser" runat="server">
                                                            <ItemTemplate>
                                                                <tr class="text-center">

                                                                    <td><b><%# Eval("table_No") %></b></td>
                                                                    <td><%# Eval("Rtbl_Area") %></td>
                                                                    <td><%# Eval("Rtbl_Compability") %></td>
                                                                    <td><%# Convert.ToDateTime(Eval("Rtbl_DateReserve")).ToString("dddd, MMMM dd, yyyy h:mm tt") %></td>
                                                                    <td>
                                                                        <asp:Label ID="lblStatus" Text='<%# Eval("Rtbl_Status") %>' runat="server" />

                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblStats" runat="server" />
                                                                    </td>
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
                                                        <h4><span class="text-secondary">NO RESERVATION FOUND</span></h4>
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
