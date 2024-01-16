using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Hotel_Restaurant.AdminPanel
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Simulate to long task
            System.Threading.Thread.Sleep(5000);// sleep for 5seconds
            if (Session["admin"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx", false);
            }
        }
    }
}