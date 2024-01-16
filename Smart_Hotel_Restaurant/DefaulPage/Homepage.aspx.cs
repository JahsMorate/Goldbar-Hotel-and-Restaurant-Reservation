using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smart_Hotel_Restaurant.DefaulPage
{
    public partial class Honepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewMenu.aspx");
        }
    }
}