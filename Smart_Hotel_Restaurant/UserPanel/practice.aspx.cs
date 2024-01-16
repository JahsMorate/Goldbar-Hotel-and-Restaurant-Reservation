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
    public partial class practice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
            BindCart();
        }

        private void BindCart()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Tbl_Cart";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sad.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Grid_Cart.DataSource = dt;
                        Grid_Cart.DataBind();
                    }
                    con.Close();
                }
           
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void Grid_Cart_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_Cart.PageIndex = e.NewPageIndex;
            this.BindCart();
          
        }
    }
}