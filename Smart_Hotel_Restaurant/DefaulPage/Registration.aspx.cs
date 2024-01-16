using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
            
        }

        protected async void BtnRegistered_Click(object sender, EventArgs e)
        {
            /*
                Simple Existence Check - is not an algorithm by itself, but it could be a step or
            component of an algorithm.

                */

            if (ExingstingUsernameUser())
            {
                Response.Write("<script>alert('This Username " + TxtUser_Username.Text + " is already taken')</script>");
                TxtUser_Username.Text = string.Empty;
            }
            else if (ExistingGcashAccount())
            {
                Response.Write("<script>alert('This Gcash " + txtGcashNumber.Text + " is already taken')</script>");
                txtGcashNumber.Text = string.Empty;
            }
            else if (ExistingEmail())
            {
                Response.Write("<script>alert('This Email " + txtUserEmail.Text + " is already taken')</script>");
                txtUserEmail.Text = string.Empty;
            }
            else
            {
                await ForRegistration();
            }
            
        }

        // This is Stable Don't touch it

        private async Task ForRegistration()
        {
            try
            {
                /*
                 Greedy algorithms
                    - This technique involves making the locally optimal choice at each step of a problem in order to achieve a globally optimal solution. In the context of stored procedures, this could involve optimizing queries to make the most efficient use of available database resources.

                 */

                string lgnStatus = "User";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "insert into Customer(lname, fname, mi, gender, number, gnumber, email, username, passs, cusername, cpass, ustatus) " +
                        "values (@lname, @fname, @mi, @gender, @number, @gnumber, @email, @username, @pass, @cusername, @cpass, @status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@lname", TxtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@fname", TxtFistName.Text.Trim());
                    cmd.Parameters.AddWithValue("@mi", TxtMI.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", ddlUserGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@number", txtUser_ContactNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@gnumber", txtGcashNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtUserEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@username", TxtUser_Username.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@cusername", Utils.PasswordsCrip(TxtUser_Username.Text));
                    cmd.Parameters.AddWithValue("@cpass", Utils.PasswordsCrip(txtPassword.Text));
                    cmd.Parameters.AddWithValue("@status", lgnStatus);
                    int i = await cmd.ExecuteNonQueryAsync();
                    if (i > 0)
                    {
                        Response.Write("<script>alert('Register Successfully!')</script>");
                        clearAfterRegistered();
                    }
                    else
                    {
                        Response.Write("<script>alert('Please try again')</script>");
                    }
                   
                }
                
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        // This is Stable Don't touch it
        bool ExistingEmail()
        {
            try
            { /*
                Simple Existence Check - is not an algorithm by itself, but it could be a step or
            component of an algorithm.

                */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where email='" + txtUserEmail.Text.Trim() + "'";
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
        bool ExistingGcashAccount()
        {
            try
            { /*
                Simple Existence Check - is not an algorithm by itself, but it could be a step or
            component of an algorithm.

                */

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where gcashNo='" + txtGcashNumber.Text.Trim() + "'";
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

        // This is Stable Don't touch it
        bool ExingstingUsernameUser()
        {
            try
            { /*
                Simple Existence Check - is not an algorithm by itself, but it could be a step or
            component of an algorithm.

                */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Customer where username='" + TxtUser_Username.Text.Trim() + "'";
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

        // This is Stable Don't touch it
        void clearAfterRegistered()
        {
            TxtFistName.Text = string.Empty;
            TxtLastName.Text = string.Empty;
            TxtMI.Text = string.Empty;
            ddlUserGender.SelectedValue = "Select";
            txtUser_ContactNo.Text = string.Empty;
            txtGcashNumber.Text = string.Empty;
            txtUserEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}