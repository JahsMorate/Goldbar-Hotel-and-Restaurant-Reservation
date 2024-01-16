using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void UserLogin()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string query = "select * from Tbl_Customer where Cusername='" + Utils.PasswordsCrip(txtUser_usernameLogin.Text) + "' and Cpass='" + Utils.PasswordsCrip(ctxtPassword.Text) + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    while (dr.Read())
                    {
                        Session["UserName"] = Utils.PasswordsCrip(txtUser_usernameLogin.Text);
                        Response.Redirect("../UserPanel/HomeRoom.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Username and Password')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void Administrator()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM Admin WHERE admnu=@username AND adminpass=@password", con);
                cmd.Parameters.AddWithValue("@username", txtUser_usernameLogin.Text.Trim());
                cmd.Parameters.AddWithValue("@password", ctxtPassword.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["admin"] = txtUser_usernameLogin.Text.Trim();
                        Response.Redirect("../AdminPanel/ChartStatus.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (ddlLogin_Status.SelectedValue == "Administrator")
            {
                try
                {
                    SqlConnection con = new SqlConnection(Connection.GetConnection());
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Admintable WHERE adusername=@username AND pass=@password", con);
                    cmd.Parameters.AddWithValue("@username", txtUser_usernameLogin.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", ctxtPassword.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["admin"] = txtUser_usernameLogin.Text.Trim();
                            Response.Redirect("../AdminPanel/ChartStatus.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid')</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            else if (ddlLogin_Status.SelectedValue == "User")
            {
                try
                {
                    SqlConnection con = new SqlConnection(Connection.GetConnection());
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where cusername='" + Utils.PasswordsCrip(txtUser_usernameLogin.Text) + "' and cpass='" + Utils.PasswordsCrip(ctxtPassword.Text) + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            Session["UserName"] = Utils.PasswordsCrip(txtUser_usernameLogin.Text);
                            Response.Redirect("../UserPanel/HomeRoom.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Username and Password')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid please select your status')</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}