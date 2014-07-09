using Cargo.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cargo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        object GetSQLSafeValue(object obj)
        {
            if (obj == null)
                return DBNull.Value;
            else if (obj.ToString().Length == 0)
                return DBNull.Value;
            else
                return obj;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@UserName", SqlDbType.VarChar, 50, ParameterDirection.Input, GetSQLSafeValue("super_admin"));
            oParam[1] = DBHelper.GetParam("@Password", SqlDbType.VarChar, 50, ParameterDirection.Input, GetSQLSafeValue("admin"));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_ValidateLogin", oParam).Tables[0];

        }
    }
}