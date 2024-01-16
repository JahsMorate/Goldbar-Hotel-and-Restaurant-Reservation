using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class ViewCartStatus : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserID();
               await BindOverAllFoodOrder();
               await BindTotalBalanced();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindTotalBalanced()
        {
            try
            {
                string datePurchase = (Request.QueryString["datePurchase"]);
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string querys = "SELECT FORMAT(SUM(a.Crt_TotalPrice) + SUM(a.Crt_Qty), 'N2') as bayadan, FORMAT(b.txtAmount, 'N2') as gebaydan, FORMAT((SUM(a.Crt_TotalPrice) + SUM(a.Crt_Qty)) - b.txtAmount, 'N2') as customerBalanced, FORMAT(b.txtAmount / SUM(a.Crt_TotalPrice) * 100, 'N2')  as finalPurcento FROM Tbl_Cart a  INNER JOIN Tbl_Payment b ON b.orderDate = a.Crt_DatePurchase WHERE a.Crt_DatePurchase=@date GROUP BY b.txtAmount";
                SqlCommand cmd = new SqlCommand(querys, con);
                cmd.Parameters.AddWithValue("@date", datePurchase);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ROderSummary.DataSource = dt;
                    ROderSummary.DataBind();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindOverAllFoodOrder()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    GetUserID();
                    await con.OpenAsync();
                    string datePurchase = (Request.QueryString["datePurchase"]);
                    string querys = "select a.*, b.*, c.fimg01 as foodImage, c.* from Tbl_Cart a  inner join Tbl_Food c on c.FoodId = a.foodIdfk inner join Tbl_Payment b on b.orderDate = a.Crt_DatePurchase where a.Crt_DatePurchase='" + datePurchase + "' ";
                    SqlCommand cmd = new SqlCommand(querys, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RAllOrderStatus.DataSource = dt;
                        RAllOrderStatus.DataBind();
                        lnkOrderSuccesfully.Visible = false;
                        lnkReturn.Visible = false;
                        foreach (RepeaterItem item in RAllOrderStatus.Items) 
                        {
                            Label status = (Label)item.FindControl("lblCartStatus");
                            LinkButton suces = (LinkButton)item.FindControl("");
                            
                            string sts = status.Text.Trim();
                            if (sts == "Approved")
                            {
                                lnkOrderSuccesfully.Visible = true;
                                RAllOrderStatus.Visible = false;
                                ROderSummary.Visible = false;
                            }
                            if (sts == "Return")
                            {
                                lnkReturn.Visible = true;
                                RAllOrderStatus.Visible = false;
                                ROderSummary.Visible = false;
                            }
                        }
                    }
                    
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
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
    }
}