using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Domingo_Roof_Works
{
    // Most buttons below either create,retrieve or update tables on the Azure storage database
    // Some buttons may fetch and compare data then update or retrieve, others may just create
    // All buttons have an exception handler incase an unknowen error is thrown
    // Connectionstring is decared at the beginning
    // Retrieved values are recieved into listboxes
    // If no values are returned or a success or error message is not shown then the value does not exist

    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}