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
    public partial class TableReservationStatus : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUserID();
              await  BindTReservationStatus();
            }
        }

        private async Task BindTReservationStatus()
        {
            try
            {
                GetUserID();
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select	a.cusId, b.*, c.table_No from Customer a inner join Tbl_TableReservation b on b.userID_fk = a.cusId inner join Tbl_Table c on c.TblId = b.tblID_fk where b.userID_fk=@userID and (b.Rtbl_Status='Pending' or b.Rtbl_Status='Occupied')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RTTableStatusUser.Visible = true;
                        LnkOrderFoodStatus.Visible = false;
                        RTTableStatusUser.DataSource = dt;
                        RTTableStatusUser.DataBind();
                        foreach (RepeaterItem item in RTTableStatusUser.Items)
                        {
                            Label status = (Label)item.FindControl("lblStatus");

                            Label lblStats = (Label)item.FindControl("lblStats");

                            string ttStatus = status.Text;

                            if (ttStatus == "Pending")
                            {
                                lblStats.CssClass = "spinner-grow spinner-grow-sm text-warning";
                                status.CssClass = "text-warning";
                            }
                            if (ttStatus == "Occupied")
                            {
                                lblStats.CssClass = "spinner-grow spinner-grow-sm text-primary";
                                status.CssClass = "text-primary";
                            }
                        }
                    }
                    else
                    {
                        RTTableStatusUser.Visible = false;
                        LnkOrderFoodStatus.Visible = true;
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
                            Session["UserID"] = Convert.ToInt32(hndUserID.Value);
                        }
                    }
                    con.Close();
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


    }
}