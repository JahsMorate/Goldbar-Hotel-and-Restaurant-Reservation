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
    public partial class HomeRoom : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                GetUserID();
                await BindFoods();
                await BindBeverage();
                
                await BindBestSeller();
                await BindDesserts();
                await BindFoodsAllCategory();
                await BindFoodsAllCategory();
                await BinBreakfast();
                await BindLunch();
                await BinDinner();
                await BindFastfods();
                await BinReguar();
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
                    string query = "select * from Tbl_Customer where Cusername='" + Session["UserName"] + "'";
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

        private async Task BindFoods()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food order by FoodId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFoods.DataSource = dt;
                        RFoods.DataBind();
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

        protected async void LinkButton7_Click(object sender, EventArgs e)
        {
            await BindFoodsAllCategory();
        }

        private async Task BindFoodsAllCategory()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food order by FoodId desc";
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

        protected async void LinkButton8_Click(object sender, EventArgs e)
        {
            await BindBeverage();
        }

        protected async void LinkButton9_Click(object sender, EventArgs e)
        {
            await BinBreakfast();
        }

        protected async void LinkButton10_Click(object sender, EventArgs e)
        {
            await BindLunch();
        }

        protected async void LinkButton1_Click(object sender, EventArgs e)
        {
            await BinDinner();
        }

        protected async void LinkButton2_Click(object sender, EventArgs e)
        {
            await BindFastfods();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            //Ths is for the resgular


        }
        private async Task BinReguar()
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


        private async Task BindBestSeller()
        {
            try
            {
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

        protected async void LinkButton2_Click1(object sender, EventArgs e)
        {
            await BindBestSeller();
        }

        protected async void LinkButton3_Click(object sender, EventArgs e)
        {
            await BindFastfods();
        }

        protected async void LinkButton2_Click2(object sender, EventArgs e)
        {
            await BindBestSeller();
        }

        protected async void LnkBestSeller_Click(object sender, EventArgs e)
        {
            await BindBestSeller();
        }

        protected async void lnkRegular_Click(object sender, EventArgs e)
        {
            await BinReguar();
        }

        protected async void lnkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_Food WHERE foodName LIKE @searchTerm OR fDesription LIKE @searchTerm OR fCategory LIKE @searchTerm OR fStatus LIKE @searchTerm";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@searchTerm", "%" + TxtSearch.Text.Trim() + "%");
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

        protected void lnkFoodAndDrinks_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }

        protected void LnkTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTableArea.aspx");
        }

        protected void LnkRoomReservation_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomReservation.aspx");
        }

        protected async void LnkDessert_Click(object sender, EventArgs e)
        {
            await BindDesserts();
        }
    }
}