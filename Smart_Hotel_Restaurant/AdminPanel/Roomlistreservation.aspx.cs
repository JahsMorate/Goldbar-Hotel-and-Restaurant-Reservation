using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class Roomlistreservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoomReservation();
                GetUserID();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
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
                    string query = "select * from Customer where cusername='" + Session["UserName"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            hndUserID.Value = dr.GetValue(0).ToString();

                        }
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void BindRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    GetUserID();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select a.*, b.* from Tbl_RoomReservationUser a inner join Tbl_RReservation b on b.RRId = a.roomID_fk where a.urstatus='Occupied' and a.userID_fk=@userID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RroomreservationStatus.DataSource = dt;
                        RroomreservationStatus.DataBind();
                        RroomreservationStatus.Visible = true;
                        LnkNoReservation.Visible = false;
                        foreach (RepeaterItem item in RroomreservationStatus.Items)
                        {
                            Label status = (Label)item.FindControl("lblStatus");
                            LinkButton checkout = (LinkButton)item.FindControl("lnkCheckOut");


                            string rrStatus = status.Text;
                            if (rrStatus == "Pending")
                            {
                                status.CssClass = "text-warning";
                                checkout.Visible = false;
                            }
                            else if (rrStatus == "Occupied")
                            {
                                checkout.Visible = true;
                                status.CssClass = "text-primary";
                            }

                        }
                    }
                    else
                    {
                        RroomreservationStatus.Visible = false;
                        LnkNoReservation.Visible = true;
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<scrip>alert('Error: " + ex.Message + "')</script>");
            }
        }



        protected void lnkCheckOut_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton checkout = (LinkButton)sender;
                RepeaterItem items = (RepeaterItem)checkout.NamingContainer;
                Label dateconfrim = (Label)items.FindControl("lblDateOfConfirm");
                Label price = (Label)items.FindControl("lblPricePerHour");
                HiddenField userRRID = (HiddenField)items.FindControl("hdnUserRRID");

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {

                        con.Open();
                    }
                    string approval = "Approval";
                    string sqlPayment = "Pending";
                    string query = "update Tbl_RoomReservationUser set urstatus=@approval, paymentStats=@paymentStas, RRCheckOut=@checkOUT where userID_fk=@usrRRID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@approval", approval);
                    cmd.Parameters.AddWithValue("@paymentStas", sqlPayment);
                    cmd.Parameters.AddWithValue("@usrRRID", userRRID.Value);
                    cmd.Parameters.AddWithValue("@checkOUT", DateTime.Now.ToString());

                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        BindRoomReservation();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Message','Check-out Successfully!','success')", true);

                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<scrip>alert('Error: " + ex.Message + "')</script>");
            }
        }
    }
}