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
    public partial class TableReservation : System.Web.UI.Page
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
                 Grouping: This algorithm groups data entries based on specific criteria, 
                such as category or location. This can make
                it easier for users to find and navigate through the data.
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
        private async Task BindAll6Person()
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
                /*
               Grouping: This algorithm groups data entries based on specific criteria, 
              such as category or location. This can make
              it easier for users to find and navigate through the data.
               */

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
                /*
               Grouping: This algorithm groups data entries based on specific criteria, 
              such as category or location. This can make
              it easier for users to find and navigate through the data.
               */

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
                /*
               Grouping: This algorithm groups data entries based on specific criteria, 
              such as category or location. This can make
              it easier for users to find and navigate through the data.
               */

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

        private async Task BindAllMindanao()
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
                /*
               Grouping: This algorithm groups data entries based on specific criteria, 
              such as category or location. This can make
              it easier for users to find and navigate through the data.
               */

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
          await  BindAllVisayas();
        }

        protected async void LnkMindanaoss_Click(object sender, EventArgs e)
        {
            await BindAllMindanao();
        }

        protected async void LnkOnePersonssss_Click(object sender, EventArgs e)
        {
           await  BindAll1Person();
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
                /*
                    Linear Search: This algorithm searches 
                through each record in the database one by one until it finds a match. 
                This is the simplest and most straightforward search algorithm, 
                but it can be slow and inefficient for large databases.
                 */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_Table WHERE table_area LIKE @searchTerm OR table_type LIKE @searchTerm OR table_No LIKE @searchTerm OR table_status LIKE @searchTerm";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@searchTerm", "%" + TxtSearch.Text.Trim() + "%");
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

                Response.Write("<scrip>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void lnkFamilySize_Click(object sender, EventArgs e)
        {
            await BindFamilySize();
        }
    }
}