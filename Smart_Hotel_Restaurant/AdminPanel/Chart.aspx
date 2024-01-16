<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.Chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function startTimer(timeLeft, index) {
            setInterval(function () {
                if (timeLeft <= 0) {
                    clearInterval();
                    return;
                }

                document.getElementById("rptCountdownTimer_lblCountdownTimer_" + index).innerHTML = timeLeft + " seconds remaining";
                timeLeft--;
            }, 1000);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 25px; font-weight: bold;">Chart Form</span>

    <div class="container-fluid mt-3">
        <div class="row">
            <asp:Repeater ID="rptCountdownTimer" runat="server">
                <ItemTemplate>
                    <asp:Label ID="lblCountdownTimer" runat="server" Text='<%# Eval("CountdownTimerValue") %>'></asp:Label>
                    <asp:Button ID="btnStartTimer" runat="server" Text="Start Timer" OnClientClick='startTimer("<%# Eval("CountdownTimerValue") %>", "<%# Container.ItemIndex %>");' />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
