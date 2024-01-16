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
    public partial class CheckOutFoods : System.Web.UI.Page
    {

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindCheckout();
                GetUserID();
                await BindOrderSummary();
                await BindUserInformation();
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
                GetUserID();
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(a.crtId) as Allitems_SP,sum(a.Crt_TotalPrice) as totalPrice from Tbl_Cart a inner join Tbl_Food b on b.FoodId = a.foodIdfk inner join Customer c on c.cusId = a.userIdfk where a.userIdfk=@userID and a.Crt_Status='Shipping'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_OrderSummaryCheckOut.DataSource = dt;
                        R_OrderSummaryCheckOut.DataBind();
                        R_OrderSummaryCheckOut.Visible = true;
                    }
                    else
                    {
                        R_OrderSummaryCheckOut.Visible = false;
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindUserInformation()
        {
            try
            {
                GetUserID();
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Customer where cusId='" + hndUserID.Value + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sad.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_UserInformation.Visible = true;
                        R_UserInformation.DataSource = dt;
                        R_UserInformation.DataBind();
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindCheckout()
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
                        R_CheckOutFoods.Visible = true;
                        R_CheckOutFoods.DataSource = dt;
                        R_CheckOutFoods.DataBind();
                        LnkNoCart.Visible = false;
                    }
                    else
                    {
                        LnkNoCart.Visible = true;
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

        private async Task ForApprovalCart()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string pending = "For Approval";
                    string updateQuerys = "update Tbl_Cart set Crt_Status='" + pending + "' where userID_fk='" + hndUserID.Value + "'";
                    SqlCommand cmd2 = new SqlCommand(updateQuerys, con);
                    await cmd2.ExecuteNonQueryAsync();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
      
        protected async void LnkProceedToContinue_Click(object sender, EventArgs e)
        {
            try
            {
                /*
                 Pessimistic Concurrency Control: Pessimistic Concurrency Control is a 
                technique used to prevent conflicts between multiple transactions trying to update or insert data. In this approach, locks are used to prevent other transactions
                from accessing the data until the transaction holding the lock has completed.
                 */
                decimal amount = Convert.ToDecimal(TxtAmount.Text.Trim());
                string aprov = "For Approval";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    var date = DateTime.Now.ToString();
                    lbldate.Text = date;
                    string query = "insert into Tbl_Payment (userID, txtAmount, orderStatus, orderDate,approval) " +
                        "values (@id, @amount, @stats, @date,@ap)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", hndUserID.Value);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@stats", DdlOrderStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@date", lbldate.Text);
                    cmd.Parameters.AddWithValue("@ap", aprov);
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        string pending = "For Approval";
                        string updateQuerys = "update Tbl_Cart set Crt_Status='" + pending + "', Crt_DatePurchase='" + lbldate.Text + "' where userIdfk='" + hndUserID.Value + "' and Crt_Status='Shipping'";
                        SqlCommand cmd2 = new SqlCommand(updateQuerys, con);
                        int a = await cmd2.ExecuteNonQueryAsync();
                        Response.Redirect("TransactionOrderSuccesfully!.aspx");
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