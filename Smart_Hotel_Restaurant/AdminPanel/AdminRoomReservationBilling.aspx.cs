using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class AdminRoomReservationBilling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserTotalBilling();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private void BindUserTotalBilling()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    int usrRRID = int.Parse(Session["userID"].ToString());
                    con.Open();
                    string query = "select a.*, b.*, c.* from Tbl_RoomReservationUser a inner join Tbl_RReservation b on b.RRId = a.roomID_fk inner join Customer c on c.cusId = a.userID_fk where a.urstatus='Approval' and a.userID_fk=@rrID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@rrID", usrRRID);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RRBilling.Visible = true;
                        RRBilling.DataSource = dt;
                        RRBilling.DataBind();
                        CheckOut.Visible = false;

                    }
                    else
                    {
                        RRBilling.Visible = false;
                        CheckOut.Visible = true;
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void lnkConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton confirm = (LinkButton)sender;
                RepeaterItem items = (RepeaterItem)confirm.NamingContainer;
                HiddenField hnduserRRID = (HiddenField)items.FindControl("hndRRUID");
                HiddenField hndRRID = (HiddenField)items.FindControl("hndRR");
                Label price = (Label)items.FindControl("lblPrices");
                decimal bill = Convert.ToDecimal(price.Text);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string check = "Confirm";
                    string rrom = "Room";
                    string sold = "Transaction Successfully";
                    string available = "Available";
                    string query = "update Tbl_RoomReservationUser set urstatus=@sold where userID_fk=@userRRDID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@sold", sold);
                    cmd.Parameters.AddWithValue("@userRRDID", int.Parse(hnduserRRID.Value));
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        string query1 = "update Tbl_RReservation set rrStatus=@avail where RRId=@rrid";
                        SqlCommand cm1 = new SqlCommand(query1, con);
                        cm1.Parameters.AddWithValue("@avail", available);
                        cm1.Parameters.AddWithValue("@rrid", int.Parse(hndRRID.Value));
                        await cm1.ExecuteNonQueryAsync();
                        foreach (RepeaterItem itemss in RRBilling.Items)
                        {
                            string query2 = "insert into TblPaymentF (statsPayment, overallPayment, paymentType) values (@stat2, @payment, @paymntype) ";
                            SqlCommand cmd2 = new SqlCommand(query2, con);
                            cmd2.Parameters.AddWithValue("@stat2", check);
                            cmd2.Parameters.AddWithValue("@payment", bill);
                            cmd2.Parameters.AddWithValue("@paymntype", rrom);
                            await cmd2.ExecuteNonQueryAsync();
                        }
                        BindUserTotalBilling();
                        Response.Redirect("RoomReservationList.aspx");
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