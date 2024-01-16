using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindUserProfile();
                await BindOrderStatus();
                GetUserID();
                await BindRoomReservationCount();
                await BindReservationStatus();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindReservationStatus()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    GetUserID();
                    await con.OpenAsync();
                    string query = "select COUNT(a.utblId) as TableStatus from Tbl_TableReservation a where a.userID_fk=@userID and a.Rtbl_Status='Pending'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", int.Parse(hndUserID.Value));
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTTReservationStats.DataSource = dt;
                        RTTReservationStats.DataBind();
                    }
                    
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindRoomReservationCount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    GetUserID();
                    await con.OpenAsync();
                    string query = "select COUNT(rrservationId) roomStatus from Tbl_RoomReservationUser where userID_fk=@userID and urstatus='Occupied'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RoomStatus.DataSource = dt;
                        RoomStatus.DataBind();
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
        private async Task BindOrderStatus()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                 
                    await con.OpenAsync();
                    string query = "select COUNT(a.paymentId) as TotalOrder from Tbl_Payment a inner join Customer b on b.cusId = a.userID where a.approval='For Approval' and b.cusId='" + Session["UserID"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_FoodOrderStatus.DataSource = dt;
                        R_FoodOrderStatus.DataBind();
                    }
                    
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindUserProfile()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Customer WHERE cusId='" + Session["UserID"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {

                        RViewProfile.DataSource = dt;
                        RViewProfile.DataBind();
                    }
                   
                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void RViewProfile_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField value = (HiddenField)e.Item.FindControl("HiddenField1") as HiddenField;

            Session["cusID"] = Convert.ToInt32(value.Value);

            if (e.CommandName == "Edit")
            {
                ((TextBox)e.Item.FindControl("TextBox1")).Visible = true;
            }
            if (e.CommandName == "Update")
            {
                string Fname = ((TextBox)e.Item.FindControl("TextBox1")).Text;

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "update Customer set fname=@ha where cusId=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ha", Fname);
                    cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Success!')</script>");
                   
                }

            }
        }
    }
}