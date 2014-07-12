using System;
using System.Net;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.IO;
using System.Text;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Security;
using System.Configuration;
using System.Text.RegularExpressions;
using Cargo.BLL;



namespace Cargo
{
    public partial class Login : System.Web.UI.Page
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



        public DataTable VerifyLogin(string LoginId, string Password)
        {
            string strConnectionStrings=System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@UserName", SqlDbType.VarChar, 50, ParameterDirection.Input, GetSQLSafeValue(LoginId));
            oParam[1] = DBHelper.GetParam("@Password", SqlDbType.VarChar, 50, ParameterDirection.Input, GetSQLSafeValue(Password));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_ValidateLogin", oParam).Tables[0];                 
            
            return otable;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int ValidateLogin(string LoginId, string Password)
        {
            Login objLogin = new Login();
            DataTable dt = objLogin.VerifyLogin(LoginId, Password);
            if (dt.Rows.Count > 0)
            {
                objLogin.SetupUserSession(dt.Rows[0]);
                HttpContext.Current.Session["LoginName"] = dt.Rows[0]["Name"].ToString();
                HttpContext.Current.Session["IsSuper"] = dt.Rows[0]["IsSuper"].ToString();
                HttpContext.Current.Session["Id"] = dt.Rows[0]["id"].ToString();
                return 1;

            }
            return 0;
        }

        private void SetupUserSession(DataRow userData)
        {
            FormsAuthentication.Initialize();

            double timeout = double.Parse(ConfigurationManager.AppSettings["SessionTimeout"].ToString());
            string username = userData["id"].ToString() + ":" + userData["username"].ToString();

            
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, username, DateTime.Now, DateTime.Now.AddMinutes(timeout), false, "", FormsAuthentication.FormsCookiePath);

            string hash = FormsAuthentication.Encrypt(ticket);

            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
            HttpContext.Current.Response.Cookies.Add(cookie);

        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int Logout()
        {
            Login objLogin = new Login();
            try
            {
                objLogin.Session.Abandon();
                FormsAuthentication.SignOut();
                return 1;
            }
            catch
            {
            }
            return 0;
        }

    }

}
