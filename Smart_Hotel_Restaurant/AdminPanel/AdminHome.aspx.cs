using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;
namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await GridRoomsBind();
            }
            
        }

        private async Task GridRoomsBind()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string querys = "select * from Tbl_Room order by RoomId desc";
                SqlCommand cmd = new SqlCommand(querys, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    GridRooms.DataSource = dt;
                    GridRooms.DataBind();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkAddRoms_Click(object sender, EventArgs e)
        {
            if (ExistingRoomNO())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Warning!','This Room No. is Already use','error')", true);
                TxtRoomNo.Text = string.Empty;
            }
            else
            {
                await AddingRooms();
            }

        }

        bool ExistingRoomNO()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "select * from Tbl_Room where rNumber='" + TxtRoomNo.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        private async Task AddingRooms()
        {
            try
            {
                string status = "Reservation";
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "AddingRooms_SP";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rNumber", TxtRoomNo.Text.Trim());
                cmd.Parameters.AddWithValue("@rprice", TxtPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@rCompability", DdlCompability.SelectedValue);
                cmd.Parameters.AddWithValue("@rRoomType", DdlRoomType.SelectedValue);
                cmd.Parameters.AddWithValue("@rDescription", TxtDescriptionRoom.Text.Trim());
                cmd.Parameters.AddWithValue("@rStatus", status);
                //image01
                if (FplRoom1.HasFile)
                {
                    FplRoom1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom1.FileName));
                    string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FplRoom1.FileName);
                    cmd.Parameters.AddWithValue("@roomImage01", linkpath01);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                }


                // image02
                if (FplRoom2.HasFile)
                {
                    FplRoom2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom2.FileName));
                    string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FplRoom2.FileName);
                    cmd.Parameters.AddWithValue("@roomImage02", linkpath02);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                }

                // image03
                if (FplRoom3.HasFile)
                {
                    FplRoom3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom3.FileName));
                    string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FplRoom3.FileName);
                    cmd.Parameters.AddWithValue("@roomImage03", linkpath03);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                }

                // image04
                if (FplRoom4.HasFile)
                {
                    FplRoom4.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom4.FileName));
                    string linkpath04 = "Images/FoodImage/" + Path.GetFileName(FplRoom4.FileName);
                    cmd.Parameters.AddWithValue("@roomImage04", linkpath04);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 4 is Empty please insert it','info')", true);
                }

                // image05
                if (FplRoom5.HasFile)
                {
                    FplRoom5.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom5.FileName));
                    string linkpath05 = "Images/FoodImage/" + Path.GetFileName(FplRoom5.FileName);
                    cmd.Parameters.AddWithValue("@roomImage05", linkpath05);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 5 is Empty please insert it','info')", true);
                }

                // image06
                if (FplRoom6.HasFile)
                {
                    FplRoom6.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom6.FileName));
                    string linkpath06 = "Images/FoodImage/" + Path.GetFileName(FplRoom6.FileName);
                    cmd.Parameters.AddWithValue("@roomImage06", linkpath06);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 6 is Empty please insert it','info')", true);
                }
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Added Successfully!','','success')", true);
                    await GridRoomsBind();
                    ClearDate();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void GridRooms_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridRooms.PageIndex = e.NewPageIndex;
            await this.GridRoomsBind();
        }

        protected async void LnkDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int RoomID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "delete from Tbl_Room where RoomId='" + RoomID + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Deleted Successfully!','','success')", true);
                    await GridRoomsBind();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkEdit_Click(object sender, EventArgs e)
        {
            try
            {
                int RoomID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select * from Tbl_Room where RoomId='" + RoomID + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    TxtRoomNo.Text = dt.Rows[0]["rNumber"].ToString();
                    TxtPrice.Text = dt.Rows[0]["rprice"].ToString();
                    TxtDescriptionRoom.Text = dt.Rows[0]["rDescription"].ToString();
                    DdlCompability.SelectedValue = dt.Rows[0]["rCompability"].ToString();
                    DdlRoomType.SelectedValue = dt.Rows[0]["rRoomType"].ToString();
                    HndRoomID.Value = dt.Rows[0]["RoomId"].ToString();
                    LnkUpdate.Visible = true;
                    LnkAddRoms.Visible = false;
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkUpdate_Click(object sender, EventArgs e)
        {
            if (ExistingRoomNO())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Error','This is Room No. is already taken','danger')", true);
            }
            else
            {
                await UpdateRoomFromGridView();
            }
        }

        private async Task UpdateRoomFromGridView()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string status = "Reservation";
                string query = "UpdateRooms_SP";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RoomId", int.Parse(HndRoomID.Value));
                cmd.Parameters.AddWithValue("@rNumber", TxtRoomNo.Text.Trim());
                cmd.Parameters.AddWithValue("@rprice", TxtPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@rCompability", DdlCompability.SelectedValue);
                cmd.Parameters.AddWithValue("@rRoomType", DdlRoomType.SelectedValue);
                cmd.Parameters.AddWithValue("@rDescription", TxtDescriptionRoom.Text.Trim());
                cmd.Parameters.AddWithValue("@rStatus", status);
                //image01
                if (FplRoom1.HasFile)
                {
                    FplRoom1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom1.FileName));
                    string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FplRoom1.FileName);
                    cmd.Parameters.AddWithValue("@roomImage01", linkpath01);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                }


                // image02
                if (FplRoom2.HasFile)
                {
                    FplRoom2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom2.FileName));
                    string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FplRoom2.FileName);
                    cmd.Parameters.AddWithValue("@roomImage02", linkpath02);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                }

                // image03
                if (FplRoom3.HasFile)
                {
                    FplRoom3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom3.FileName));
                    string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FplRoom3.FileName);
                    cmd.Parameters.AddWithValue("@roomImage03", linkpath03);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                }

                // image04
                if (FplRoom4.HasFile)
                {
                    FplRoom4.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom4.FileName));
                    string linkpath04 = "Images/FoodImage/" + Path.GetFileName(FplRoom4.FileName);
                    cmd.Parameters.AddWithValue("@roomImage04", linkpath04);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 4 is Empty please insert it','info')", true);
                }

                // image05
                if (FplRoom5.HasFile)
                {
                    FplRoom5.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom5.FileName));
                    string linkpath05 = "Images/FoodImage/" + Path.GetFileName(FplRoom5.FileName);
                    cmd.Parameters.AddWithValue("@roomImage05", linkpath05);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 5 is Empty please insert it','info')", true);
                }

                // image06
                if (FplRoom6.HasFile)
                {
                    FplRoom6.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FplRoom6.FileName));
                    string linkpath06 = "Images/FoodImage/" + Path.GetFileName(FplRoom6.FileName);
                    cmd.Parameters.AddWithValue("@roomImage06", linkpath06);

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 6 is Empty please insert it','info')", true);
                }
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Updated Succesfully1','success')", true);
                    await GridRoomsBind();
                    LnkUpdate.Visible = false;
                    LnkAddRoms.Visible = true;
                    ClearDate();
                }


            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void ClearDate()
        {
            HndRoomID.Value = string.Empty;
            TxtDescriptionRoom.Text = string.Empty;
            TxtPrice.Text = string.Empty;
            TxtRoomNo.Text = string.Empty;
        }

        protected void LnkResetFoods_Click(object sender, EventArgs e)
        {
            ClearDate();
        }
    }
}