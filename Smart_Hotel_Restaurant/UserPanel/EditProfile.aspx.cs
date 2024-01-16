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

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               await UpdatingUserInfo();
            }
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

       


        private async Task UpdatingUserInfo()
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["ID"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "UpdatingCustomer_SP";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Images/UserImage/") + Path.GetFileName(FileUpload1.FileName));
                        string linkpath = "Images/UserImage/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@profileImage", linkpath);
                    }
                    cmd.Parameters.AddWithValue("@cusID", id);
                    cmd.Parameters.AddWithValue("@lname", txtLname.Text.Trim());
                    cmd.Parameters.AddWithValue("@fname", txtFname.Text.Trim());
                    cmd.Parameters.AddWithValue("@mi", txtMI.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", ddlUserGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@bod", TxtBOD.Text.Trim());
                    cmd.Parameters.AddWithValue("@pob", txtPOB.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@contactNo", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@gcashNO", txtGcash.Text.Trim());
                    cmd.Parameters.AddWithValue("@cemail", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@username", Utils.PasswordsCrip(txtUsername.Text));
                    cmd.Parameters.AddWithValue("@pass", Utils.PasswordsCrip(txtPassword.Text));
                    cmd.Parameters.AddWithValue("@CCusername", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@CCpass", txtPassword.Text.Trim());
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        Response.Write("<script>alert('Updated Successfully!')</script>");
                        if (i == 1)
                        {
                            Response.Write("<script>alert('Updated Successfully!')</script>");
                            Response.Redirect("ViewProfile.aspx");
                        }
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

        protected async void LnkUpdate_Click(object sender, EventArgs e)
        {
            if (ExingstingUsernameUser())
            {
                Response.Write("<script>alert('This Username " + txtUsername.Text.Trim() + " is already taken')</script>");
                txtUsername.Text = string.Empty;
            }
            else if (ExistingGcashAccount())
            {
                Response.Write("<script>alert('This Gcash " + txtGcash.Text.Trim() + " is already taken')</script>");
                txtGcash.Text = string.Empty;
            }
            else if (ExistingEmail())
            {
                Response.Write("<script>alert('This Email " + txtEmail.Text.Trim() + " is already taken')</script>");
                txtEmail.Text = string.Empty;
            }
            else
            {
               await UpdatingUserInfo();
            }
        }
        bool ExistingEmail()
        {
            try
            {

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Tbl_Customer where Cemail='" + txtEmail.Text.Trim() + "'";
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
            {

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Tbl_Customer where gcashNo='" + txtGcash.Text.Trim() + "'";
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
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "select * from Tbl_Customer where Cusername='" + Utils.PasswordsCrip(txtUsername.Text) + "'";
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
    }
}