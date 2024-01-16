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
    public partial class RoomReservationPreview : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindPreviewTable();
                GetUserID();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }
        private async Task BindPreviewTable()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    int tblID = Convert.ToInt32(Request.QueryString["RRI"]);
                    await con.OpenAsync();
                    string query = "select * from Tbl_RReservation where RRId=@id";
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
                            Label sta = (Label)item.FindControl("lblRRstatus");
                            Label spiner = (Label)item.FindControl("lblSpinner");
                            string status = sta.Text.Trim();

                            if (status == "Available")
                            {
                                sta.CssClass = "text-success";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            }
                            else if (status == "Pending")
                            {
                                sta.CssClass = "text-warning";
                                spiner.CssClass = "spinner-grow spinner-grow-sm text-warning";
                            }

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
            {
                GetUserID();
                LinkButton button = (LinkButton)sender;
                RepeaterItem item = (RepeaterItem)button.NamingContainer;

             
                //This is for the userID


                // Retrieve data from repeater 
                HiddenField rrid = (HiddenField)item.FindControl("hndRRRID");

                Label rnumber = (Label)(item.FindControl("lblrrnumber"));
                Label rrprice = (Label)(item.FindControl("lblPrice"));
                Label compability = (Label)(item.FindControl("lblCompability"));


                int rrIDS = Convert.ToInt32(rrid.Value);
                string tblNumbers, compa;
                tblNumbers = rnumber.Text.Trim();
                Decimal price = Convert.ToDecimal(rrprice.Text);
                compa = compability.Text.Trim();

                string pending = "Pending";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "insert into Tbl_RoomReservationUser(userID_fk, roomID_fk, roomDate, urPrice, urstatus) " +
                        "values (@usrID, @rrID, @roomDate, @rPrice, @status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@usrID", HndUserID.Value);
                    cmd.Parameters.AddWithValue("@rrID", rrIDS);
                    cmd.Parameters.AddWithValue("@roomDate", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@rPrice", price);
                    cmd.Parameters.AddWithValue("@status", pending);
                    int suc = await cmd.ExecuteNonQueryAsync();
                    if (suc != 0)
                    {
                        string query1 = "update Tbl_RReservation set rrStatus=@status where RRId=@rID";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@status", pending);
                        cmd1.Parameters.AddWithValue("@rID", rrIDS);
                        cmd1.ExecuteNonQuery();
                        await BindPreviewTable();
                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";
                        //Gmail notification
                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(txtEmail.Text.Trim()));
                        message.Body = $"<html><body>Hi, {txtfname.Text.Trim()} <div></div> We would like to inform you that your room reservation is valid for a duration of <b> <h1>1 hour only</h1></b>. In the event that you fail to arrive on time, the administrator of the establishment will be obliged to decline your reservation. We kindly request that you make every effort to ensure that you arrive on time for your reservation.</br> Thank you for your cooperation and understanding. </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;
                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };
                        smtpClient.Send(message);
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Reservation Successfully!','We kindly request that you check your Gmail account for the notification on the reservation process. This will provide you with important information on how to proceed with your reservation. Thank you!','success')", true);

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