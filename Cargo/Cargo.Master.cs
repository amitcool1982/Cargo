using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cargo
{
    public partial class Cargo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public string LoginName()
        {
            if (Session["LoginName"] != null)
            {
                return Session["LoginName"].ToString();
            }
            return "";
        }
    }
}