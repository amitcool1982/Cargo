using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Xml;
using System.Globalization;
using System.Web.Security;
using System.Web.Services;
using System.Web.Script.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Collections;
using System.IO;
using System.Web.Script;
using Cargo.BLL;

namespace Cargo
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        static int sEcho = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }                        

        public static int UpdateUserPassword(string Name, string Alias, int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[3];
            oParam[0] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, Name);
            oParam[1] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, Alias);
            oParam[2] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateItemCategory", oParam);
            return 1;
        }      

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int UpdatePassword(string Name, string Alias,string Id)
        {
            return UpdateUserPassword(Name, Alias, int.Parse(Id));
        }
        
    
    }
}