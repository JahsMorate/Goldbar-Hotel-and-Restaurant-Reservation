using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class ViewListOrder : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                await BindTotalBalanced();
                await BindListOrder();
                await BindPaymentStatus();
                await BindUserInformation();
                GetRecordToUpdateForPaymentConfirm();
                await BindCartRecordTotalPrice();
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }

        private async Task BindCartRecordTotalPrice()
        {
            try
            { //BINARY SEARCH
                string datePurchase = (Request.QueryString["datePurchase"]);
                SqlConnection con = new SqlConnection(Connection.GetConnection());
                await con.OpenAsync();
                string query = "select SUM(Crt_OriginalPrice) as F from Tbl_Cart where Crt_DatePurchase='" + datePurchase + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    TxtTotalPrice.Text = dt.Rows[0]["F"].ToString();
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void GetRecordToUpdateForPaymentConfirm()
        {
            try
            {
                //BINARY SEARCH
                string datePurchase = (Request.QueryString["datePurchase"]);

                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    con.Open();
                    string query = "select * from Tbl_Payment where orderDate='" + datePurchase + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        while (dr.Read())
                        {
                            HndPaymendID.Value = dr.GetValue(0).ToString();
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }


        private async Task BindTotalBalanced()
        {
            try
            {
                /*
                    Payment Calculation Algorithm:This algorithm is used to calculate the 
                remaining balance, amount paid, and percentage of payment based on a given 
                total price, down payment, and monthly payment.                 
                 */

                string datePurchase = (Request.QueryString["datePurchase"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {

                    await con.OpenAsync();
                    string querys = "SELECT FORMAT(SUM(a.Crt_TotalPrice) + SUM(a.Crt_Qty), 'N2') as bayadan, FORMAT(b.txtAmount, 'N2') as gebaydan, FORMAT((SUM(a.Crt_TotalPrice) + SUM(a.Crt_Qty)) - b.txtAmount, 'N2') as customerBalanced, FORMAT(b.txtAmount / SUM(a.Crt_TotalPrice) * 100, 'N2')  as finalPurcento FROM Tbl_Cart a  INNER JOIN Tbl_Payment b ON b.orderDate = a.Crt_DatePurchase WHERE a.Crt_DatePurchase=@date GROUP BY b.txtAmount";
                    SqlCommand cmd = new SqlCommand(querys, con);
                    cmd.Parameters.AddWithValue("@date", datePurchase);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_AmountTotalRemainingBalanced.DataSource = dt;
                        R_AmountTotalRemainingBalanced.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //Thsi is stable dont touch it
        private async Task BindListOrder()
        {
            try
            {
                //BINARY SEARCH
                string datePurchase = (Request.QueryString["datePurchase"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {
                    await con.OpenAsync();
                    string querys = "select a.*, b.*, c.*, c.fimg01 as foodImage from Tbl_Cart a inner join Tbl_Food c on c.FoodId = a.foodIdfk inner join Tbl_Payment b on b.orderDate = a.Crt_DatePurchase where a.Crt_DatePurchase='" + datePurchase + "' and a.Crt_Status='For Approval'";
                    SqlCommand cmd = new SqlCommand(querys, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_ListOrder.DataSource = dt;
                        R_ListOrder.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private async Task BindPaymentStatus()
        {
            try
            {
                //BINARY SEARCH
                string datePurchase = (Request.QueryString["datePurchase"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {

                    await con.OpenAsync();
                    string querys = "select a.*, b.* from Tbl_Payment a inner join Tbl_Customer b on b.CusID = a.userID where a.approval='For Approval' and a.orderDate='" + datePurchase + "'";
                    SqlCommand cmd = new SqlCommand(querys, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_OrderSummary.DataSource = dt;
                        R_OrderSummary.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //This is stable for Binding Simple data from user
        private async Task BindUserInformation()
        {
            try
            {

                string datePurchase = (Request.QueryString["datePurchase"]);
                using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                {

                    await con.OpenAsync();
                    string querys = "select a.*, b.* from Customer a inner join Tbl_Payment b on b.userID = a.cusId where orderDate='" + datePurchase + "'";
                    SqlCommand cmd = new SqlCommand(querys, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        R_UserOrderListInfo.DataSource = dt;
                        R_UserOrderListInfo.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected async void LnkConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                await BindCartRecordTotalPrice();
                GetRecordToUpdateForPaymentConfirm();


                foreach (RepeaterItem item in R_UserOrderListInfo.Items)
                {
                    var userEmail = (Label)item.FindControl("lblEmail");
                    string emails = userEmail.Text.Trim();
                    string datePurchase = (Request.QueryString["datePurchase"]);
                    decimal updatePrice = Convert.ToDecimal(TxtTotalPrice.Text);
                    string approveds = "Approved";
                    using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                    {

                        await con.OpenAsync();
                        string querys = "update Tbl_Payment set approval='" + approveds + "' , txtAmount='" + updatePrice + "' where PaymentId='" + HndPaymendID.Value + "' and orderDate='" + datePurchase + "'";
                        SqlCommand cmd = new SqlCommand(querys, con);


                        // This is for sending email
                        string adminEmail = "goldbarreservation@gmail.com";
                        string pass = "wrkfmfmdlypdtrcv";

                        MailMessage message = new MailMessage();
                        message.From = new MailAddress(adminEmail);
                        message.Subject = "Order Status";
                        message.To.Add(new MailAddress(emails));
                        message.Body = $"<html><body>Hi, {emails} We would like to inform you that your order status has been approved by our administration team. Thank you for choosing to purchase our food products. We appreciate your business and look forward to serving you in the future.</br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                        message.IsBodyHtml = true;

                        var smtpClient = new SmtpClient("smtp.gmail.com")
                        {
                            Port = 587,
                            Credentials = new NetworkCredential(adminEmail, pass),
                            EnableSsl = true,
                        };

                        smtpClient.Send(message);
                        int updates = cmd.ExecuteNonQuery();
                        if (updates != 0)
                        {


                            foreach (RepeaterItem items in R_AmountTotalRemainingBalanced.Items) 
                            {
                                Label totalPayment = (Label)items.FindControl("lblTotalPayment");
                                decimal confirmPaymentPrice = Convert.ToDecimal(totalPayment.Text);
                                string foods = "Foods";
                                string confirmPayment = "Confirm";
                                string query4 = "insert into TblPaymentF (statsPayment, overallPayment, paymentType) values (@statsPayment, @overallPayment, @paymentType)";
                                SqlCommand cmd4 = new SqlCommand(query4, con);
                                cmd4.Parameters.AddWithValue("@statsPayment", confirmPayment);
                                cmd4.Parameters.AddWithValue("@overallPayment", confirmPaymentPrice);
                                cmd4.Parameters.AddWithValue("@paymentType", foods);
                                await cmd4.ExecuteNonQueryAsync();
                            }

                            await BindCartRecordTotalPrice();
                            GetRecordToUpdateForPaymentConfirm();
                            string approved = "Approved";
                            string datePurchases = (Request.QueryString["datePurchase"]);
                            string query = "update Tbl_Cart set Crt_Status='" + approved + "' where Crt_DatePurchase='" + datePurchase + "'";
                            SqlCommand cmds = new SqlCommand(query, con);
                            await cmds.ExecuteNonQueryAsync();
                            Response.Redirect("OrdersStatus.aspx");
                            Response.Write("<script>alert('Transaction Succesfully!')</script>");
                        }
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        protected async void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                await BindCartRecordTotalPrice();
                GetRecordToUpdateForPaymentConfirm();

                foreach (RepeaterItem items in R_UserOrderListInfo.Items)
                {
                    var emailUser = (Label)items.FindControl("lblEmail");

                    string datePurchase = (Request.QueryString["datePurchase"]);
                    decimal updatePrice = Convert.ToDecimal(TxtTotalPrice.Text);
                    string approveds = "Return";
                    using (SqlConnection con = new SqlConnection(Connection.GetConnection()))
                    {

                        await con.OpenAsync();
                        string querys = "update Tbl_Payment set approval='" + approveds + "' , txtAmount='" + updatePrice + "' where PaymentId='" + HndPaymendID.Value + "' and orderDate='" + datePurchase + "'";
                        SqlCommand cmd = new SqlCommand(querys, con);
                        int updates = await cmd.ExecuteNonQueryAsync();
                        if (updates != 0)
                        {
                            await BindCartRecordTotalPrice();
                            GetRecordToUpdateForPaymentConfirm();

                            string foods = "Foods";
                            string declinePayment = "Decline";

                            string query4 = "insert into TblPaymentF (statsPayment, overallPayment, paymentType) values (@statsPayment, @overallPayment, @paymentType)";
                            SqlCommand cmd4 = new SqlCommand(query4, con);
                            cmd4.Parameters.AddWithValue("@statsPayment", declinePayment);
                            cmd4.Parameters.AddWithValue("@overallPayment", updatePrice);
                            cmd4.Parameters.AddWithValue("@paymentType", foods);
                            await cmd4.ExecuteNonQueryAsync();

                            string datePurchases = (Request.QueryString["datePurchase"]);
                            string query = "update Tbl_Cart set Crt_Status='" + approveds + "' where Crt_DatePurchase='" + datePurchase + "'";
                            SqlCommand cmds = new SqlCommand(query, con);
                            await cmds.ExecuteNonQueryAsync();


                            // This is for sending email
                            string adminEmail = "goldbarreservation@gmail.com";
                            string pass = "wrkfmfmdlypdtrcv";

                            MailMessage message = new MailMessage();
                            message.From = new MailAddress(adminEmail);
                            message.Subject = "Order Status";
                            message.To.Add(new MailAddress(emailUser.Text.Trim()));
                            message.Body = $"<html><body>Hi, {emailUser.Text.Trim()} your order status is decline by the admin, in order to return your payment come here at goldbar office and find our administrator.</br><p><b>From: Gold Bar Restaurant & Reservation Hotel</b></p></body></html>";
                            message.IsBodyHtml = true;

                            var smtpClient = new SmtpClient("smtp.gmail.com")
                            {
                                Port = 587,
                                Credentials = new NetworkCredential(adminEmail, pass),
                                EnableSsl = true,
                            };

                            smtpClient.Send(message);
                            Response.Redirect("OrdersStatus.aspx");
                            Response.Write("<script>alert('Message Successfully!')</script>");
                        }
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}