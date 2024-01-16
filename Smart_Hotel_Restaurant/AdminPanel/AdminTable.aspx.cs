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
    public partial class AdminTable : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindTableData();
                await BindTableLuzon();
                await BindTableVisayas();
                await BindTableMindanao();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindTableMindanao()
        {
            try
            {
                /*
                 SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();

                    string query = "select COUNT(TblId) as Mindanaos from Tbl_Table where table_area='Mindanao'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RMindanao.DataSource = dt;
                        RMindanao.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTableVisayas()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();

                    string query = "select COUNT(TblId) as Visayas from Tbl_Table where table_area='Visayas'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RVisayas.DataSource = dt;
                        RVisayas.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTableLuzon()
        {
            try
            {  /*
                 SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Luzons from Tbl_Table where table_area='Luzon'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RLuzons.DataSource = dt;
                        RLuzons.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTableData()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();

                    string query = "select * from Tbl_Table order by TblId desc";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        ListViewTable.DataSource = dt;
                        ListViewTable.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindAllTable()
        {
            try
            {

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    /*
                     Stored Procedure Insert: This algorithm involves defining a stored procedure that encapsulates the logic
                    for inserting data into a table, and calling the procedure with the required parameters.
                     */
                    string avail = "Available";
                    await con.OpenAsync();
                    string query = "AddingTable_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@table_area", DdlArea.SelectedValue);
                    cmd.Parameters.AddWithValue("@table_type", DdlTableType.SelectedValue);
                    cmd.Parameters.AddWithValue("@table_desc", TxtDescriptionRoom.Text.Trim());
                    cmd.Parameters.AddWithValue("@table_No", TxtTableNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@table_status", avail);

                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@image01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','error')", true);
                    }

                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload2.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@image02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','error')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload3.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@image03", linkpath03);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','error')", true);
                    }

                    int suc = cmd.ExecuteNonQuery();
                    if (suc != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','Added Succcessfully!','success')", true);
                        await BindTableData();
                        await BindTableLuzon();
                        await BindTableVisayas();
                        await BindTableMindanao();
                        DdlArea.SelectedValue = "Select";
                        DdlTableType.SelectedValue = "Select";
                        TxtTableNo.Text = string.Empty;
                        TxtDescriptionRoom.Text = string.Empty;
                    }

                }

            }



            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private bool ExistingTableNo()
        {
            try
            {
                /*
                 The Duplicate Avoidance Algorithm is a strategy for preventing duplicate data 
                from being added to a database. The algorithm typically involves checking if the data already exists in the database before attempting to insert it. If the data does already exist, the algorithm will either reject the new data or update 
                the existing data, depending on the specific requirements of the system.
                 */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    string query = "select * from Tbl_Table where table_No='" + TxtTableNo.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
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

                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        protected async void LnkAddTable_Click(object sender, EventArgs e)
        {
            if (ExistingTableNo())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','This number is already use','error')", true);

            }
            else
            {
                await BindAllTable();
            }
        }

        protected async void ListViewTable_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewTable.FindControl("dataPageAll") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            await this.BindTableData();
        }

        protected void LnkResetFoods_Click(object sender, EventArgs e)
        {
            DdlArea.SelectedValue = "Select";
            DdlTableType.SelectedValue = "Select";
            TxtTableNo.Text = string.Empty;
            TxtDescriptionRoom.Text = string.Empty;
            hndTableID.Value = string.Empty;
        }

        protected async void LnkEdit_Click(object sender, EventArgs e)
        {
            try
            {
                int intEID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select * from Tbl_Table where TblId='" + intEID + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        hndTableID.Value = dt.Rows[0]["TblId"].ToString();
                        DdlArea.SelectedValue = dt.Rows[0]["table_area"].ToString();
                        DdlTableType.SelectedValue = dt.Rows[0]["table_type"].ToString();
                        TxtDescriptionRoom.Text = dt.Rows[0]["table_desc"].ToString();
                        TxtTableNo.Text = dt.Rows[0]["table_No"].ToString();
                        LnkAddTable.Visible = false;
                        LnkUpdate.Visible = true;
                    }

                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkUpdate_Click(object sender, EventArgs e)
        {
            if (ExistingTableNo())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('','This number is already use','error')", true);
            }
            else
            {
                await UpdateTable();
            }
        }

        private async Task UpdateTable()
        {
            try
            {
                /*
                 Simple Update Stored Procedure: This is a basic stored procedure that takes 
                input parameters to identify the row(s)
                to be updated and the new values to be assigned to the specified fields.
                 */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "UpdateTable_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", hndTableID.Value);
                    cmd.Parameters.AddWithValue("@table_area", DdlArea.SelectedValue);
                    cmd.Parameters.AddWithValue("@table_type", DdlTableType.SelectedValue);
                    cmd.Parameters.AddWithValue("@table_desc", TxtDescriptionRoom.Text.Trim());
                    cmd.Parameters.AddWithValue("@table_No", TxtTableNo.Text.Trim());
                    //image01
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath01 = "Images/FoodImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@image01", linkpath01);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 1 is Empty please insert it','error')", true);
                    }

                    // image02
                    if (FileUpload2.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath02 = "Images/FoodImage/" + Path.GetFileName(FileUpload2.FileName);
                        cmd.Parameters.AddWithValue("@image02", linkpath02);

                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 2 is Empty please insert it','error')", true);
                    }

                    // image03
                    if (FileUpload3.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/FoodImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath03 = "Images/FoodImage/" + Path.GetFileName(FileUpload3.FileName);
                        cmd.Parameters.AddWithValue("@image03", linkpath03);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Image 3 is Empty please insert it','error')", true);
                    }
                    int update = cmd.ExecuteNonQuery();
                    if (update != 0)
                    {
                        LnkUpdate.Visible = false;
                        LnkAddTable.Visible = true;
                        await BindTableLuzon();
                        await BindTableVisayas();
                        await BindTableMindanao();
                        await BindTableData();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Good job!','Updated Successfully!','success')", true);
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int intEID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "delete from Tbl_Table where TblId='" + intEID + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int delete = await cmd.ExecuteNonQueryAsync();
                    if (delete != 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "k", "swal('Information','Deleted Succesfully!','success')", true);
                        await BindTableData();
                        await BindTableLuzon();
                        await BindTableVisayas();
                        await BindTableMindanao();
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