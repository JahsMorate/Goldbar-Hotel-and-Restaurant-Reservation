using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class DefaultPageFoodsAndDrinks : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
           

            if (!IsPostBack)
            {
                await BindFoods();
                await BinDinner();
                await BindLunch();
                await BinBreakfast();
                await BindBeverage();
                await BindDesserts();
                await BinDSearchingProduct();
                await BindBestSeller();
                await BindReguar();
                await BindFastfods();
            }
        }

        private async Task BindFoods()
        {
            try
            {
                /*
                 Grouping: This algorithm groups data entries based on specific criteria, 
                such as category or location. This can make
                it easier for users to find and navigate through the data.
                 */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Food order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        
                    }
                  

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void lnkSearch_Click(object sender, EventArgs e)
        {
            await BinDSearchingProduct();
        }


        private async Task BinDSearchingProduct()
        {
            try
            {
                /*
                   Linear Search: This algorithm searches 
               through each record in the database one by one until it finds a match. 
               This is the simplest and most straightforward search algorithm, 
               but it can be slow and inefficient for large databases.
                */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Food where foodName like '%" + TxtSearch.Text.Trim() + "%' or fDecription like '%" + TxtSearch.Text.Trim() + "%' or fCategory like '%" + TxtSearch.Text.Trim() + "%' or fStatus like '%" + TxtSearch.Text.Trim() + "%' ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkBestSeller_Click(object sender, EventArgs e)
        {
            await BindBestSeller();
        }
        private async Task BindBestSeller()
        {
            try
            {
                /*
             Grouping: This algorithm groups data entries based on specific criteria, 
            such as category or location. This can make
            it easier for users to find and navigate through the data.
             */
                
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fStatus='Best Seller' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();

                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void lnkRegular_Click(object sender, EventArgs e)
        {
            await BindReguar();
        }

        private async Task BindReguar()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fStatus='Regular' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkFastFoods_Click(object sender, EventArgs e)
        {
            await BindFastfods();
        }

        private async Task BindFastfods()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Fast food' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkDinner_Click(object sender, EventArgs e)
        {
            await BinDinner();
        }

        private async Task BinDinner()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Dinner' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        LnkNoSearchFound.Visible = false;
                        RFoods.Visible = true;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkLunch_Click(object sender, EventArgs e)
        {
            await BindLunch();
        }


        private async Task BindLunch()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Lunch' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }

                }



            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkBreakfast_Click(object sender, EventArgs e)
        {
            await BinBreakfast();
        }

        private async Task BinBreakfast()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Breakfast' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }


                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindDesserts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Dessert' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }


                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkBeverage_Click(object sender, EventArgs e)
        {
            await BindBeverage();
        }


        private async Task BindBeverage()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Beverage' order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
                        RFoods.Visible = true;
                        LnkNoSearchFound.Visible = false;
                    }
                    else
                    {
                        RFoods.Visible = false;
                        LnkNoSearchFound.Visible = true;
                    }


                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkAll_Click(object sender, EventArgs e)
        {
            await BindFoods();
        }

        protected async void Lnk_Click(object sender, EventArgs e)
        {
            await BindDesserts();
        }
    }
}