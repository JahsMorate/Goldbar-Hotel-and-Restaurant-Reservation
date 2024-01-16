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

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class RoomReservationList : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindRoomReservation();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindRoomReservation()
        {
            try
            {

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select a.*, b.*, c.* from Tbl_RoomReservationUser a inner join Tbl_RReservation b on b.RRId = a.roomID_fk inner join Customer c on c.cusId = a.userID_fk where a.urstatus='Pending' or a.urstatus='Occupied' or a.urstatus='Approval'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_RReservation.Visible = true;
                        R_RReservation.DataSource = dt;
                        R_RReservation.DataBind();

                        foreach (RepeaterItem item in R_RReservation.Items)
                        {

                            LinkButton confirm = (LinkButton)item.FindControl("LnkAcccept");
                            LinkButton decline = (LinkButton)item.FindControl("LnkDecline");
                            LinkButton viewPayment = (LinkButton)item.FindControl("LnkViewForPayment");

                            Label statuss = (Label)item.FindControl("lblStatusssss");
                            string status = "Occupied";
                            if (statuss.Text == status)
                            {
                                confirm.Visible = false;
                                decline.Visible = false;
                                viewPayment.Visible = true;
                            }
                            if (statuss.Text == "Pending")
                            {
                                confirm.Visible = true;
                                decline.Visible = true;
                                viewPayment.Visible = false;
                            }
                            if (statuss.Text == "Approval")
                            {
                                confirm.Visible = false;
                                decline.Visible = false;
                                viewPayment.Visible = true;
                            }
                            if (statuss.Text == "Decline")
                            {

                                R_RReservation.Visible = false;
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

        protected async void LnkAcccept_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    LinkButton accept = (LinkButton)sender;
                    RepeaterItem item = (RepeaterItem)accept.NamingContainer;
                    HiddenField rruID = (HiddenField)item.FindControl("hndResrvationID");
                    HiddenField rrID = (HiddenField)item.FindControl("rrID");
                    HiddenField rrtab = (HiddenField)item.FindControl("hndRRID");
                    Label userEmail = (Label)item.FindControl("lblEmail");
                    Label fname = (Label)item.FindControl("lblFname");
                    Label lname = (Label)item.FindControl("lbllname");
                    Label mi = (Label)item.FindControl("lblmi");
                    Label rrnum = (Label)item.FindControl("lblRRNUmber");
                    Label price = (Label)item.FindControl("lblPrice");
                    LinkButton confirm = (LinkButton)item.FindControl("LnkAcccept");
                    LinkButton decline = (LinkButton)item.FindControl("LnkDecline");
                    LinkButton viewPayment = (LinkButton)item.FindControl("LnkViewForPayment");

                    Label statuss = (Label)item.FindControl("lblStatusssss");
                    int rid = int.Parse(rrID.Value);
                    string status = "Occupied";

                    string query = "update Tbl_RoomReservationUser set urstatus=@occupied, roomDate=@RRdate where userID_fk=@rruID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@occupied", status);
                    cmd.Parameters.AddWithValue("@RRdate", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@rruID", int.Parse(rruID.Value));
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        confirm.Visible = false;
                        decline.Visible = false;
                        viewPayment.Visible = true;
                        //Gmail notification
                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(userEmail.Text.Trim()));
                        message.Body = $"<html><body>Hi, {fname.Text.Trim()} {mi.Text.Trim()} {lname.Text.Trim()} <div></div> We would like to inform you that your room reservation number <b>{rrnum.Text}</b> has been confirmed by the administrator. Additionally, we would like to inform you that your payment will be based on the duration of your stay, with a rate of <b>{price.Text}</b> pesos per hour.</br> Thank you for your cooperation and understanding. </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };
                        smtpClient.Send(message);
                        string query1 = "update Tbl_RReservation set rrStatus=@stats where RRId=@hndRRID";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@stats", status);
                        cmd1.Parameters.AddWithValue("@hndRRID", int.Parse(rrtab.Value));
                        int dis = cmd1.ExecuteNonQuery();
                        if (dis != 0)
                        {
                            await BindRoomReservation();
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Reservation Confirm Successfully!','success')", true);
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        protected void LnkViewForPayment_Click(object sender, EventArgs e)
        {
            LinkButton send = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)send.NamingContainer;
            HiddenField ids = (HiddenField)item.FindControl("userID");
            Session["userID"] = ids.Value;
            Response.Redirect("AdminRoomReservationBilling.aspx");
        }

        protected async void LnkDecline_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    LinkButton accept = (LinkButton)sender;
                    RepeaterItem item = (RepeaterItem)accept.NamingContainer;
                    HiddenField rruID = (HiddenField)item.FindControl("hndResrvationID");
                    HiddenField rrID = (HiddenField)item.FindControl("rrID");
                    HiddenField rrtab = (HiddenField)item.FindControl("hndRRID");
                    Label userEmail = (Label)item.FindControl("lblEmail");
                    Label fname = (Label)item.FindControl("lblFname");
                    Label lname = (Label)item.FindControl("lbllname");
                    Label mi = (Label)item.FindControl("lblmi");
                    Label rrnum = (Label)item.FindControl("lblRRNUmber");
                    Label price = (Label)item.FindControl("lblPrice");
                    LinkButton confirm = (LinkButton)item.FindControl("LnkAcccept");
                    LinkButton decline = (LinkButton)item.FindControl("LnkDecline");
                    LinkButton viewPayment = (LinkButton)item.FindControl("LnkViewForPayment");
                    

                    Label statuss = (Label)item.FindControl("lblStatusssss");
                    int rid = int.Parse(rrID.Value);
                    string status = "Available";
                    string declines = "Decline";


                    string query = "update Tbl_RoomReservationUser set urstatus=@occupied, roomDate=@RRdate where userID_fk=@rruID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@occupied", declines);
                    cmd.Parameters.AddWithValue("@RRdate", DateTime.Now.ToString());
                    cmd.Parameters.AddWithValue("@rruID", int.Parse(rruID.Value));
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        confirm.Visible = false;
                        decline.Visible = false;
                        viewPayment.Visible = true;
                        //Gmail notification
                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Table Reservation";
                        message.To.Add(new MailAddress(userEmail.Text.Trim()));
                        message.Body = $"<html><body>Hi, {fname.Text.Trim()} {mi.Text.Trim()} {lname.Text.Trim()} <div></div> We would like to inform you that your room reservation number <b>{rrnum.Text}</b> has been Decline by the administrator.</br> Thank you for your cooperation and understanding. </br></br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };
                        smtpClient.Send(message);
                        string query1 = "update Tbl_RReservation set rrStatus=@stats where RRId=@hndRRID";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@stats", status);
                        cmd1.Parameters.AddWithValue("@hndRRID", int.Parse(rrtab.Value));
                        int dis = cmd1.ExecuteNonQuery();
                        if (dis != 0)
                        {
                            viewPayment.Visible = false;
                            decline.Visible = false;
                            confirm.Visible = false;
                          
                            await BindRoomReservation();
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Reservation Decline Successfully!','success')", true);
                        }
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
    
