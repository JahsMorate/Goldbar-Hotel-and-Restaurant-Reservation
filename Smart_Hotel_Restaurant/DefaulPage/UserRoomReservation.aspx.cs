using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class UserRoomReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllRoomReservation();

                Bind1stFloorRoomReservation();
                Bind2ndFloorRoomReservation();
                Bind3rdFloorRoomReservation();
                Bind1personRoomReservation();
                Bind2personRoomReservation();
                Bind3personRoomReservation();
                Bind6personRoomReservation();
            }
        }

        private void BindAllRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
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

        private void Bind6personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrCompability='6 person' ORDER BY RRId DESC";
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

        private void Bind3personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrCompability='4 person' ORDER BY RRId DESC";
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
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        private void Bind2personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrCompability='2 person' ORDER BY RRId DESC";
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
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        private void Bind1personRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrCompability='1 person' ORDER BY RRId DESC";
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
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }


        private void Bind3rdFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrFloor='3' ORDER BY RRId DESC";
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

        private void Bind2ndFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrFloor='2' ORDER BY RRId DESC";
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
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        private void Bind1stFloorRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "SELECT RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus FROM Tbl_RReservation where rrFloor='1' ORDER BY RRId DESC";
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
                    con.Close();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }
        protected void LnkALl_Click(object sender, EventArgs e)
        {
            BindAllRoomReservation();
        }

        protected void Lnk1stFloor_Click(object sender, EventArgs e)
        {
            Bind1stFloorRoomReservation();
        }

        protected void Lnk2ndFloor_Click(object sender, EventArgs e)
        {
            Bind2ndFloorRoomReservation();
        }

        protected void Lnk3rdFloor_Click(object sender, EventArgs e)
        {
            Bind3rdFloorRoomReservation();
        }

        protected void LnkOnePersonssss_Click(object sender, EventArgs e)
        {
            Bind1personRoomReservation();
        }

        protected void LnkTwoPersonss_Click(object sender, EventArgs e)
        {
            Bind2personRoomReservation();
        }

        protected void LnkFourPersonss_Click(object sender, EventArgs e)
        {
            Bind3personRoomReservation();
        }

        protected void LnkSixPersonsss_Click(object sender, EventArgs e)
        {
            Bind6personRoomReservation();
        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select RRId,rimg01,rrFname,rrCompability,rrnumber,rrPrice,rrStatus from Tbl_RReservation where rrCompability like '%" + TxtSearch.Text.Trim() + "%' or rrDescription like '%" + TxtSearch.Text.Trim() + "%' or rrCompability like '%" + TxtSearch.Text.Trim() + "%' or rrFname like '%" + TxtSearch.Text.Trim() + "%' or rrStatus like '%" + TxtSearch.Text.Trim() + "%' ";
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
    }
}