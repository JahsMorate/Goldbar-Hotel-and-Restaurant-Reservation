<%@ Page Title="" Language="C#" MasterPageFile="~/DefaulPage/Default.Master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.Honepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid img-fluid" style="background-image: url('../DesignImages/smartMain01.jpg'); width: 100%; height: 100%; background-size: cover; background-repeat: no-repeat; background-position: center;">
        <br />
        <br />
        <br />
        <di v class="container">
            <div class="row">
                <div class="mt-5 mb-5 col-lg-12 col-md-12 col-sm-12">
                    <center class="mt-5 pt-4">
                        <div class="card" style="background-color: #02010075;">
                            <div class="card-body">
                                <span class="pt-5" style="color: white; text-justify: auto; font-size: 40px; font-weight: bold;">Welcome to Goldbar Hotel and Restaurant Reservation</span>
                                <br />
                                <span style="color: white; text-justify: auto; font-size: 25px; font-weight: 700;">Great view, great location, and We’re sure to give you what you deserve</span>
                                <div>
                                    <asp:Button ID="btnBookNow" CssClass="btn btn-primary btn-lg text-white m-3" runat="server" Text="View Our Menu" Style="font-weight: 500;" OnClick="btnBookNow_Click" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                    </center>
                </div>
            </div>
        </di>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
