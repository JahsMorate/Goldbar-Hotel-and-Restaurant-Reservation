<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionOrderSuccesfully!.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.TransactionOrderSuccesfully_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Successfully!</title>
    <!--This is For Applicable For Mobile Start-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--This is For Applicable For Mobile End-->
    <link href="../fontawesome-free-6.2.1-web/css/all.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body style="background-color: #dfe4ea87;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="offset-lg-2 col-lg-8 offset-md-3 col-md-6 col-sm-12" style="display: flex; justify-content: center; align-items: center; text-align: center; min-height: 100vh;">
                    <div class="card p-4" style="box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px; border: none;">
                        <div class="card-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div>
                                        <center>
                                            <img src="../DesignImages/Icon/successful.png" width="150" />
                                        </center>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <span style="font-size: 30px; color: #2ed573; font-weight: bold;">
                                            <label>Transaction Successfully</label></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">

                                        <span style="font-size: 17px; color: #747d8c; font-weight: 400;">
                                            <label><b>Hi! My Dear Customer,</b></label>
                                            <label>Please wait a moment your order is under approval by the admin</label>
                                        </span>
                                    </div>

                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <div class="d-grid gap-2">
                                            <asp:LinkButton ID="LnkCart" OnClick="LnkCart_Click" CssClass="btn btn-primary btn-lg" runat="server">
                                               <i class="fa-solid fa-cart-shopping pr-2"></i>
                                                Order Again
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <div class="d-grid gap-2">
                                            <asp:LinkButton ID="LnkCheckYourORder" CssClass="btn text-primary btn-lg" runat="server" OnClick="LnkCheckYourORder_Click">
                                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-calendar2-check-fill" viewBox="0 0 16 16">
                                                  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zm9.954 3H2.545c-.3 0-.545.224-.545.5v1c0 .276.244.5.545.5h10.91c.3 0 .545-.224.545-.5v-1c0-.276-.244-.5-.546-.5zm-2.6 5.854a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                                                </svg>
                                                Check Order
                                            </asp:LinkButton>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
