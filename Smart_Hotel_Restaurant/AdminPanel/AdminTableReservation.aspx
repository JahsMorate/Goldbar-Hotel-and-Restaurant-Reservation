<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminTableReservation.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.AdminTableReservation" EnableEventValidation="false" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 25px; font-weight: bold;">Table Reservation Form</span>
    <div class="container-fluid mt-5">
        <div class="row">

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">

                                    <img src="../DesignImages/MenuService/available.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-success" style="text-align: right;">Available</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-success">
                                                        <asp:Repeater ID="R_Availables" runat="server">
                                                            <ItemTemplate>
                                                                <%# Eval("Availables") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </span>
                                                </center>
                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/Pending.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-warning" style="text-align: right;">Pending</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-warning">
                                                         <asp:Repeater ID="R_Pending" runat="server">
                                                            <ItemTemplate>
                                                                <%# Eval("Pendings") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </span>
                                                </center>
                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/occupied.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-primary" style="text-align: right;">Occupied</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-primary">
                                                        <asp:Repeater ID="R_Occcupieds" runat="server">
                                                            <ItemTemplate>
                                                                <%# Eval("Occcupieds") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </span>
                                                </center>
                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/TableArea.png" />
                                    <div class=" mt-2 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Total Table</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <span class="text-secondary">
                                                        <asp:Repeater ID="R_TotalTable" runat="server">
                                                            <ItemTemplate>
                                                                <%# Eval("Totals") %>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </span>
                                                </center>
                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <br />
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="input-group">
                    <asp:TextBox ID="TxtSearch" CssClass="form-control" Style="border-radius: 20px;" placeholder="Search here" runat="server"></asp:TextBox>
                    <asp:LinkButton class=" btn ml-3" ID="lnkSearch" runat="server" Style="color: white; background-color: #fd7e14; border-radius: 20px;">
                           <i class="fa-solid fa-magnifying-glass"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
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
                                                    <th scope="col" class="text-center  pt-3 pb-3">Table No</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Table Area</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Table Compability</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Description</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Date of Reservation</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Status</th>
                                                    <th scope="col" class="text-center  pt-3 pb-3">Action</th>

                                                </tr>
                                            </thead>
                                            <asp:Repeater ID="R_Reservation" runat="server">
                                                <ItemTemplate>
                                                    <tbody>
                                                        <tr>
                                                            
                                                            <td class="text-center text-secondary">
                                                                <asp:HiddenField ID="hndTblID" Value='<%# Eval("tblID_fk") %>' runat="server" />
                                                                <asp:HiddenField ID="hndResrvationID" Value='<%# Eval("TblId") %>' runat="server" />
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="LblPrice" runat="server" Style="color: #d35400;" Text='<%# Eval("Rtbl_no") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <small>
                                                                    <asp:Label ID="lblArea" runat="server" CssClass="text-muted" Text='<%# Eval("Rtbl_Area") %>'></asp:Label>
                                                                </small>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="LblStatus" runat="server" CssClass="text-primary" Text='<%# Eval("Rtbl_Compability") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <small>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("RTbl_Description") %>'></asp:Label>
                                                                    <asp:Label ID="lblEmail" Visible="false" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                                </small>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="LblCategory" runat="server" Text='<%# Convert.ToDateTime(Eval("Rtbl_DateReserve")).ToString("dddd, dd MMMM yyyy") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">
                                                                <asp:Label ID="lblStatusssss" runat="server" Text='<%# Eval("Rtbl_Status") %>'></asp:Label>
                                                            </td>
                                                            <td class="text-center text-secondary">

                                                                <asp:LinkButton ID="LnkAcccept" CommandArgument='<%# Eval("utblId") %>' CssClass="btn btn-primary btn-sm" OnClientClick="return confirm('Are you sure do you want to Confirm?')" runat="server" OnClick="LnkAcccept_Click">
                                                                     <span>Accept</span>
                                                                </asp:LinkButton>

                                                                <asp:LinkButton ID="LnkDecline" CommandArgument='<%# Eval("utblId") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure do you want to Cancel Reservation Request?')" runat="server" OnClick="LnkDecline_Click">        
                                                                      Cancel
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="LnkBackAvailable" Visible="false" CommandArgument='<%# Eval("utblId") %>' CssClass="btn btn-success btn-sm" OnClientClick="return confirm('May I confirm that you wish to be listed as available to return to the table?')" runat="server" OnClick="LnkBackAvailable_Click">        
                                                                      Back to Available
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
