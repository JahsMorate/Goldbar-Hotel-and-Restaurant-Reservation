using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class CartFoods : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                await BindCart();
                await BindItem();
                await BindOrderSummary();
               
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private void GetUserID()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where cusername='" + Session["UserName"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            hndUserID.Value = dr.GetValue(0).ToString();
                            Session["UserID"] = Convert.ToInt32(hndUserID.Value);
                        }
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindCart()
        {
            try
            {
                GetUserID();
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select b.*, b.fimg01 as Crt_imageFood, a.* from Tbl_Cart a inner join Tbl_Food b on b.FoodId = a.foodIdfk where a.userIdfk='" + hndUserID.Value + "' and a.Crt_Status='Shipping'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sad.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewCart.Visible = true;
                        ListViewCart.DataSource = dt;
                        ListViewCart.DataBind();
                        LnkNoCart.Visible = false;
                        LnkBTnCheckOUt.Enabled = true;
                        LnkBTnCheckOUt.CssClass = "btn btn-block btn-primary";
                        LnkBTnCheckOUt.Text = "Proceed to Checkout";
                    }
                    else
                    {
                        LnkBTnCheckOUt.Enabled = false;
                        LnkBTnCheckOUt.Text = "Not Available";
                        LnkBTnCheckOUt.CssClass = "btn btn-block btn-secondary";
                        LnkNoCart.Visible = true;
                        ListViewCart.Visible = false;
                    }
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindOrderSummary()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    GetUserID();
                    await con.OpenAsync();

                    string query = "select COUNT(a.crtId) as Allitems_SP,sum(a.Crt_TotalPrice) as totalPrice from Tbl_Cart a inner join Tbl_Food b on b.FoodId = a.foodIdfk inner join Customer c on c.cusId = a.userIdfk where a.userIdfk=@userID and a.Crt_Status='Shipping'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_OrderSummary.DataSource = dt;
                        R_OrderSummary.DataBind();
                        R_OrderSummary.Visible = true;

                    }
                    else
                    {
                        R_OrderSummary.Visible = false;

                    }
                    
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }



        private async Task BindItem()
        {
            try
            {
                GetUserID();
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(CartID) as Items from Tbl_Cart where userID='" + hndUserID.Value + "' and Crt_Status='Shipping'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sad.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        AllitemFoods.DataSource = dt;
                        AllitemFoods.DataBind();
                    }
                  
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void ListViewCart_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewCart.FindControl("dataPageAll") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            _= this.BindCart();
        }

        protected void LnkRemove_Click(object sender, EventArgs e)
        {
            try
            {
                GetUserID();
                int cartID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string queyr = "Delete from Tbl_Cart where crtId='" + cartID + "' and userIdfk='" + hndUserID.Value + "'";
                    SqlCommand cmd = new SqlCommand(queyr, con);
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Removed Item Successfully!','','success')", true);
                        _=BindCart();
                        _=BindItem();
                        _= BindOrderSummary();
                    }
                    
                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void LnkNoCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }


        protected void LnkBTnCheckOUt_Click1(object sender, EventArgs e)
        {

            Response.Redirect("CheckOutFoods.aspx");

        }

        protected void LnkUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                _=BindCart();
                LinkButton button = (LinkButton)sender;

                ListViewItem item = (ListViewItem)button.NamingContainer;
                TextBox qty = (TextBox)item.FindControl("txtQty");
                Label pr = (Label)item.FindControl("LblPrice");
                HiddenField crtID = (HiddenField)item.FindControl("cartID");
                decimal qtys = Convert.ToDecimal(qty.Text);
                decimal price = Convert.ToDecimal(pr.Text);

                int crt = int.Parse(crtID.Value);
                decimal result = (qtys * price);

                if (qtys == 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Invalid','Quantity is required!','','danger')", true);
                }
                else
                {
                    using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                    {
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        string query = "update Tbl_Cart set Crt_Qty='" + qtys + "', Crt_TotalPrice='" + result + "'  where crtId='" + crt + "' and userIdfk='" + hndUserID.Value + "' and Crt_Status='Shipping'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        int up = cmd.ExecuteNonQuery();
                        if (up != 0)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Updated Successfully!','','success')", true);
                            _= BindCart();
                            _= BindItem();
                            _= BindOrderSummary();
                        }

                       
                    }
                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }
    }
}