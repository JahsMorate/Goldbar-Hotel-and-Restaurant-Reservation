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
    public partial class RoomReservation : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindAllRoomReservation();
                await Bind1stFloorRoomReservation();
                await Bind2ndFloorRoomReservation();
                await Bind3rdFloorRoomReservation();
                await Bind1personRoomReservation();
                await Bind2personRoomReservation();
                await Bind3personRoomReservation();
                await Bind6personRoomReservation();

            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindAllRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        protected void LnkTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTableArea.aspx");
        }

        protected void LNkResrvation_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomReservation.aspx");
        }

        protected void LnkFoods_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }

        protected async void LnkALl_Click(object sender, EventArgs e)
        {
           await BindAllRoomReservation();
        }

        private async Task Bind1stFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrFloor='1' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void Lnk1stFloor_Click(object sender, EventArgs e)
        {
           await Bind1stFloorRoomReservation();
        }

        private async Task Bind2ndFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrFloor='2' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void Lnk2ndFloor_Click(object sender, EventArgs e)
        {
         await   Bind2ndFloorRoomReservation();
        }

        private async Task Bind3rdFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrFloor='3' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void Lnk3rdFloor_Click(object sender, EventArgs e)
        {
          await  Bind3rdFloorRoomReservation();
        }

        private async Task Bind1personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrCompability='1 Person' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async  void LnkOnePersonssss_Click(object sender, EventArgs e)
        {
           await Bind1personRoomReservation();
        }

        private async Task Bind2personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrCompability='2 Persons' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void LnkTwoPersonss_Click(object sender, EventArgs e)
        {
          await  Bind2personRoomReservation();
        }


        private async Task Bind3personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrCompability='4 Persons' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void LnkFourPersonss_Click(object sender, EventArgs e)
        {
           await Bind3personRoomReservation();
        }

        private async Task Bind6personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where rrCompability='6 Persons' ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected async void LnkSixPersonsss_Click(object sender, EventArgs e)
        {
           await Bind6personRoomReservation();
        }



        protected async void lnkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation WHERE rrCompability LIKE '%' + @SearchText + '%' OR rrDescription LIKE '%' + @SearchText + '%' OR rrCompability LIKE '%' + @SearchText + '%' OR rrFname LIKE '%' + @SearchText + '%' OR rrStatus LIKE '%' + @SearchText + '%'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@SearchText", TxtSearch.Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRReservation.DataSource = dt;
                        RRReservation.DataBind();
                        foreach (RepeaterItem item in RRReservation.Items)
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

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
    }
}