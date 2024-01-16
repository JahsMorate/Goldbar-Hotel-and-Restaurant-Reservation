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
    public partial class FoodOrderStatus : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
            if (!IsPostBack)
            {
                GetUserID();
                await BindUserOrderStatus();
            }
        }

        private async Task BindUserOrderStatus()
        {
            using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
            {
                GetUserID();
                await con.OpenAsync();
                string query = "select a.*, b.* from Tbl_Payment a inner join Customer b on b.cusId = a.userID where b.cusId=@userID and a.approval='For Approval'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userID", hndUserID.Value);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ROrderStatusUser.DataSource = dt;
                    ROrderStatusUser.DataBind();
                    ROrderStatusUser.Visible = true;
                    LnkOrderFoodStatus.Visible = false;

                    foreach (RepeaterItem items in ROrderStatusUser.Items)
                    {
                        LinkButton clear = (LinkButton)items.FindControl("lnkClearMessage");
                        LinkButton lnkPending = (LinkButton)items.FindControl("lnkPending");
                        Label staut = (Label)items.FindControl("lblStatus");
                        Label spinner = (Label)items.FindControl("lblSpinner");
                        string status = staut.Text.Trim();
                        if (status == "For Approval")
                        {
                            clear.Visible = false;
                            lnkPending.Visible = false;
                            lnkPending.CssClass = "text-warning";
                            spinner.CssClass = "spinner-grow spinner-grow-sm text-warning";
                            staut.CssClass = "text-warning";
                        }
                        else if (status == "Approved")
                        {
                            clear.Visible = true;
                            lnkPending.Visible = false;
                            clear.CssClass = "text-danger";
                            spinner.CssClass = "spinner-grow spinner-grow-sm text-success";
                            staut.CssClass = "text-success";
                        }
                        else if (status == "Return")
                        {
                            clear.Visible = true;
                            clear.CssClass = "text-danger";
                            lnkPending.Visible = false;
                            spinner.CssClass = "spinner-grow spinner-grow-sm text-danger";
                            staut.CssClass = "text-danger";
                        }
                    }
                }
                else
                {
                    ROrderStatusUser.Visible = false;
                    LnkOrderFoodStatus.Visible = true;
                }

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