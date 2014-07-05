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



namespace Cargo
{
    public partial class Login : System.Web.UI.Page
    {       

        public DataTable VerifyLogin(string LoginId, string Password)
        {
            //SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            //conn.Open();
            //string query = "SELECT * FROM [ledb_kategorimenu]";

            //SqlCommand cmd = new SqlCommand(query, conn);

            //DataTable t1 = new DataTable();
            //using (SqlDataAdapter a = new SqlDataAdapter(cmd))
            //{
            //    a.Fill(t1);
            //}
            //return t1;

            //DataTable otable = new DataTable();
            //SqlParameter[] oParam = new SqlParameter[2];
            //oParam[1] = DBHelper.GetParam("@Login", SqlDbType.VarChar, 50, ParameterDirection.Input, LoginId);
            //oParam[2] = DBHelper.GetParam("@Password", SqlDbType.VarChar, 50, ParameterDirection.Input, Password);

            //otable = SqlHelper.ExecuteDataset(ConnString, CommandType.StoredProcedure, "usp_validatelogin", oParam).Tables[0];
            //objUser.ValidationMessage = Utl.SafeString(otable.Rows[0]["ID"].ToString(), "");

            //return otable;
            return null;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static bool ValidateLogin(string LoginId, string Password)
        {
            //try
            //{
            //    DataTable dtbLogin = new DataTable();
            //    dtbLogin = objUser.ValidateLogin();
            //    DataRow oRow = dtbLogin.Rows[0];
            //    if (objUser.ValidationMessage.Length > 0 && objUser.ValidationMessage.ToUpper() != "CMN_THISLOGINISNOTASSIGNEDTOANYACTIVESITES")
            //    {
            //        objUser.ValidationMessage = objResources.GetString(objUser.ValidationMessage).Replace("[*CorpID*]", objUser.Company);
            //        objUser.Status = 1;
            //        objUser.Company = strdomainname;
            //        return objUser;
            //    }
                
            //    objLogin.Session["LoginId"] = "";

            //}
            //catch (ConfigurationException configEx)
            //{
            //    objUser.Status = 1;
            //    objUser.ExceptionMessage = configEx.Message;
            //    objLogin.WriteToErrorLog(configEx);
            //    if (configEx.Message.IndexOf("RemoteAdmin") > 0 || configEx.Message.IndexOf("error log") > 0)
            //    {
            //        objUser.ValidationMessage = configEx.Message;
            //    }
            //    else
            //    {
            //        objUser.ValidationMessage = objResources.GetString("CMN_LoginFailedCorporationisnotsetupforthiswebsite");
            //    }
            //}
            //finally
            //{
            //    objLogin.Dispose();
            //}

            return true;
        }

    }

}
