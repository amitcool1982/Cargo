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
    public partial class ItemTags : System.Web.UI.Page
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



        public DataTable GetItemTags(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetItemTags", oParam).Tables[0];

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
        public static string GetItemTags(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            ItemTags objItemTags = new ItemTags();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtItemTags = new DataTable();
            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "alias";
            }
            else if (SortCol == "2")
            {
                SortBy = "nama_tag";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }
            dtItemTags = objItemTags.GetItemTags(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtItemTags.Rows.Count > 0)
            {
                for (int i = 0; i < dtItemTags.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtItemTags.Rows[i]["TotalCount"].ToString();
                        totalDisplayRecords = dtItemTags.Rows[i]["TotalCount"].ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 100px;overflow: hidden;'><nobr>" + dtItemTags.Rows[i]["Id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 100px;overflow: hidden;'><nobr>" + dtItemTags.Rows[i]["Alias"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 100px;overflow: hidden;'><nobr>" + dtItemTags.Rows[i]["nama_tag"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)'><i class='fa fa-edit fa-border'></i></a><a class='delete' href='javascript:void(0)'><i class='fa fa-trash-o fa-border'></i></a></div>");
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

        public static int AddItemCategory(string Name, string Alias)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, Name);
            oParam[1] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, Alias);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddItemCategory", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddCategory(string Name, string Alias)
        {
            return AddItemCategory(Name, Alias);
        }
    
    
    }
}