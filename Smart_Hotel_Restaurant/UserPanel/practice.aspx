<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/UserPanel.Master" AutoEventWireup="true" CodeBehind="practice.aspx.cs" Inherits="Smart_Hotel_Restaurant.UserPanel.practice" %>
<%@ Import Namespace="Smart_Hotel_Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <div class="row"> 
            <div class="col-lg-12 col-md-12 col-sm-12">
                <center>
                <span style="font-size:30px; font-weight: bold;">
                    Seller List
                </span>
            </center>
            </div>
        </div>
        <br />
        
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                   <div class="table table-responsive">
                    <asp:GridView ID="Grid_Cart" DataKeyNames="CartID" HeaderStyle-Wrap="false" CssClass="table table-sm text-center table-hover" GridLines="None" runat="server" ShowHeaderWhenEmpty="true" ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="Grid_Cart_PageIndexChanging" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="Image" HeaderStyle-CssClass="table-secondary">
                                <ItemTemplate>
                                    
                                    <img alt="" width="50" height="50" src="<%# Utils.GetImageUrl(Eval("Crt_imageFood")) %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Food Name" HeaderStyle-CssClass="table-secondary">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Crt_foodName") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category" HeaderStyle-CssClass="table-secondary">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Crt_category") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" HeaderStyle-CssClass="table-secondary">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TxtQty" Text='<%# Eval("Crt_qty") %>'  runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Crt_qty") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Price" HeaderStyle-CssClass="table-secondary">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Crt_totalPrice") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-secondary">
                                <ItemTemplate>
                                   <asp:LinkButton ID="LinkDelete" CommandName="DELETE" CssClass="nav-link" runat="server" >Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
