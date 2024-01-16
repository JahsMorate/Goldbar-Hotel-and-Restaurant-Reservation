<%@ Page Title="Goldbar Visualization" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeFile="ChartStatus.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.ChartStatus" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../chartJS/chart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 25px; font-weight: bold;">Status</span>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-12 pt-2 pb-2">
                <a href="RoomReservationList.aspx" class="text-secondary">

                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row p-0">
                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                        <span class="bg-primary" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                            <i class="fa-solid fa-bed"></i>
                                        </span>

                                        <div class=" mt-3 fa-pull-right">

                                            <span class="text-secondary" style="text-align: right;">Room Reservation</span>

                                            <h4>
                                                <center>
                                                    <asp:Repeater ID="RReservationPending" runat="server">
                                                        <ItemTemplate>
                                                            <span style="font-size: 30px;">
                                                                <%# Eval("RRPending") %>
                                                            </span>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </center>
                                                <span style="font-size: 15px;"></span>
                                            </h4>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </a>

            </div>
            <div class="col-lg-3 col-md-4 col-sm-12 pt-2 pb-2">
                <a href="AdminTableReservation.aspx" class="text-secondary">
                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row p-0">
                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                        <span class="bg-info" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                            <i class="fa-solid fa-table"></i>
                                        </span>

                                        <div class=" mt-3 fa-pull-right">

                                            <span class="text-secondary" style="text-align: right;">Table Reservation</span>

                                            <h4>
                                                <center>
                                                    <center>
                                                        <asp:Repeater ID="R_Pending" runat="server">
                                                            <ItemTemplate>
                                                                <span style="font-size: 30px;"><%# Eval("Pendings") %></span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
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
                </a>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 pt-2 pb-2">
                <a href="OrdersStatus.aspx" class="text-secondary">
                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row p-0">
                                    <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                        <span class="bg-warning" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                        </span>

                                        <div class=" mt-3 fa-pull-right">

                                            <span class="text-secondary" style="text-align: right;">Food Orders</span>

                                            <h4>
                                                <center>
                                                    <center>
                                                        <asp:Repeater ID="RfoodsOrdeer" runat="server">
                                                            <ItemTemplate>
                                                                <span style="font-size: 30px;">
                                                                    <%# Eval("Pending") %>
                                                                </span>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
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
                </a>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <span class="bg-success" style="width: 60px; height: 60px; position: absolute; top: -35px; font-size: 35px; border-radius: 8px; display: flex; color: #fff; align-items: center; justify-content: center; transition: all 0.3s ease-in-out;">
                                        <i class="fa-solid fa-chart-line"></i>
                                    </span>

                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Total Net Income</span>

                                        <h4>
                                            <center>
                                                <asp:Repeater ID="RtotalFoodSale" runat="server">
                                                    <ItemTemplate>
                                                        <center>
                                                            <span class="text-success" style="font-size: 30px;"><%# Eval("TotalSale","{0:N2}") %></span>
                                                        </center>
                                                    </ItemTemplate>
                                                </asp:Repeater>
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

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 14px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-7 col-md-7 col-sm-12">
                                    <div>
                                        <span><b>Overall</b></span>
                                    </div>
                                    <div>
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-12">

                                    <center>
                                        <div>
                                            <span><b>Net Income</b></span>
                                        </div>
                                        <div>
                                            <canvas id="myChart2" style="width: 400px; height: 400px;"></canvas>
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
    <script>
        const ctx = document.getElementById('myChart');
        const ctxs = document.getElementById('myChart2');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['User', 'Food', 'Room', 'Table'],
                datasets: [{
                    label: 'Total',
                    data: [<%= totalUser%>, <%= totalFood%>, <%= totalRReservation%>, <%= totalTtReservation%>],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        new Chart(ctxs, {
            type: 'doughnut',
            data: {
                labels: [
                    'Total Net Sale',
                    'Food Net Sale',
                    'Room Reservation Net Sales'

                ],
                datasets: [{
                    label: 'Net Income',
                    data: [<%= totalNetIncome%>, <%= totalFoodIncome%>, <%= totalRReservationIncome%>],
                    backgroundColor: [
                        '#2ecc71',
                        'rgb(54, 162, 235)',

                        'rgb(255, 99, 132)'


                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: false,
                width: 300,
                height: 300
            }


        });


    </script>
</asp:Content>
