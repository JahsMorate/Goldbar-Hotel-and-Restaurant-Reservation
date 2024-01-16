using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Hotel_Restaurant.UserPanel
{
    public partial class TransactionOrderSuccesfully_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../DefaulPage/Homepage.aspx");

            }
        }

        protected void LnkCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeRoom.aspx");
        }

        protected void LnkCheckYourORder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}