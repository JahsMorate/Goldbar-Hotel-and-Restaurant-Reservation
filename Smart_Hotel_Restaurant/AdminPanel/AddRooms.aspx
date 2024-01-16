<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.AdminHome" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview2').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        function readURL3(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview3').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        function readURL4(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview4').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL5(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview5').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL6(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview6').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="font-size: 25px; font-weight: bold;">Rooms Form</span>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12" style="background-color: white;">

                <!--This is Start-->
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <center>

                                <img id="imgview" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL(this);" ID="FplRoom1" runat="server" />
                            </center>

                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <center>
                                <img id="imgview2" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL2(this);" ID="FplRoom2" runat="server" />
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview3" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL3(this);" ID="FplRoom3" runat="server" />
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview4" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL4(this);" ID="FplRoom4" runat="server" />
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview5" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL5(this);" ID="FplRoom5" runat="server" />
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview6" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL6(this);" ID="FplRoom6" runat="server" />
                            </center>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!--This is End-->


                <div class="row">
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Room No." runat="server" />
                            <div class="input-group mb-3">
                                <span class="input-group-text text-success" id="basic-addon7">
                                    <i class="fa-solid fa-hashtag"></i>
                                </span>
                                <asp:HiddenField ID="HndRoomID" runat="server" />
                                <asp:TextBox ID="TxtRoomNo" CssClass="form-control" placeholder="Enter Room No." aria-describedby="basic-addon7" runat="server" required></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Price" runat="server" />
                            <div class="input-group mb-3">
                                <span class="input-group-text text-success" id="basic-addon1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tags-fill" viewBox="0 0 16 16">
                                        <path d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                        <path d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z" />
                                    </svg>
                                </span>
                                <asp:TextBox ID="TxtPrice" CssClass="form-control" placeholder="Enter Price" aria-describedby="basic-addon1" runat="server" required></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Compability" runat="server" />
                            <asp:DropDownList ID="DdlCompability" CssClass="form-select text-secondary" required runat="server">

                                <asp:ListItem Text="For 1 Person" Value="For 1 Person"></asp:ListItem>
                                <asp:ListItem Text="For Couple" Value="For Couple"></asp:ListItem>
                                <asp:ListItem Text="Good for 4 Person" Value="Good for 4 Person"></asp:ListItem>
                                <asp:ListItem Text="For Family" Value="For Family"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Room Type" runat="server" />
                            <asp:DropDownList ID="DdlRoomType" CssClass="form-select text-secondary" required runat="server">

                                <asp:ListItem Text="5 hours" Value="5 hours"></asp:ListItem>
                                <asp:ListItem Text="12 hours" Value="For Couple"></asp:ListItem>
                                <asp:ListItem Text="Open time" Value="Open time"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label Text="Description" runat="server" />
                    <div class="input-group mb-3">
                        <span class="input-group-text text-success" id="basic-addon2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-quote-fill" viewBox="0 0 16 16">
                                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm7.194 2.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 4C4.776 4 4 4.746 4 5.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 7.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 4c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z" />
                            </svg>
                        </span>
                        <asp:TextBox ID="TxtDescriptionRoom" MaxLength="150" CssClass="form-control" TextMode="MultiLine" placeholder="Descriptions.." aria-describedby="basic-addon2" runat="server" required></asp:TextBox>
                    </div>
                </div>

                <div class="mt-2 row">

                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">
                        <asp:LinkButton ID="LnkAddRoms" CssClass="btn btn-success" OnClick="LnkAddRoms_Click" runat="server">
                       
                        Add
                        </asp:LinkButton>

                        <asp:LinkButton ID="LnkUpdate" Visible="false" OnClick="LnkUpdate_Click" OnClientClick="return confirm('return confirm('Are you sure do you want to Update?')')" CssClass="btn btn-primary" runat="server">
                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                        Update
                        </asp:LinkButton>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">
                        <asp:LinkButton ID="LnkResetFoods" OnClick="LnkResetFoods_Click" CssClass="btn btn-warning" runat="server">
                       
                        Reset
                        </asp:LinkButton>
                    </div>
                </div>
                <br />
            </div>
            <div class="col-lg-8 col-md-6 col-sm-12">
                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card-header text-secondary" style="border-bottom: 5px solid #e67e22;">
                                <center>
                                    <div>
                                        <span style="font-size: 25px; font-weight: bold">List of Room
                                        </span>
                                    </div>
                                </center>
                            </div>
                            <div class="card-body">
                                <div class=" bx-pull-left">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-primary" type="button" >Search</button>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Search" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                    </div>
                                </div>
                                <div class="bx-pull-right">
                                    <div class="dropdown">
                                        <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">Sort by
                                        </a>

                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            <li>
                                                <asp:LinkButton ID="LnkAll" CssClass="nav-link text-secondary" runat="server">All</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="LnkFor1Person" CssClass="nav-link text-secondary" runat="server">For 1 Person</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="LnkForCouple" CssClass="nav-link text-secondary" runat="server">For Couple</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="LnkGoodfor4Person" CssClass="nav-link text-secondary" runat="server">Good for 4 Person</asp:LinkButton>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="LnkForFamily" CssClass="nav-link text-secondary" runat="server">For Family</asp:LinkButton>
                                            </li>

                                        </ul>
                                    </div>
                                    <br />
                                </div>

                                <div class="table table-responsive">
                                    <asp:GridView ID="GridRooms" AllowPaging="true" OnPageIndexChanging="GridRooms_PageIndexChanging" PageSize="5" HeaderStyle-Wrap="false" CssClass="table table-sm text-center table-hover text-secondary" GridLines="None" runat="server" ShowHeaderWhenEmpty="true" ShowHeader="true" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Picture" HeaderStyle-CssClass=" pt-3 pb-2 ">
                                                <ItemTemplate>
                                                    <img alt="" width="50" height="50" src="<%# Utils.GetImageUrl(Eval("roomImage01")) %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Room No." HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("rNumber") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Price" HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("rprice") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Compability" HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("rCompability") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Room Type" HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("rRoomType") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("rDescription") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-secondary pt-3 pb-2">
                                                <ItemTemplate>
                                                    <div class="dropdown">
                                                        <div class="btn-group dropup">
                                                            <asp:LinkButton ID="LinkButton2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                                                                              <i class="fa-solid fa-bars"></i>
                                                            </asp:LinkButton>
                                                            <ul class="dropdown-menu">
                                                                <li>
                                                                    <asp:LinkButton CommandArgument='<%# Eval("RoomId") %>' OnClick="LnkEdit_Click" ID="LnkEdit" CssClass="nav-link" runat="server">
                                                                <i class="fa-solid fa-pen-to-square"></i>
                                                               <span>Edit</span>
                                                                    </asp:LinkButton>
                                                                </li>
                                                                <li>
                                                                    <asp:LinkButton ID="LnkDelete" CommandArgument='<%# Eval("RoomId") %>' OnClick="LnkDelete_Click" OnClientClick="return confirm('Are you sure do you want to delete?')" CssClass="nav-link" runat="server">
                                                                 <i class="fa-sharp fa-solid fa-trash text-danger"></i>
                                                                 <span class="text-danger">Delete</span>
                                                                    </asp:LinkButton>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <center>
                                        <div>
                                            <span></span>
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <br />

    </div>
</asp:Content>
