<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Foods.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.Foods" Async="true" %>

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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <span style="font-size: 25px; font-weight: bold;">Foods Form</span>
    <div class="container-fluid mt-3">

        <!--Monitor the foods-->
        <div class="row">
            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/healthy-drink%20(1).png" />

                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Beverage</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="R_Beverage" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("Beverages") %>
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
            </div>

            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/breakfast%20(1).png" />

                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Breakfast</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="RBreakFast" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("Breakfasts") %>
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
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">

                                    <img src="../DesignImages/MenuService/fried-rice.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Lunch</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="RLunchs" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("Lunchs") %>
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
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/turkey.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Dinner</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="RDinners" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("Dinners") %>
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
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/burger.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Fast food</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="RFasFoods" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("FasFoods") %>
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
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">

                                    <img src="../DesignImages/MenuService/best-seller.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Best Seller</span>

                                        <h4>
                                            <center>
                                                <center>
                                                    <asp:Repeater ID="RBestSellers" runat="server">
                                                        <ItemTemplate>
                                                            <%# Eval("BestSellers") %>
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
            </div>
        </div>
        <!--Monitor the foods-->

        <div class="row">

            <div class="col-lg-4 col-md-6 col-sm-12" style="background-color: white; border-radius: 14px;">

                <!--This is Start-->
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <center>

                                <img id="imgview" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />

                                <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" runat="server" />
                            </center>

                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <center>
                                <img id="imgview2" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL2(this);" ID="FileUpload2" runat="server" />
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview3" style="height: 250px; width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <asp:FileUpload onchange="readURL3(this);" ID="FileUpload3" runat="server" />
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
                <br />
                <div class="row">
                    <div>
                        <asp:CheckBox ID="CheckBestSeller" runat="server" />
                        <span><i class="fa-sharp fa-solid fa-crown text-warning pr-2"></i>Best Seller</span>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Name" runat="server" />
                            <div class="input-group mb-3">
                                <span class="input-group-text text-success" id="basic-addon3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text-fill" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z" />
                                    </svg>
                                </span>
                                <asp:TextBox ID="TxtFoodsName" MaxLength="15" CssClass="form-control" placeholder="Enter Food Name" aria-describedby="basic-addon3" runat="server" required></asp:TextBox>
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
                                <%--This is the ID of Foods--%>

                                <asp:HiddenField ID="HndFoodID" runat="server" />
                                <%--This is the ID of Foods--%>
                                <asp:TextBox ID="TxtPrice" MaxLength="6" TextMode="Number" CssClass="form-control" placeholder="Enter Price" aria-describedby="basic-addon1" runat="server" required></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <div class="form-group">
                                <asp:Label Text="Description" runat="server" />
                                <div class="input-group mb-3">
                                    <span class="input-group-text text-success" id="basic-addon2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-quote-fill" viewBox="0 0 16 16">
                                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm7.194 2.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 4C4.776 4 4 4.746 4 5.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 7.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 4c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z" />
                                        </svg>
                                    </span>
                                    <asp:TextBox ID="TxtFoodsDescription" MaxLength="350" CssClass="form-control" TextMode="MultiLine" placeholder="Descriptions.." aria-describedby="basic-addon2" runat="server" required></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">

                        <div class="form-group">
                            <asp:Label Text="Category" runat="server" />
                            <asp:DropDownList ID="DdlFoodsCategory" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="Beverage" Value="Beverage"></asp:ListItem>
                                <asp:ListItem Text="Breakfast" Value="Breakfast"></asp:ListItem>
                                <asp:ListItem Text="Lunch" Value="Lunch"></asp:ListItem>
                                <asp:ListItem Text="Dinner" Value="Dinner"></asp:ListItem>
                                <asp:ListItem Text="Fast food" Value="Fast food"></asp:ListItem>
                               
                            </asp:DropDownList>

                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">

                        <asp:LinkButton ID="LnkAddFoods" CssClass="btn btn-primary btn-md" OnClick="LnkAddFoods_Click" runat="server">
                       
                        Add
                        </asp:LinkButton>

                        <asp:LinkButton ID="LnkUpdate" OnClick="LnkUpdate_Click" OnClientClick="return confirm('Are you sure do you want to update?')" Visible="false" CssClass="btn btn-primary btn-md" runat="server">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                        Update
                        </asp:LinkButton>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">
                        <asp:LinkButton ID="LnkResetFoods" CssClass="btn btn-warning btn-md" OnClick="LnkResetFoods_Click" runat="server">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
                            <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
                        </svg>
                        Reset
                        </asp:LinkButton>
                    </div>
                </div>
                <br />
            </div>

            <%-- This is for View all the foods--%>
            <div class="col-lg-8 col-md-6 col-sm-12" style="background-color: white;">

                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <br />
                        <div class="dropdown">
                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">Sort by
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li>
                                    <asp:LinkButton ID="LinkButton1" CssClass="nav-link text-secondary" OnClick="LinkButton1_Click" runat="server">All</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkBeverage" CssClass="nav-link text-secondary" OnClick="LnkBeverage_Click" runat="server">Beverage</asp:LinkButton>
                                </li>

                                <li>
                                    <asp:LinkButton ID="LnkLunch" CssClass="nav-link text-secondary" OnClick="LnkLunch_Click" runat="server">Lunch</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkDinner" CssClass="nav-link text-secondary" OnClick="LnkDinner_Click" runat="server">Dinner</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkFastFoods" CssClass="nav-link text-secondary" OnClick="LnkFastFoods_Click" runat="server">Fast food</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkBestSeller" CssClass="nav-link text-secondary" runat="server" OnClick="LnkBestSeller_Click">Best Seller</asp:LinkButton>
                                </li>

                            </ul>
                        </div>
                        <br />
                    </div>
                </div>

                <table class="table p-0 m-0 table-responsive table-stripe table-hover table-bordered table-sm">
                    <tbody>
                        <asp:ListView ID="ListViewAllFoods" OnPagePropertiesChanging="BindAll_PagePropertiesChanging" GroupPlaceholderID="GroupID" ItemPlaceholderID="itemID" runat="server">
                            <LayoutTemplate>
                                <thead>
                                    <tr style="background-color: #fd7e14;" class="text-white">

                                        <th scope="col" class="text-center  pt-3 pb-3">Image</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Food Name</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Price</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Description</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Status</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Category</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Action</th>
                                    </tr>
                                    <tr id="GroupID" runat="server"></tr>
                                    <tr>
                                        <td colspan="7" style="text-align: center;">
                                            <asp:DataPager ID="dataPageAll" runat="server" PagedControlID="ListViewAllFoods" PageSize="8">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-primary" NextPreviousButtonCssClass="btn btn-warning" NumericButtonCssClass="btn btn-outline-primary" />
                                                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </thead>
                                </thead>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr>
                                    <tr id="itemID" runat="server"></tr>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="text-center text-secondary">
                                        <img src="<%# Utils.GetImageUrl(Eval("fimg01")) %>" style="max-width: 35px; max-height: 35px; width: 35px; height: 35px;" class="img-fluid" />
                                    </td>

                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblFoodName" runat="server" Style="color: black;" Text='<%# Eval("foodName") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblPrice" runat="server" Style="color: #d35400;" Text='<%# Eval("fprice","{0:N2}") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <small>
                                            <asp:Label ID="LblDescription" runat="server" CssClass="text-muted" Text='<%# Eval("fDecription") %>'></asp:Label>
                                        </small>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblStatus" runat="server" CssClass="text-primary" Text='<%# Eval("fStatus") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblCategory" runat="server" Text='<%# Eval("fCategory") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <div class="dropdown">
                                            <div class="btn-group dropup">
                                                <asp:LinkButton ID="LinkButton2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                                                                              <i class="fa-solid fa-bars"></i>
                                                </asp:LinkButton>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <asp:LinkButton CommandArgument='<%# Eval("FoodId") %>' ID="LnkEdit" CssClass="nav-link text-success" OnClick="LnkEdit_Click" runat="server">
                                                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                                                        <span>Edit</span>
                                                        </asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LnkDelete" CommandArgument='<%# Eval("FoodId") %>' OnClientClick="return confirm('Are you sure do you want to delete?')" OnClick="LnkDelete_Click" CssClass="nav-link" runat="server">
                                                                                         <i class="fa-sharp fa-solid fa-trash text-danger"></i>
                                                                                         <span class="text-danger">Delete</span>
                                                        </asp:LinkButton>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <p>No Data Found</p>
                            </EmptyDataTemplate>
                        </asp:ListView>

                    </tbody>
                </table>


            </div>


        </div>
    </div>

</asp:Content>
