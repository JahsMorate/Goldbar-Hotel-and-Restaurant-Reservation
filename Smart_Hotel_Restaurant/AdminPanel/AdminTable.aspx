<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminTable.aspx.cs" Inherits="Smart_Hotel_Restaurant.AdminPanel.AdminTable" Async="true" %>

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

    <span style="font-size: 25px; font-weight: bold;">Table Form</span>

    <div class="container-fluid mt-3">
        <div class="row mb-2">
            <div class="col-lg-4 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/TableArea.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Luzon</span>

                                        <h4>
                                            <center>
                                                <asp:Repeater ID="RLuzons" runat="server">
                                                    <ItemTemplate>
                                                        <%# Eval("Luzons") %>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>

                                    </div>
                                    <br />
                                    <br />
                                    <div>
                                        <b>Table Area</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/TableArea.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Visayas</span>

                                        <h4>
                                            <center>
                                                <asp:Repeater ID="RVisayas" runat="server">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("Visayas") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>

                                    </div>
                                    <br />
                                    <br />
                                    <div>
                                        <b>Table Area</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12 p-1 pt-2 pb-2">
                <div class="card" style="box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border: none; border-radius: 9px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="row p-0">
                                <div class="col-lg-12 col-sm-12 col-md-12 p-0">
                                    <img src="../DesignImages/MenuService/TableArea.png" />
                                    <div class=" mt-3 fa-pull-right">

                                        <span class="text-secondary" style="text-align: right;">Mindanao</span>
                                        <h4>
                                            <center>
                                                <asp:Repeater ID="RMindanao" runat="server">
                                                    <ItemTemplate>
                                                        <%# Eval("Mindanaos") %>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </center>
                                            <span style="font-size: 15px;"></span>
                                        </h4>

                                    </div>
                                    <br />
                                    <br />
                                    <div>
                                        <b>Table Area</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12" style="background-color: white; border-radius: 14px;">

                <!--This is Start-->

                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">

                    <div class="carousel-inner">

                        <div class="carousel-item active" data-bs-interval="10000">
                            <center>

                                <img id="imgview" class="pt-3" style="max-height: 250px; max-width: 250px; min-height: 250px; min-width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />

                                <small>
                                    <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" runat="server" />
                                </small>
                            </center>

                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <center>
                                <img id="imgview2" class="pt-3" style="max-height: 250px; max-width: 250px; min-height: 250px; min-width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <small>
                                    <asp:FileUpload onchange="readURL2(this);" ID="FileUpload2" runat="server" />
                                </small>
                            </center>
                        </div>
                        <div class="carousel-item">
                            <center>
                                <img id="imgview3" class="pt-3" style="max-height: 250px; max-width: 250px; min-height: 250px; min-width: 250px;" src="../DesignImages/Icon/FnoImage.png" /><br />
                                <small>
                                    <asp:FileUpload onchange="readURL3(this);" ID="FileUpload3" runat="server" />
                                </small>
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

                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Table Area" runat="server" />
                            <asp:DropDownList ID="DdlArea" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="-- Select --" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="Luzon" Value="Luzon"></asp:ListItem>
                                <asp:ListItem Text="Visayas" Value="Visayas"></asp:ListItem>
                                <asp:ListItem Text="Mindanao" Value="Mindanao"></asp:ListItem>
                            </asp:DropDownList>
                            <div>
                                <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="DdlArea" InitialValue="Select" runat="server" ErrorMessage="Required in this field"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Table Type" runat="server" />
                            <asp:DropDownList ID="DdlTableType" CssClass="form-select text-secondary" runat="server">
                                <asp:ListItem Text="-- Select --" Value="Select"></asp:ListItem>
                               
                                <asp:ListItem Text="2 Persons" Value="2 Persons"></asp:ListItem>
                                <asp:ListItem Text="4 Persons" Value="4 Persons"></asp:ListItem>
                                <asp:ListItem Text="6 Persons" Value="6 Persons"></asp:ListItem>
                                <asp:ListItem Text="Family Size" Value="Family Size"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="DdlTableType" InitialValue="Select" runat="server" ErrorMessage="Required in this field"></asp:RequiredFieldValidator>
                            </small>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-6 col-md-6 col-md-12">
                        <div class="form-group">
                            <asp:Label Text="Description" runat="server" />
                            <div class="input-group mb-3">
                                <span class="input-group-text text-success" id="basic-addon2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-quote-fill" viewBox="0 0 16 16">
                                        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm7.194 2.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 4C4.776 4 4 4.746 4 5.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 7.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 4c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z" />
                                    </svg>
                                </span>
                                <asp:TextBox ID="TxtDescriptionRoom" TextMode="MultiLine" CssClass="form-control" placeholder="Descriptions.." aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="TxtDescriptionRoom" runat="server" ErrorMessage="Required in this field"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-md-12">
                        <asp:HiddenField ID="hndTableID" runat="server" />
                        <div class="form-group">
                            <asp:Label Text="Table No." runat="server" />
                            <div class="input-group mb-3">
                                <span class="input-group-text text-success" id="basic-addon7">
                                    <i class="fa-solid fa-hashtag"></i>
                                </span>
                                <asp:TextBox ID="TxtTableNo" CssClass="form-control" placeholder="Enter Table No." aria-describedby="basic-addon7" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="TxtTableNo" runat="server" ErrorMessage="Required in this field"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-lg-6 col-md-6 col-sm-12 d-grid gap-2">
                        <asp:LinkButton ID="LnkAddTable" CssClass="btn btn-primary btn-md" OnClick="LnkAddTable_Click" runat="server">
                       
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
                        <asp:LinkButton ID="LnkResetFoods" OnClick="LnkResetFoods_Click" CssClass="btn btn-warning btn-md" runat="server">
                            Reset
                        </asp:LinkButton>
                    </div>
                </div>
                <br />
            </div>

            <%-- This is for View all the foods--%>
            <div class="col-lg-8 col-md-6 col-sm-12" style="background-color: white;">

              

                <table class="table p-0 m-0 table-responsive table-stripe table-hover table-bordered table-sm">
                    <tbody>
                        <asp:ListView ID="ListViewTable" OnPagePropertiesChanging="ListViewTable_PagePropertiesChanging" GroupPlaceholderID="GroupID" ItemPlaceholderID="itemID" runat="server">
                            <LayoutTemplate>
                                <thead>
                                    <tr style="background-color: #fd7e14;" class="text-white">

                                        <th scope="col" class="text-center  pt-3 pb-3">Image</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Table No.</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Table Area</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Compability</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Description</th>
                                        <th scope="col" class="text-center  pt-3 pb-3">Status</th>

                                        <th scope="col" class="text-center  pt-3 pb-3">Action</th>
                                    </tr>
                                    <tr id="GroupID" runat="server"></tr>
                                    <tr>
                                        <td colspan="7" style="text-align: center;">
                                            <asp:DataPager ID="dataPageAll" runat="server" PagedControlID="ListViewTable" PageSize="9">
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
                                        <img src="<%# Utils.GetImageUrl(Eval("timage01")) %>" style="max-width: 35px; max-height: 35px; width: 35px; height: 35px;" class="img-fluid" />
                                    </td>

                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblFoodName" runat="server" Style="color: black;" Text='<%# Eval("table_No") %>'></asp:Label>
                                    </td>

                                    <td class="text-center text-secondary">
                                        <small>
                                            <asp:Label ID="LblDescription" runat="server" CssClass="text-muted" Text='<%# Eval("table_area") %>'></asp:Label>
                                        </small>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblStatus" runat="server" CssClass="text-primary" Text='<%# Eval("table_type") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="LblCategory" runat="server" Text='<%# Eval("table_desc") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("table_status") %>'></asp:Label>
                                    </td>
                                    <td class="text-center text-secondary">
                                        <div class="dropdown">
                                            <div class="btn-group dropup">
                                                <asp:LinkButton ID="LinkButton2" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" runat="server">
                                                      <i class="fa-solid fa-bars"></i>
                                                </asp:LinkButton>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <asp:LinkButton CommandArgument='<%# Eval("TblId") %>' ID="LnkEdit" CausesValidation="false" OnClick="LnkEdit_Click" CssClass="nav-link text-success" runat="server">
                                                               <i class="fa-solid fa-pen-to-square"></i>
                                                               <span>Edit</span>
                                                        </asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LnkDelete" OnClick="LnkDelete_Click" CommandArgument='<%# Eval("TblId") %>' OnClientClick="return confirm('Are you sure do you want to delete?')" CssClass="nav-link" runat="server" CausesValidation="false">
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
