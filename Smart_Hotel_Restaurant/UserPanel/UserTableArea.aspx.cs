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
    public partial class UserTableArea : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindAllTable();
                await BindAllLuzon();
                await BindAllVisayas();
                await BindAllMindanao();
                await BindAll1Person();
                await BindAll2Person();
                await BindAll4Person();
                await BindAll6Person(); 
                await BindFamilySize();
            }
        }



        private async Task BindAllTable()
        {
            try
            {
                /*
                 SQL queries: 
                This algorithm involves using SQL queries to retrieve data from a relational database.
                 */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table order by table_No asc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        protected void lnkVisayas_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }

        protected void LnkTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTableArea.aspx");
        }


        private async Task BindAll6Person()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_type='6 Persons'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        private async Task BindAll4Person()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_type='4 Persons'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        private async Task BindAll2Person()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_type='2 Persons'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        private async Task BindAll1Person()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_type='1 Person'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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
        private async Task BindFamilySize()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_type='Family Size'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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
        private async Task BindAllMindanao()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_area='Mindanao'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        private async Task BindAllVisayas()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();

                    string query = "select * from Tbl_Table where table_area='Visayas'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        private async Task BindAllLuzon()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where table_area='Luzon'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();
                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
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

        protected async void LnkALl_Click(object sender, EventArgs e)
        {
            await BindAllTable();
        }

        protected async void LnkLuzonsss_Click(object sender, EventArgs e)
        {
            await BindAllLuzon();
        }

        protected async void LnkVisayasss_Click(object sender, EventArgs e)
        {
            await BindAllVisayas();
        }

        protected async void LnkMindanaoss_Click(object sender, EventArgs e)
        {
            await BindAllMindanao();
        }

        protected async void LnkOnePersonssss_Click(object sender, EventArgs e)
        {
            await BindAll1Person();
        }

        protected async void LnkTwoPersonss_Click(object sender, EventArgs e)
        {
            await BindAll2Person();
        }

        protected async void LnkFourPersonss_Click(object sender, EventArgs e)
        {
            await BindAll4Person();
        }

        protected async void LnkSixPersonsss_Click(object sender, EventArgs e)
        {
            await BindAll6Person();
        }

        protected async void lnkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_Table WHERE table_area LIKE '%' + @SearchText + '%' OR table_type LIKE '%' + @SearchText + '%' OR table_No LIKE '%' + @SearchText + '%' OR table_status LIKE '%' + @SearchText + '%'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SearchText", TxtSearch.Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTable.DataSource = dt;
                        RTable.DataBind();

                        foreach (RepeaterItem item in RTable.Items)
                        {
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            Label staus = (Label)item.FindControl("lblStatus");
                            string sta = staus.Text.Trim();

                            if (sta == "Available")
                            {
                                staus.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (sta == "Pending")
                            {
                                staus.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
                            }
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<scrip>alert('" + ex.Message + "')</script>");
            }
        }


        protected void lnkRoomReservation_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomReservation.aspx");
        }

        protected async void lnkFamilySize_Click(object sender, EventArgs e)
        {
            await BindFamilySize();
        }
    }
}