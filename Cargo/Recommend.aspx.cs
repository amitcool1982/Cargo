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
    public partial class Recommend : System.Web.UI.Page
    {
        static int sEcho = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int PageSize
        {
            get
            {                
                return 20;                
            }
            set { Session["PageSize"] = Convert.ToString(value); }
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

        public DataTable GetRecommend(int PageIndex,int PageSize,string SearchFilter,string SortBy,int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetItemRecommend", oParam).Tables[0];

            return otable;
        }       

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetRecommend(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            Recommend objRecommend = new Recommend();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            StringBuilder sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtRecommend = new DataTable();

            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "Alias_Menu";
            }
            else if (SortCol == "2")
            {
                SortBy = "Nama_Menu";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }

            dtRecommend = objRecommend.GetRecommend(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtRecommend.Rows.Count > 0)
            {
                for (int i = 0; i < dtRecommend.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtRecommend.Rows.Count.ToString();
                        totalDisplayRecords = dtRecommend.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 60px;overflow: hidden;'><nobr>" + dtRecommend.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 200px;overflow: hidden;'><nobr>" + dtRecommend.Rows[i]["Alias_Menu"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 150px;overflow: hidden;'><nobr>" + dtRecommend.Rows[i]["Nama_Menu"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div style='width: 100px'><a href='javascript:void(0)' data-id='" + dtRecommend.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' class='edit' data-toggle='tooltip' title='detail item'><i class='fa fa-search-plus fa-border'></i></a><a href='javascript:void(0)' data-id='" + dtRecommend.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' class='delete' data-toggle='tooltip' title='delete recommended'><i class='fa fa-trash-o fa-border'></i></a></div>");
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



        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static long DeleteRecommended(long Id)
        {
            return DeleteRecommendedData(Id);
        }

        public static int DeleteRecommendedData(long id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.BigInt, 20, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteItemRecommend", oParam);
            return 1;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetRecommendedDetails(string Id)
        {
            return GetRecommendedDetailsData(long.Parse(Id));
        }

        public static string GetRecommendedDetailsData(long id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.BigInt, 20, ParameterDirection.Input, id);
            DataTable dt = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetItemRecommendDetails", oParam).Tables[0];

            string display = "<table>";
            if (dt.Rows.Count > 0)
            {
                display += "<tr><td colspan='2'> </td></tr>";               
                display += "<tr><td colspan='2'><img style='width:360px; height:360 px;' src='" + Convert.ToString(dt.Rows[0]["Media_Photo"]) + "' /></td></tr>";
                display += "<tr><td><b>Vendor</b></td><td>: " + Convert.ToString(dt.Rows[0]["nama_vendors"]) + "</td></tr>";
                display += "<tr><td><b>Category Items</b></td><td>: " + Convert.ToString(dt.Rows[0]["Category"]) + "</td></tr>";
                display += "<tr><td><b>ID Item</b></td><td>: " + Convert.ToString(dt.Rows[0]["menu_id_generator"]) + "</td></tr>";
                display += "<tr><td><b>Price</b></td><td>: " + Convert.ToString(dt.Rows[0]["harga_menu"]) + "</td></tr>";
                display += "<tr><td><b>Tags</b></td><td>: " + Convert.ToString(dt.Rows[0]["tags"]) + "</td></tr>";
                display += "<tr><td><b>Description</b></td><td>: " + Convert.ToString(dt.Rows[0]["deskripsi_menu"]) + "</td></tr>";              
                
            }

            display += "</table>";

            return display;
        }

    }
}