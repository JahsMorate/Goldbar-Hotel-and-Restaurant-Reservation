using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class Foods : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }

            if (!IsPostBack)
            {
                await BindFoodsAllCategory();
                await GetBestSeller();
                await AlFoods();
                await Beverage();
                await BreakFast();
                await Lunch();
                await FastFoods();
                await Dinner();

                //Monitoring for foods
                await BindMonitoringBeverage();
                await BindMonitoringBreakFast();
                await BindMonitoringLucnh();
                await BindMonitoringDinnner();
                await BindMonitoringFastFood();
                await BindMonitoringBestSeller();
                //Monitoring for foods
            }

           
        }

       
        private async Task BindMonitoringBestSeller()
        {
            try
            {

                /*
                 SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();

                    string query = "select COUNT(FoodId) as BestSellers from Tbl_Food where fStatus='Best Seller'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RBestSellers.DataSource = dt;
                        RBestSellers.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindMonitoringFastFood()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(FoodId) as FasFoods from Tbl_Food where fCategory='Fast food'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RFasFoods.DataSource = dt;
                        RFasFoods.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindMonitoringDinnner()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(FoodId) as Dinners from Tbl_Food where fCategory='Dinner'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RDinners.DataSource = dt;
                        RDinners.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindMonitoringLucnh()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(FoodId) as Lunchs from Tbl_Food where fCategory='Lunch'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RLunchs.DataSource = dt;
                        RLunchs.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindMonitoringBreakFast()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(FoodId) as Breakfasts from Tbl_Food where fCategory='Breakfast'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RBreakFast.DataSource = dt;
                        RBreakFast.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindMonitoringBeverage()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(FoodId) as Beverages from Tbl_Food where fCategory='Beverage'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_Beverage.DataSource = dt;
                        R_Beverage.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindFoodsAllCategory()
        {
            try
            {
                /*
                SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                */

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
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();

                        ListViewAllFoods.Visible = true;
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        // This is for pagination
        protected async void BindAll_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewAllFoods.FindControl("dataPageAll") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            await this.BindFoodsAllCategory();
        }

        protected async void LnkAddFoods_Click(object sender, EventArgs e)
        {
            await AddedControlFoods();
        }

        private async Task AddedControlFoods()
        {
            try
            {
                /*
                 Stored Procedure Insert: This algorithm involves defining a stored 
                procedure that encapsulates the logic for
                inserting data into a table, and calling the procedure with the required parameters.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "AddingFoods_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@foodName", TxtFoodsName.Text.Trim());
                    cmd.Parameters.AddWithValue("@fprice", TxtPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@fDecription", TxtFoodsDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@fCategory", DdlFoodsCategory.SelectedValue);
                    if (CheckBestSeller.Checked)
                    {
                        string bestSeller = "Best Seller";
                        cmd.Parameters.AddWithValue("@fStatus", bestSeller);
                    }
                    else
                    {
                        string regular = "Regular";
                        cmd.Parameters.AddWithValue("@fStatus", regular);
                    }
                    //image01
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                    }

                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload2.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@img02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload3.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@img03", linkpath03);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                    }

                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Added Successfully!','','success')", true);
                        LnkUpdate.Visible = false;
                        LnkAddFoods.Visible = true;
                        HndFoodID.Value = string.Empty;
                        TxtPrice.Text = string.Empty;
                        TxtFoodsName.Text = string.Empty;
                        TxtFoodsDescription.Text = string.Empty;
                        Clear();
                        await BindFoodsAllCategory();
                        await BindMonitoringBeverage();
                        await BindMonitoringBreakFast();
                        await BindMonitoringLucnh();
                        await BindMonitoringDinnner();
                        await BindMonitoringFastFood();
                        await BindMonitoringBestSeller();
                        Response.Redirect(Request.Url.ToString(), true);
                        return;

                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");

            }
        }

        private void Clear()
        {
            TxtFoodsDescription.Text = string.Empty;
            TxtFoodsName.Text = string.Empty;
            TxtPrice.Text = string.Empty;
            HndFoodID.Value = string.Empty;

        }

        protected void LnkResetFoods_Click(object sender, EventArgs e)
        {
            Clear();
        }

        // This is Stable Dont touch it
        protected async void LnkEdit_Click(object sender, EventArgs e)
        {
            try
            {


                int intEID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Food where FoodId='" + intEID + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        HndFoodID.Value = dt.Rows[0]["FoodId"].ToString();
                        CheckBestSeller.Checked = true;
                        TxtFoodsName.Text = dt.Rows[0]["foodName"].ToString();
                        TxtPrice.Text = dt.Rows[0]["fprice"].ToString();
                        TxtFoodsDescription.Text = dt.Rows[0]["fDecription"].ToString();
                        DdlFoodsCategory.SelectedValue = dt.Rows[0]["fCategory"].ToString();
                        LnkAddFoods.Visible = false;
                        LnkUpdate.Visible = true;

                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        // This is Stable Dont touch it
        protected async void LnkDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int delFID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "delete from Tbl_Food where FoodId='" + delFID + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Deleted Successfully!','','success')", true);
                        await BindFoodsAllCategory();
                        await BindMonitoringBeverage();
                        await BindMonitoringBreakFast();
                        await BindMonitoringLucnh();
                        await BindMonitoringDinnner();
                        await BindMonitoringFastFood();
                        await BindMonitoringBestSeller();
                        Response.Redirect(Request.Url.ToString(), true);
                        return;
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                /*
                 Simple Update Stored Procedure: This is a basic stored procedure that takes
                input parameters to identify the row(s) to
                be updated and the new values to be assigned to the specified fields.
                 */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    int FoodID = Convert.ToInt32(HndFoodID.Value);
                    string query = "UpdateFoods_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", FoodID);
                    cmd.Parameters.AddWithValue("@foodName", TxtFoodsName.Text.Trim());
                    cmd.Parameters.AddWithValue("@fprice", TxtPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@fDecription", TxtFoodsDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@fCategory", DdlFoodsCategory.SelectedValue);


                    if (CheckBestSeller.Checked)
                    {
                        string bestSeller = "Best Seller";
                        cmd.Parameters.AddWithValue("@fstatus", bestSeller);
                    }
                    else
                    {
                        string regular = "Regular";
                        cmd.Parameters.AddWithValue("@fstatus", regular);
                    }


                    //image01
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                    }


                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@img02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@img03", linkpath03);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                    }
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Updated Successfully!','','success')", true);
                        LnkUpdate.Visible = false;
                        LnkAddFoods.Visible = true;
                        HndFoodID.Value = string.Empty;
                        TxtPrice.Text = string.Empty;
                        TxtFoodsName.Text = string.Empty;
                        TxtFoodsDescription.Text = string.Empty;
                        await BindFoodsAllCategory();
                        await BindMonitoringBeverage();
                        await BindMonitoringBreakFast();
                        await BindMonitoringLucnh();
                        await BindMonitoringDinnner();
                        await BindMonitoringFastFood();
                        await BindMonitoringBestSeller();
                        Response.Redirect(Request.Url.ToString(), true);
                        LnkUpdate.Visible = false;
                        LnkAddFoods.Visible = true;
                        return;

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
            await GetBestSeller();
        }
        private async Task GetBestSeller()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fStatus='Best Seller'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();

                    }
                    else
                    {
                        ListViewAllFoods.Visible = false;

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
            await FastFoods();
        }
        private async Task FastFoods()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Fast food'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();
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
            await Dinner();
        }
        private async Task Dinner()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Dinner'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();

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
            await Lunch();
        }
        private async Task Lunch()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Lunch'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();

                        ListViewAllFoods.Visible = true;
                    }

                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async Task LnkBreakFast_Click(object sender, EventArgs e)
        {
            await BreakFast();
        }
        private async Task BreakFast()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Breakfast'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();
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
            await Beverage();
        }
        private async Task Beverage()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "Select * from Tbl_Food where fCategory='Beverage'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        protected async void LinkButton1_Click(object sender, EventArgs e)
        {
            await AlFoods();
        }

        private async Task AlFoods()
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
                        ListViewAllFoods.DataSource = dt;
                        ListViewAllFoods.DataBind();

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