using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class AdminTableReservation : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindTableReservation();
                await BindTotalAvailable();
                await BindTotalPending();
                await BindTotalOccuepied();
                await BindTotalTable();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }

        }

        private async Task BindTotalTable()
        {
            try
            {
                /*
                 * SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                 * 
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Totals from Tbl_Table";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_TotalTable.DataSource = dt;
                        R_TotalTable.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalOccuepied()
        {
            try
            {
                /*
               * SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               * 
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Occcupieds from Tbl_Table where table_status='Occupied'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_Occcupieds.DataSource = dt;
                        R_Occcupieds.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalPending()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Pendings from Tbl_Table where table_status='Pending'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_Pending.DataSource = dt;
                        R_Pending.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalAvailable()
        {
            try
            {
                /*
               * SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               * 
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Availables from Tbl_Table where table_status='Available'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_Availables.DataSource = dt;
                        R_Availables.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTableReservation()
        {
            try
            {
                /*
               * SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               * 
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select a.*, b.*, c.* from Tbl_TableReservation a inner join Customer b on b.cusId = a.userID_fk inner join Tbl_Table c on c.TblId = a.tblID_fk where (a.Rtbl_Status='Pending' or a.Rtbl_Status='Occupied') and (c.table_status='Occupied' or c.table_status='Pending')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_Reservation.DataSource = dt;
                        R_Reservation.DataBind();
                        R_Reservation.Visible = true;
                        foreach (RepeaterItem items in R_Reservation.Items)
                        {
                            LinkButton accept = (LinkButton)items.FindControl("LnkAcccept");
                            LinkButton decline = (LinkButton)items.FindControl("LnkDecline");
                            LinkButton restore = (LinkButton)items.FindControl("LnkBackAvailable");
                            Label stus = (Label)items.FindControl("lblStatusssss");
                            string status = stus.Text.Trim();
                            if (status == "Occupied")
                            {
                                accept.Visible = false;
                                decline.Visible = false;
                                restore.Visible = true;
                            }
                            else
                            {
                                accept.Visible = true;
                                decline.Visible = true;
                                restore.Visible = false;
                            }

                        }
                    }
                    else
                    {
                        R_Reservation.Visible = false;
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        protected async void LnkAcccept_Click(object sender, EventArgs e)
        {
            try
            {
                /*
                 Atomic Update: This is a technique where a database update operation is performed as a 
                single, indivisible unit, ensuring that the operation is either fully completed or not 
                completed at all. This is typically implemented using transactions, which group a set of database operations 
                together and ensure that they are all completed or rolled back as a single unit.
                 */

                LinkButton button = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;

                HiddenField tblID = (HiddenField)item.FindControl("hndTblID");
                HiddenField reservationID = (HiddenField)item.FindControl("hndResrvationID");
                Label email = (Label)item.FindControl("lblEmail");
                Label name = (Label)item.FindControl("lblName");
                Label area = (Label)item.FindControl("lblArea");

                //Fetch the data from datatype

                string emails = email.Text.Trim();
                string status = "Occupied";
                string occupied = "Occupied";
                int reservationIDs, tblIDs;
                reservationIDs = Convert.ToInt32(reservationID.Value);
                tblIDs = Convert.ToInt32(tblID.Value);



                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "update Tbl_TableReservation set Rtbl_Status=@confirm where tblID_fk=@reservationID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@confirm", status);
                    cmd.Parameters.AddWithValue("@reservationID", reservationIDs);
                    int update = await cmd.ExecuteNonQueryAsync();
                    if (update != 0)
                    {
                        string querys = "update Tbl_Table set table_status=@occupied where TblId=@tblID";
                        SqlCommand cmd1 = new SqlCommand(querys, con);
                        cmd1.Parameters.AddWithValue("@occupied", occupied);
                        cmd1.Parameters.AddWithValue("@tblID", tblIDs);
                        cmd1.ExecuteNonQuery();

                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(email.Text.Trim()));
                        message.Body = $"<html><body>Hi, {name.Text.Trim()} <div></div> I am pleased to inform you that your table reservation has been duly accepted by the administration team. Your designated table ID is located in the {area.Text.Trim()} area.</br> Thank you for choosing our establishment, and we hope that you have an enjoyable day. </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };

                        smtpClient.Send(message);


                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job','Table reservation succesfully confirm','success')", true);

                        await BindTableReservation();
                        await BindTotalAvailable();
                        await BindTotalPending();
                        await BindTotalOccuepied();
                        await BindTotalTable();

                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }



        }

        protected async void LnkDecline_Click(object sender, EventArgs e)
        {
            try
            {
                /*
                Atomic Update: This is a technique where a database update operation is performed as a 
               single, indivisible unit, ensuring that the operation is either fully completed or not 
               completed at all. This is typically implemented using transactions, which group a set of database operations 
               together and ensure that they are all completed or rolled back as a single unit.
                */

                LinkButton button = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;

                HiddenField tblID = (HiddenField)item.FindControl("hndTblID");
                HiddenField reservationID = (HiddenField)item.FindControl("hndResrvationID");
                Label email = (Label)item.FindControl("lblEmail");
                Label name = (Label)item.FindControl("lblName");
                Label area = (Label)item.FindControl("lblArea");

                //Fetch the data from datatype

                string emails = email.Text.Trim();
                string status = "Available";
                string occupied = "Available";
                int reservationIDs, tblIDs;
                reservationIDs = Convert.ToInt32(reservationID.Value);
                tblIDs = Convert.ToInt32(tblID.Value);



                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "update Tbl_TableReservation set Rtbl_Status=@confirm where tblID_fk=@reservationID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@confirm", status);
                    cmd.Parameters.AddWithValue("@reservationID", reservationIDs);
                    int update = await cmd.ExecuteNonQueryAsync();
                    if (update != 0)
                    {
                        string querys = "update Tbl_Table set table_status=@occupied where TblId=@tblID";
                        SqlCommand cmd1 = new SqlCommand(querys, con);
                        cmd1.Parameters.AddWithValue("@occupied", occupied);
                        cmd1.Parameters.AddWithValue("@tblID", tblIDs);
                        cmd1.ExecuteNonQuery();

                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(email.Text.Trim()));
                        message.Body = $"<html><body>Hi, {name.Text.Trim()} <div></div> Your request of Table reservation was Cancel by the administration team. Your designated table ID is located in the {area.Text.Trim()} area.</br> </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };

                        smtpClient.Send(message);


                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Cancel Table Reservation Successfully','success')", true);

                        await BindTableReservation();
                        await BindTotalAvailable();
                        await BindTotalPending();
                        await BindTotalOccuepied();
                        await BindTotalTable();

                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkBackAvailable_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton button = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;

                HiddenField tblID = (HiddenField)item.FindControl("hndTblID");
                HiddenField reservationID = (HiddenField)item.FindControl("hndResrvationID");
                Label email = (Label)item.FindControl("lblEmail");
                Label name = (Label)item.FindControl("lblName");
                Label area = (Label)item.FindControl("lblArea");

                //Fetch the data from datatype


                string emails = email.Text.Trim();
                string cancel = "Available";

                int reservationIDs, tblIDs;
                reservationIDs = Convert.ToInt32(reservationID.Value);
                tblIDs = Convert.ToInt32(tblID.Value);

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "update Tbl_TableReservation set Rtbl_Status=@confirm where tblID_fk=@reservationID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@confirm", cancel);
                    cmd.Parameters.AddWithValue("@reservationID", reservationIDs);
                    int update = await cmd.ExecuteNonQueryAsync();
                    if (update != 0)
                    {
                        string querys = "update Tbl_Table set table_status=@occupied where TblId=@tblID";
                        SqlCommand cmd1 = new SqlCommand(querys, con);
                        cmd1.Parameters.AddWithValue("@occupied", cancel);
                        cmd1.Parameters.AddWithValue("@tblID", tblIDs);
                        await cmd1.ExecuteNonQueryAsync();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Back to Available Succesfully!','success')", true);
                        await BindTableReservation();
                        await BindTotalAvailable();
                        await BindTotalPending();
                        await BindTotalOccuepied();
                        await BindTotalTable();

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