using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class AdminRoomReservation : System.Web.UI.Page
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
                    string query = "SELECT * FROM Tbl_RReservation ORDER BY RRId DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        LnkViewRR.DataSource = dt;
                        LnkViewRR.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        private bool ExistingID()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string queyr = "select rrnumber from Tbl_RReservation where rrnumber=@rrnum";
                    SqlCommand cmd = new SqlCommand(queyr, con);
                    cmd.Parameters.AddWithValue("@rrnum", TxtRRName.Text.Trim());
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");
                return false;
            }
        }
        private async Task AddRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string status = "Available";
                    string query = "AddingRoomReservation_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                    }

                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload2.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@img02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload3.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@img03", linkpath03);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                    }
                    cmd.Parameters.AddWithValue("@rrnumber", TxtRRName.Text.Trim());
                    cmd.Parameters.AddWithValue("@rrPrice", TxtRPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@rrDescription", TxtRRDescription.Text);
                    cmd.Parameters.AddWithValue("@rrCompability", DdlCompability.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrStatus", status);
                    cmd.Parameters.AddWithValue("@rrBed", ddlBed.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrBathroom", ddbathRoom.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrFloor", ddlFloor.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrFname", txtFname.Text.Trim());
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        TxtRPrice.Text = string.Empty;
                        TxtRRDescription.Text = string.Empty;
                        TxtRRName.Text = string.Empty;
                        DdlCompability.SelectedValue = "Select";
                        ddlBed.SelectedValue = "Select";
                        ddbathRoom.SelectedValue = "Select";
                        ddlFloor.SelectedValue = "Select";
                        txtFname.Text = string.Empty;
                        await BindRoomReservation();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Successully!','Added New Room Reservation','success')", true);
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        protected async void LnkRoomReservation_Click(object sender, EventArgs e)
        {
            if (ExistingID())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Important Message','This number is already use','error')", true);
                TxtRRName.Text = string.Empty;
            }
            else
            {
                await AddRoomReservation();
            }
        }

        protected async void LnkViewRR_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (LnkViewRR.FindControl("dataPageAll") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            await this.BindRoomReservation();
        }

        protected async void LnkEdit_Click(object sender, EventArgs e)
        {
            int intEID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "SELECT * FROM Tbl_RReservation where RRId=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", intEID);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        rrhnd.Value = dt.Rows[0]["RRId"].ToString();
                        TxtRRName.Text = dt.Rows[0]["rrnumber"].ToString();
                        TxtRPrice.Text = dt.Rows[0]["rrPrice"].ToString();
                        TxtRRDescription.Text = dt.Rows[0]["rrDescription"].ToString();
                        DdlCompability.SelectedValue = dt.Rows[0]["rrCompability"].ToString();
                        ddlBed.SelectedValue = dt.Rows[0]["rrBed"].ToString();
                        ddbathRoom.SelectedValue = dt.Rows[0]["rrBathroom"].ToString();
                        ddlFloor.SelectedValue = dt.Rows[0]["rrFloor"].ToString();
                        txtFname.Text = dt.Rows[0]["rrFname"].ToString();
                        LnkUpdateRRR.Visible = true;
                        LnkRoomReservation.Visible = false;
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        void Clear()
        {
            TxtRPrice.Text = string.Empty;
            TxtRRDescription.Text = string.Empty;
            TxtRRName.Text = string.Empty;
            DdlCompability.SelectedValue = "Select";
            rrhnd.Value = string.Empty;
        }
        protected async void LnkDelete_Click(object sender, EventArgs e)
        {
            int intEID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "delete FROM Tbl_RReservation where RRId=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", intEID);
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Deleted Successfully!','success')", true);
                        await BindRoomReservation();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Error: " + ex.Message + "')</scrip>");

            }
        }

        protected void LnkResetRR_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected async void LnkUpdateRRR_Click(object sender, EventArgs e)
        {
            if (ExistingID())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Important Message','This number is already use','error')", true);
                TxtRRName.Text = string.Empty;
            }
            else
            {
              await  UpdateRoomReservation();
            }
        }
        private async Task UpdateRoomReservation()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "UpdateRoomReservation_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','info')", true);
                    }

                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload2.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@img02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','info')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload3.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@img03", linkpath03);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','info')", true);
                    }
                    string avail= "Available";
                    cmd.Parameters.AddWithValue("@rrnumber", TxtRRName.Text.Trim());
                    cmd.Parameters.AddWithValue("@rrprice", TxtRPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@rrDescription", TxtRRDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@rrCompability", DdlCompability.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrStatus", avail);
                    cmd.Parameters.AddWithValue("@rrBed", ddlBed.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrBathroom", ddbathRoom.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrFloor", ddlFloor.SelectedValue);
                    cmd.Parameters.AddWithValue("@rrFname", txtFname.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", int.Parse(rrhnd.Value));
                    
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Updated Successfully!','success')", true);
                        await BindRoomReservation();
                        TxtRPrice.Text = string.Empty;
                        TxtRRDescription.Text = string.Empty;
                        TxtRRName.Text = string.Empty;
                        DdlCompability.SelectedValue = "Select";
                        rrhnd.Value = string.Empty;
                        ddlBed.SelectedValue = "Select";
                        ddbathRoom.SelectedValue = "Select";
                        ddlFloor.SelectedValue = "Select";
                        txtFname.Text = string.Empty;
                        LnkUpdateRRR.Visible = false;
                        LnkRoomReservation.Visible = true;
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