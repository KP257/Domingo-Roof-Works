using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Domingo_Roof_Works
{
    public partial class AllInvoices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btnHome(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}