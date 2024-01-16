    <%@ Page Title="Admin Room Reservation" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminRoomReservation.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.AdminRoomReservation" EnableEventValidation="false" Async="true" %>

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

    <!--Monitor the foods-->

    <div class="container-fluid">
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
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="form-group">
                            <label>Room Name <span class="text-danger"><b>*</b></span></label>
                            <div class="input-group mb-0">
                                <span class="input-group-text text-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tags-fill" viewBox="0 0 16 16">
                                        <path d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                        <path d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z" />
                                    </svg>
                                </span>
                                <%--This is the ID of Foods--%>

                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <%--This is the ID of Foods--%>
                                <asp:TextBox ID="txtFname" MaxLength="50" CssClass="form-control" placeholder="Enter Room Name" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtFname" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <label>Room Number <span class="text-danger"><b>*</b></span></label>
                            <div class="input-group mb-0">
                                <span class="input-group-text text-success" id="basic-addon3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text-fill" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H4.414a1 1 0 0 0-.707.293L.854 15.146A.5.5 0 0 1 0 14.793V2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5z" />
                                    </svg>
                                </span>
                                <asp:HiddenField ID="rrhnd" runat="server" />
                                <asp:TextBox ID="TxtRRName" TextMode="Number" MaxLength="40" CssClass="form-control" placeholder="Enter Room Numbers" aria-describedby="basic-addon3" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtRRName" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <label>Price/Per Night <span class="text-danger"><b>*</b></span></label>
                            <div class="input-group mb-0">
                                <span class="input-group-text text-success" id="basic-addon1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tags-fill" viewBox="0 0 16 16">
                                        <path d="M2 2a1 1 0 0 1 1-1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 2 6.586V2zm3.5 4a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                        <path d="M1.293 7.793A1 1 0 0 1 1 7.086V2a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l.043-.043-7.457-7.457z" />
                                    </svg>
                                </span>
                                <%--This is the ID of Foods--%>

                                <asp:HiddenField ID="HndRRID" runat="server" />
                                <%--This is the ID of Foods--%>
                                <asp:TextBox ID="TxtRPrice" MaxLength="20" TextMode="Number" CssClass="form-control" placeholder="Enter Price" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtRPrice" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label>Bed <span class="text-danger"><b>*</b></span></label>
                            <asp:DropDownList ID="ddlBed" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                              
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>

                            </asp:DropDownList>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="Select" ControlToValidate="ddlBed" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="form-group">
                            <label>Bathroom <span class="text-danger"><b>*</b></span></label>
                            <asp:DropDownList ID="ddbathRoom" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="Select" ControlToValidate="ddbathRoom" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label>Guest <span class="text-danger"><b>*</b></span></label>
                            <asp:DropDownList ID="DdlCompability" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="1 Person" Value="1 Person"></asp:ListItem>
                                <asp:ListItem Text="2 Persons" Value="2 Persons"></asp:ListItem>
                                <asp:ListItem Text="4 Persons" Value="4 Persons"></asp:ListItem>
                                <asp:ListItem Text="6 Persons" Value="6 Persons"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="Select" ControlToValidate="DdlCompability" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label>Floor <span class="text-danger"><b>*</b></span></label>
                            <asp:DropDownList ID="ddlFloor" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="Select" ControlToValidate="ddlFloor" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="form-group">
                            <div class="form-group">
                                <label>Description <span class="text-danger"><b>*</b></span></label>
                                <div class="input-group mb-0">
                                    <span class="input-group-text text-success" id="basic-addon2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-quote-fill" viewBox="0 0 16 16">
                                            <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm7.194 2.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 4C4.776 4 4 4.746 4 5.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 7.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 4c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z" />
                                        </svg>
                                    </span>
                                    <asp:TextBox ID="TxtRRDescription" MaxLength="300" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Descriptions.." aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div>
                                <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtRRDescription" ForeColor="Red" runat="server" ErrorMessage="This is required"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row mt-2">
                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">

                        <asp:LinkButton ID="LnkRoomReservation" CssClass="btn btn-primary btn-md" runat="server" OnClick="LnkRoomReservation_Click">
                        Add
                        </asp:LinkButton>

                        <asp:LinkButton ID="LnkUpdateRRR" OnClientClick="return confirm('Are you sure do you want to update?')" Visible="false" CssClass="btn btn-primary btn-md" runat="server" OnClick="LnkUpdateRRR_Click">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                        Update
                        </asp:LinkButton>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">
                        <asp:LinkButton ID="LnkResetRR" CausesValidation="false" CssClass="btn btn-warning btn-md" runat="server" OnClick="LnkResetRR_Click">
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

            <div class="col-lg-8 col-md-6 col-sm-12" style="background-color: white;">

                <div class="row">

                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <br />
                        <%-- <div class="dropdown">
                            <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">Sort by
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li>
                                    <asp:LinkButton ID="LinkButton1" CssClass="nav-link text-secondary" runat="server">All</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkBeverage" CssClass="nav-link text-secondary" runat="server">Luzon</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkBreakFast" CssClass="nav-link text-secondary" runat="server">Visayas</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkLunch" CssClass="nav-link text-secondary" runat="server">Mindanao</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkDinner" CssClass="nav-link text-secondary" runat="server">1 Person</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkFastFoods" CssClass="nav-link text-secondary" runat="server">2 Person</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LnkBestSeller" CssClass="nav-link text-secondary" runat="server">4 Person</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="LinkButton3" CssClass="nav-link text-secondary" runat="server">6 Person</asp:LinkButton>
                                </li>
                            </ul>
                        </div>--%>
                        <br />
                    </div>
                </div>

                <table class="table p-0 m-0 table-responsive table-stripe table-hover table-bordered table-sm">
                    <tbody>
                        <asp:ListView ID="LnkViewRR" OnPagePropertiesChanging="LnkViewRR_PagePropertiesChanging" GroupPlaceholderID="GroupID" ItemPlaceholderID="itemID" runat="server">
                            <LayoutTemplate>
                                <thead>
                                    <tr style="background-color: #fd7e14;" class="text-white">
                                        <th scope="col" class="text-center  pt-3 pb-3">Image</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Room Name</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Room No.</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Room Price <small>Per Night</small></th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Guest</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Bed</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Bathroom</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Floor</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Status</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Action</th>
                                    </tr>
                                    <tr id="GroupID" runat="server"></tr>
                                    <tr>
                                        <td colspan="10" style="text-align: center;">
                                            <asp:DataPager ID="dataPageAll" runat="server" PagedControlID="LnkViewRR" PageSize="5">
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

                                        <img src="<%# Utils.GetImageUrl(Eval("rimg01")) %>" style="max-width: 35px; max-height: 35px; width: 35px; height: 35px;" class="img-fluid" />
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="lbRname" runat="server" Style="color: black;" Text='<%# Eval("rrFname") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="lblRRname" runat="server" Style="color: black;" Text='<%# Eval("rrnumber") %>'></asp:Label>
                                    </td>

                                    <td class="text-center text-secondary">
                                        <small>
                                            <asp:Label ID="lblRRprice" runat="server" CssClass="text-muted" Text='<%# Eval("rrPrice") %>'></asp:Label>
                                        </small>
                                    </td>

                                    <asp:Label ID="lblRRdescription" Visible="false" runat="server" CssClass="text-muted" Text='<%# Eval("rrDescription") %>'></asp:Label>

                                    <td class="text-center text-secondary">
                                        <asp:Label ID="lblCompability" runat="server" Text='<%# Eval("rrCompability") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("rrBed") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("rrBathroom") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("rrFloor") %>'></asp:Label>
                                    </td>

                                    <td class="text-center text-secondary">
                                        <asp:Label ID="lblStatuts" runat="server" Text='<%# Eval("rrStatus") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <div class="dropdown">
                                            <div class="btn-group dropup">
                                                <asp:LinkButton ID="LinkButton2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                                                      <i class="fa-solid fa-bars"></i>
                                                </asp:LinkButton>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <asp:LinkButton CommandArgument='<%# Eval("RRId") %>' ID="LnkEdit" CausesValidation="false" CssClass="nav-link text-success" runat="server" OnClick="LnkEdit_Click">
                                                               <i class="fa-solid fa-pen-to-square"></i>
                                                               <span>Edit</span>
                                                        </asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LnkDelete" CommandArgument='<%# Eval("RRId") %>' CausesValidation="false" OnClientClick="return confirm('Are you sure do you want to delete?')" CssClass="nav-link" runat="server" OnClick="LnkDelete_Click">
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
