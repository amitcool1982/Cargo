﻿using System;
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
    public partial class Users : System.Web.UI.Page
    {
        static int sEcho = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        object GetSQLSafeValue(object obj)
        {
            if (obj == null)
                return DBNull.Value;
            else if (obj.ToString().Length == 0)
                return DBNull.Value;
            else
                return obj;
        }



        public DataTable GetUsers(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetUsers", oParam).Tables[0];

            return otable;
        }

        public int PageSize
        {
            get
            {                
                return 20;                
            }
            set { Session["PageSize"] = Convert.ToString(value); }
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetUsers(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            Users objUsers = new Users();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtUsers = new DataTable();
            
            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "nama_lengkap";
            }
            else if (SortCol == "2")
            {
                SortBy = "last_login";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }

            dtUsers = objUsers.GetUsers(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtUsers.Rows.Count > 0)
            {
                for (int i = 0; i < dtUsers.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtUsers.Rows[i]["TotalCount"].ToString();
                        totalDisplayRecords = dtUsers.Rows[i]["TotalCount"].ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 60px;overflow: hidden;'><nobr>" + dtUsers.Rows[i]["Id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 200px;overflow: hidden;'><nobr>" + dtUsers.Rows[i]["nama_lengkap"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 140px;overflow: hidden;'><nobr>" + dtUsers.Rows[i]["last_login"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    if (HttpContext.Current.Session["Id"].ToString() != dtUsers.Rows[i]["Id"].ToString())
                    {
                        sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)' data-id='" + dtUsers.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='update data users'><i class='fa fa-edit fa-border'></i></a><a class='delete' href='javascript:void(0)' data-id='" + dtUsers.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='delete data user'><i class='fa fa-trash-o fa-border'></i></a></div>");
                    }
                    else
                    {
                        sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)' data-id='" + dtUsers.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='update data users'><i class='fa fa-edit fa-border'></i></a></div>");
                    }
                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", "<div style='text-overflow: ellipsis; display:none;'><nobr>" + dtUsers.Rows[i]["username"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");
                    sb.AppendFormat(@"""5"": ""{0}""", "<div style='text-overflow: ellipsis; display:none;'><nobr>" + dtUsers.Rows[i]["is_Super"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");              
                    
                    sb.Append("},");
                }

                outputJson = sb.Remove(sb.Length - 1, 1).ToString();
                sb.Clear();
                sb.Append("{");
                sb.Append(@"""sEcho"": ");
                sb.AppendFormat(@"""{0}""", sEcho++);
                sb.Append(",");
                sb.Append(@"""iTotalRecords"": ");
                sb.Append(totalRecords);
                sb.Append(",");
                sb.Append(@"""iTotalDisplayRecords"": ");
                sb.Append(totalDisplayRecords);
                sb.Append(", ");
                sb.Append(@"""aaData"": [ ");
                sb.Append(outputJson);
                sb.Append("]}");
                outputJson = sb.ToString();
            }
            else
            {
                sb.Append("{");
                sb.Append(@"""sEcho"": ");
                sb.AppendFormat(@"""{0}""", sEcho++);
                sb.Append(",");
                sb.Append(@"""iTotalRecords"": 0");
                sb.Append(",");
                sb.Append(@"""iTotalDisplayRecords"": 0");
                sb.Append(", ");
                sb.Append(@"""aaData"": [ ");
                sb.Append("]}");
                outputJson = sb.ToString();
            }
            return outputJson;
        }

        public static int AddUsersData(string Name, string Alias, bool IsSuperAdmin, string Password)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 255, ParameterDirection.Input, Name);
            oParam[1] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 255, ParameterDirection.Input, Alias);
            oParam[2] = DBHelper.GetParam("@IsSuper", SqlDbType.Int, 10, ParameterDirection.Input, IsSuperAdmin);
            oParam[3] = DBHelper.GetParam("@Password", SqlDbType.NVarChar, 255, ParameterDirection.Input, Password);
            oParam[4] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, 0);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateUser", oParam);
            return 1;
        }

        public static int UpdateUsersData(string Name, string Alias, bool IsSuperAdmin, string Password, int Id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 255, ParameterDirection.Input, Name);
            oParam[1] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 255, ParameterDirection.Input, Alias);
            oParam[2] = DBHelper.GetParam("@IsSuper", SqlDbType.Int, 10, ParameterDirection.Input, IsSuperAdmin);
            oParam[3] = DBHelper.GetParam("@Password", SqlDbType.NVarChar, 255, ParameterDirection.Input, Password);
            oParam[4] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, Id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateUser", oParam);
            return 1;
        }

        public static int DeleteUsersData(int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteUser", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddUsers(string Name, string Alias, bool IsSuper, string Password)
        {
            string EncrypedPassword = SQL.BLL.EncryptData(Password); 
            
            return AddUsersData(Name, Alias, IsSuper, EncrypedPassword);
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int UpdateUsers(string Name, string Alias, bool IsSuper, string Password,  int Id)
        {
            string EncrypedPassword = "";
            if (Password != "")
            {
               EncrypedPassword = SQL.BLL.EncryptData(Password);
            }
            return UpdateUsersData(Name, Alias, IsSuper, EncrypedPassword, Id);
        }
        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int DeleteUsers(string id)
        {
            return DeleteUsersData(int.Parse(id));            
        }
    
    }
}