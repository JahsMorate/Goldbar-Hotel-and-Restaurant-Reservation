using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreateAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void BtnVerication_Click(object sender, EventArgs e)
        {
            VerificationText();
        }

        private void VerificationText()
        {
            try
            {

                string username = "";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where email=@email or username=@username ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@email", TxtVerification.Text);
                    cmd.Parameters.AddWithValue("@username", TxtVerification.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            Session["recovery"] = TxtVerification.Text.Trim();
                            Response.Redirect("ResetPassword.aspx");
                        }
                    }
                   
                }
               
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}