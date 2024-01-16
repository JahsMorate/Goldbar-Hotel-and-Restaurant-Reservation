using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class TalblePreview : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindPreviewTable();
                
            }
        }

        private async Task BindPreviewTable()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    int tblID = Convert.ToInt32(Request.QueryString["TblID"]);
                    await con.OpenAsync();

                    string query = "select * from Tbl_Table where TblId=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", tblID);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RPreveiwsTable.DataSource = dt;
                        RPreveiwsTable.DataBind();

                        foreach (RepeaterItem item in RPreveiwsTable.Items)
                        {
                            LinkButton reservationButton = (LinkButton)item.FindControl("LnkReserveTable");
                            Label sta = (Label)item.FindControl("lblStaus");
                            string status = sta.Text.Trim();

                            if (status == "Available")
                            {
                                sta.CssClass = "text-success";
                                reservationButton.Visible = true;
                            }
                            else if (status == "Pending")
                            {
                                sta.CssClass = "text-warning";
                                reservationButton.Visible = false;
                            }
                            else
                            {
                                reservationButton.Visible = false;
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
                    string query = "SELECT * FROM Customer WHERE cusername='" + Session["UserName"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        HndUserID.Value = dt.Rows[0]["cusId"].ToString();
                        txtEmail.Text = dt.Rows[0]["email"].ToString();
                        txtfname.Text = dt.Rows[0]["fname"].ToString();
                    }

                    
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }




        protected async void LnkReserveTable_Click(object sender, EventArgs e)
        {
            try
            { /*
                 SQL queries:
                This algorithm involves using SQL queries to retrieve data from a relational database.
                 */
                GetUserID();
                LinkButton button = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;
                //This is for the userID
                
                //This is for the userID
                // Retrieve data from repeater 
                HiddenField tblID = (HiddenField)item.FindControl("hndTblID");
                Label tblNo = (Label)(item.FindControl("lblTablNo"));
                Label status = (Label)(item.FindControl("lblStaus"));
                Label area = (Label)(item.FindControl("lblArea"));
                Label compability = (Label)(item.FindControl("lblType"));
                Label desc = (Label)(item.FindControl("LblFDesription"));
                // Retrieve data from repeater 
                int tblIDs = Convert.ToInt32(tblID.Value);
                string tblNumber, sta, areas, compa, descs;
                tblNumber = tblNo.Text.Trim();
                sta = status.Text.Trim();
                areas = area.Text.Trim();
                compa = compability.Text.Trim();
                descs = desc.Text.Trim();
                string pending = "Pending";
                /*
                 * Atomic Update: This is a technique where a database update operation is 
                 * performed as a single, indivisible unit, ensuring that the operation is either fully completed or not completed at all. This is typically implemented using transactions, which group a set of database operations 
                 * together and ensure that they are all completed or rolled back as a single unit.
                 * 
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "insert into Tbl_TableReservation (userID_fk, tblID_fk, Rtbl_no, Rtbl_Status, Rtbl_Area, Rtbl_Compability, RTbl_Description, Rtbl_DateReserve) values (@userid, @tblIDFK, @tblNo, @status, @area, @compability, @descriptio, @date)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userid", int.Parse(HndUserID.Value));
                    cmd.Parameters.AddWithValue("@tblIDFK", tblIDs);
                    cmd.Parameters.AddWithValue("@tblNo", tblNumber);
                    cmd.Parameters.AddWithValue("@status", pending);
                    cmd.Parameters.AddWithValue("@area", areas);
                    cmd.Parameters.AddWithValue("@compability", compa);
                    cmd.Parameters.AddWithValue("@descriptio", descs);
                    cmd.Parameters.AddWithValue("@date", DateTime.Now.ToLocalTime());
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {

                        string query1 = "update Tbl_Table set table_status='Pending' where TblId='" + tblID.Value + "'";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();
                        //Gmail notification
                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(txtEmail.Text.Trim()));
                        message.Body = $"<html><body>Hi, {txtfname.Text.Trim()} <div></div> We would like to inform you that your table reservation is valid for a duration of <b>1 HOUR ONLY </b>. In the event that you fail to arrive on time, the administrator of the establishment will be obliged to decline your reservation. We kindly request that you make every effort to ensure that you arrive on time for your reservation.</br> Thank you for your cooperation and understanding. </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };

                        smtpClient.Send(message);

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Reservation Successfully!','We kindly request that you check your Gmail account for the notification on the reservation process. This will provide you with important information on how to proceed with your reservation. Thank you!','success')", true);
                        await BindPreviewTable();
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