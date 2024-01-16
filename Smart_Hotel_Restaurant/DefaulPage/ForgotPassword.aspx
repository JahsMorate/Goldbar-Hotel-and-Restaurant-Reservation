<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fogot Password</title>

      <%--Ths is for responsiveness for mobile--%>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <%--Ths is for responsiveness for mobile--%>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <div class="container pt-5">
            <div class="row"  style="border: none;">
                <div class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 col-sm-12 mr-5 ml-5">
                    <div class="card">
                        <div class="card-body" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 4px 16px, rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px; border:none;">
                            <div class="container-fluid">
                                <br />
                                <div class="row">
                                    <center>
                                        <div>
                                            <span style="font-weight: bold; font-size: 30px; color: #0b5ed7;">Password Recovery</span>
                                            <cente>
                                                <div>
                                                    <img src="../DesignImages/MenuService/forgot-password.png" class="img-fluid" width="150" />
                                                </div>
                                                <div>
                                                    <p>Enter your Email, Username and Contact Number for Authentication</p>
                                                </div>
                                            </cente>
                                        </div>
                                    </center>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" style="color: green; background-color: white;" id="basic-addon1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shield-lock-fill" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.777 11.777 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7.159 7.159 0 0 0 1.048-.625 11.775 11.775 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.541 1.541 0 0 0-1.044-1.263 62.467 62.467 0 0 0-2.887-.87C9.843.266 8.69 0 8 0zm0 5a1.5 1.5 0 0 1 .5 2.915l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99A1.5 1.5 0 0 1 8 5z" />
                                                    </svg>
                                                </span>

                                                <asp:TextBox ID="TxtVerification" class="form-control" placeholder="Enter your recovery authentication" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="d-grid gap-2">
                                            <asp:Button ID="BtnVerication" CssClass="btn btn-primary" runat="server" Text="Continue" OnClick="BtnVerication_Click" />
                                            
                                        </div>
                                        <center>
                                            <asp:LinkButton ID="LinkButton1" CssClass="nav-link" OnClick="LinkButton1_Click" runat="server">Create new account</asp:LinkButton>
                                        </center>
                                    </div>
                                </div>
                                 <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
