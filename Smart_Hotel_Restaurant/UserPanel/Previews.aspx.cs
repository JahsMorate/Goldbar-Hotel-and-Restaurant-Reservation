using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class Previews : System.Web.UI.Page
    {

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                await PriviewFoods();
                GetUserID();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        
        private async Task PriviewFoods()
        {
            try
            {
                int Food = Convert.ToInt32(Request.QueryString["FoodID"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where FoodId='" + Food + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RPreveiws.DataSource = dt;
                        RPreveiws.DataBind();
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
                /*
                    Preview pane: This algorithm involves displaying a preview pane alongside 
                the data entry form, which allows the user to see a 
                preview of the data as they enter it, before it is saved to the database.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT * FROM Customer WHERE cusername='" + Session["UserName"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            HndUserID.Value = dr.GetValue(0).ToString();
                        }
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkAddtoCart_Click(object sender, EventArgs e)
        {
            GetUserID();
            LinkButton button = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            // Retrieve data from repeater 

            HiddenField hdnFoodID = (HiddenField)item.FindControl("hdnFoodID");

            Image image = (Image)(item.FindControl("firstImage"));
            Label Staus = (Label)(item.FindControl("LblStatu"));
            Label Description = (Label)(item.FindControl("LblFDesription"));
            Label lblFCategory = (Label)(item.FindControl("LblbCatory"));
            Label lblFoodsName = (Label)(item.FindControl("LbkFoodsName"));
            TextBox quantityTextBox = (TextBox)item.FindControl("txtPrice");
            Label price = (Label)item.FindControl("LblPrice");

            string cartStatus = "Shipping";
            // Retrieve data from repeater 
            int userID = Convert.ToInt32(HndUserID.Value);
            var prices = price.Text.Trim();



            int foodID = Convert.ToInt32(hdnFoodID.Value);
            var quantity = quantityTextBox.Text.Trim();
            int productId = int.Parse(button.CommandArgument);

            decimal qty = Convert.ToDecimal(quantity);
            if (qty < 0 || qty == 0)
            {
                Response.Write("<script>alert('Please Enter Proper Quantity')</script>");
            }
            else
            {

                decimal pr = Convert.ToDecimal(prices);
                decimal result = qty * pr;
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {

                    await con.OpenAsync();

                    string query = "insert into Tbl_Cart(userIdfk, foodIdfk, Crt_OriginalPrice, Crt_Qty, Crt_TotalPrice, Crt_Status) " +
                        "values (@userIdfk,@foodIdfk,@Crt_OriginalPrice,@Crt_Qty,@Crt_TotalPrice,@Crt_Status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userIdfk", userID);
                    cmd.Parameters.AddWithValue("@foodIdfk", foodID);
                    cmd.Parameters.AddWithValue("@Crt_OriginalPrice", price.Text.Trim());
                    cmd.Parameters.AddWithValue("@Crt_Qty", qty);
                    cmd.Parameters.AddWithValue("@Crt_TotalPrice", result);
                    cmd.Parameters.AddWithValue("@Crt_Status", cartStatus);
                    int add = await cmd.ExecuteNonQueryAsync();
                    if (add != 0)
                    {
                        Response.Write("<script>alert('Added Successfully!')</script>");
                        quantityTextBox.Text = string.Empty;
                    }
                }

            }
        }
    }
}