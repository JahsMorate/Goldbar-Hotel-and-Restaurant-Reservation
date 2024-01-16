using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class UserPanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GetUserID();
            if (!IsPostBack)
            {
                GetUserID();
                CountCart();
                GerUsernamee();
            }
            CountCart();
            GerUsernamee();
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }


        private void GerUsernamee()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where cusId='" + hndUserID.Value + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_username.DataSource = dt;
                        R_username.DataBind();
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
                SqlConnection con = new SqlConnection(Connection.GetConnection());
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
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void CountCart()
        {
            GetUserID();
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "select COUNT(crtId) as CartNumber from Tbl_Cart where Crt_Status ='Shipping' and userIdfk='" + hndUserID.Value + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_CountCartNo.DataSource = dt;
                    R_CountCartNo.DataBind();
                }
            }

            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        protected void LnkMyProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        protected void LnkLogout_Click1(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("../DefaulPage/Homepage.aspx");
        }

        protected void LnkFoodsandDrnks_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }

        protected void LnkTable_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTableArea.aspx");
        }
    }
}