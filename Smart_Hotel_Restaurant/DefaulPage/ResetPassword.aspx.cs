using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["recovery"] == null)
            {
                Response.Redirect("Homepage.aspx");
            }
            UserVerificationVoid();
            
        }

        private void UserVerificationVoid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string quer = "select * from Customer where email=@email or username=@username";
                    SqlCommand cmd = new SqlCommand(quer, con);
                    cmd.Parameters.AddWithValue("@email", Session["recovery"]);
                    cmd.Parameters.AddWithValue("@username", Session["recovery"]);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RptrUserVerification.DataSource = dt;
                        RptrUserVerification.DataBind();
                    }
                }
               
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void BtnVerication_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "update Customer set cpass=@cpass,pass=@pass where email=@email or username=@username ";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cpass", Utils.PasswordsCrip(txtPassword.Text));
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@email", Session["recovery"]);
                    cmd.Parameters.AddWithValue("@username", Session["recovery"]);
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i != 0)
                    {
                        Response.Write("<script>alert('Reset your Password Succesfully!')</script>");
                        LnkButtonProces.Visible = true;
                        BtnVerication.Enabled = false;
                        RequiredFieldValidator2.Enabled = false;
                        RegularExpressionValidator1.Enabled = false;
                        txtPassword.Enabled = false;
                        Response.Redirect("Homepage.aspx");
                    }
                }
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

       
        protected void LnkButtonProces_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

      
    }
}