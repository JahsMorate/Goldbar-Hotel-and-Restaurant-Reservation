using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class ChartStatus : System.Web.UI.Page
    {
        public static string totalUser { get; set; }
        public static string totalRReservation { get; set; }
        public static string totalTtReservation { get; set; }
        public static string totalFood { get; set; }
        public static string totalNetIncome { get; set; }
        public static string totalFoodIncome { get; set; }
        public static string totalRReservationIncome { get; set; }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await BindTotalSalefoods();
                await BindForApproval();
                await BindTotalPending();
                await BindRRTotalPending();
                await BindTotalUser();
                await BindTotalRoomReservation();
                await BindTotalTReservation();
                await BindTotalFood();
                await TotalINcomeChart();

            }
            if (Session["admin"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        private async Task TotalINcomeChart()
        {
            try
            {
                string query = "SELECT  SUM(CASE WHEN paymentType = 'Room' THEN overallPayment ELSE 0 END) as roomSale, SUM(CASE WHEN paymentType = 'Foods' AND statsPayment = 'Confirm' THEN overallPayment ELSE 0 END) as foodSale, SUM(CASE WHEN statsPayment = 'Confirm' THEN overallPayment ELSE 0 END) as TotalSale FROM TblPaymentF";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        totalNetIncome = dt.Rows[0]["TotalSale"].ToString();
                        totalFoodIncome = dt.Rows[0]["foodSale"].ToString();
                        totalRReservationIncome = dt.Rows[0]["roomSale"].ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        private async Task BindTotalFood()
        {
            try
            {
                string query = "select COUNT(FoodId) as TotalFood from Tbl_Food";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        totalFood = dt.Rows[0]["TotalFood"].ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalTReservation()
        {
            try
            {
                string query = "select COUNT(RRId) as TotalRReservation from Tbl_RReservation";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        totalRReservation = dt.Rows[0]["TotalRReservation"].ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        private async Task BindTotalRoomReservation()
        {
            try
            {
                string query = "select COUNT(TblId) as TotalTReservation from Tbl_Table";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        totalTtReservation = dt.Rows[0]["TotalTReservation"].ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalUser()
        {
            try
            {
                string query = "select COUNT(cusId) as TotalUser from Customer";
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        totalUser = dt.Rows[0]["TotalUser"].ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        private async Task BindRRTotalPending()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(RRId) as RRPending from Tbl_RReservation where rrStatus='Pending'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        RReservationPending.DataSource = dt;
                        RReservationPending.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindTotalPending()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select COUNT(TblId) as Pendings from Tbl_Table where table_status='Pending'";
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
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        private async Task BindForApproval()
        {
            try
            {
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select COUNT(PaymentId) as Pending from Tbl_Payment where approval='For Approval'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    RfoodsOrdeer.DataSource = dt;
                    RfoodsOrdeer.DataBind();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }
        private async Task BindTotalSalefoods()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string query = "select SUM(overallPayment) as TotalSale from TblPaymentF where statsPayment='Confirm'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {

                        RtotalFoodSale.DataSource = dt;
                        RtotalFoodSale.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script");
            }
        }
    }
}