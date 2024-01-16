using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;


namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class OrdersStatus : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindOrderListForApproval();
                await BindForApproval();
                await BindOverAll();
                await BindSuccessfullyTransactionTable();
                await BindReturnPayment();
                await BindTotalApproved();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindReturnPayment()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select COUNT(approval) as K from Tbl_Payment where approval='Return'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_ReturnPayment.DataSource = dt;
                    R_ReturnPayment.DataBind();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindSuccessfullyTransactionTable()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select a.*, b.* from Tbl_Payment a inner join Customer b on b.cusId = a.userID where a.approval='Approved' order by a.paymentId desc ";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_SucessfullyTransactionTable.DataSource = dt;
                    R_SucessfullyTransactionTable.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalApproved()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select COUNT(PaymentId) as Approveds from Tbl_Payment where approval='Approved'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_TotalApproved.DataSource = dt;
                    R_TotalApproved.DataBind();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindOverAll()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        await con.OpenAsync();
                    }
                    string query = "select COUNT(PaymentId) as OverAll from Tbl_Payment";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_OverAll.DataSource = dt;
                        R_OverAll.DataBind();
                    }
                }

            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindForApproval()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select COUNT(paymentId) as Pending from Tbl_Payment where approval='For Approval'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_Pending.DataSource = dt;
                    R_Pending.DataBind();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindOrderListForApproval()
        {
            try
            {
                /*
               SQL queries: This algorithm involves using SQL queries to retrieve data from a relational database.
               */
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select a.*, b.* from Tbl_Payment a inner join Customer b on b.cusId = a.userID where a.approval='For Approval'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    R_OrderlistForApproval.DataSource = dt;
                    R_OrderlistForApproval.DataBind();
                    LnkNoOrderFound.Visible = false;
                }
                else
                {
                    LnkNoOrderFound.Visible = true;
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}