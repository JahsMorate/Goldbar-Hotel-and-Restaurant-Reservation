<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Smart_Hotel_Restaurant.DefaulPage.ResetPassword" Async="true" %>

<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password | Gold Bar Tandag</title>

    <%--Ths is for responsiveness for mobile--%>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../fontawesome-free-6.2.1-web/css/all.css" rel="stylesheet" />
    <%--Ths is for responsiveness for mobile--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script type="text/javascript">
        $(function () {
            $("#toggle_pwd").click(function () {
                $(this).toggleClass("fa-eye fa-eye-slash");
                var type = $(this).hasClass("fa-eye-slash") ? "text" : "password";
                $("[id*=txtPassword]").attr("type", type);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 col-sm-12">
                    <div class="card" style="border: none;">
                        <div class="card-body" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 4px 16px, rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px; border: none;">
                            <div class="container-fluid">
                                <br />
                                <center>
                                    <div>
                                        <span style="font-weight: bold; font-size: 30px; color: #0b5ed7;">User Information</span>
                                    </div>
                                </center>
                                <div class="row">
                                    <asp:Repeater ID="RptrUserVerification" runat="server">
                                        <ItemTemplate>
                                            <center>
                                                <asp:Label style="color: #576574; font-weight: bold; font-size: 25px;" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                                <asp:Label style="color: #576574; font-weight: bold; font-size: 25px;" runat="server" Text='<%# Eval("fname ") %>'></asp:Label>
                                                <asp:Label style="color: #576574; font-weight: bold; font-size: 25px;" runat="server" Text='<%# Eval("mi") %>'></asp:Label>
                                            </center>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <center>

                                        <div>
                                            <asp:LinkButton ID="LnkButtonProces" Visible="false" OnClick="LnkButtonProces_Click" CssClass="nav-link" runat="server">Please Click here to proceed to Homepage</asp:LinkButton>
                                        </div>
                                    </center>
                                </div>
                                <div class="row">
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                    </div>
                                    <div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be contain 8 character/1 Upper case/1 Lower case/ 1 Number and Special Character." ControlToValidate="txtPassword" ForeColor="#FF3300" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!$*?&amp;]{8,}"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <asp:Label Text="Reset your Password" runat="server" />
                                        <div class="form-group">
                                            <div class="input-group flex-nowrap">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="saddon-wrapping">
                                                        <i class="fa-solid fa-lock"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox ID="txtPassword" MaxLength="20" TextMode="Password" placeholder="Atleast 8 Characters" CssClass="form-control" aria-describedby="saddon-wrapping" runat="server" required></asp:TextBox>
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="saddon-wrappins">
                                                        <span id="toggle_pwd" class="fa fa-fw fa-eye field_icon" style="cursor: pointer;"></span>
                                                    </span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="d-grid gap-2">
                                            <asp:Button ID="BtnVerication" CssClass="btn btn-primary" runat="server" Text="Confirm" OnClick="BtnVerication_Click" />
                                        </div>
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
