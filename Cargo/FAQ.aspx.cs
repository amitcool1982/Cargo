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
    public partial class FAQ : System.Web.UI.Page
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


        public DataTable GetFAQs(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetFAQ", oParam).Tables[0];

            return otable;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetFAQs(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            FAQ objFAQ = new FAQ();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtFAQ = new DataTable();

            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "tanya";
            }
            else if (SortCol == "2")
            {
                SortBy = "count";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }


            dtFAQ = objFAQ.GetFAQs(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtFAQ.Rows.Count > 0)
            {
                for (int i = 0; i < dtFAQ.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtFAQ.Rows.Count.ToString();
                        totalDisplayRecords = dtFAQ.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 50px;overflow: hidden;'><nobr>" + dtFAQ.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 250px;overflow: hidden;'><nobr>" + dtFAQ.Rows[i]["tanya"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 40px;overflow: hidden;'><nobr>" + dtFAQ.Rows[i]["count"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)' data-id='" + dtFAQ.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='update data faq'><i class='fa fa-edit fa-border'></i></a><a class='delete' href='javascript:void(0)' data-id='" + dtFAQ.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='delete data tags'><i class='fa fa-trash-o fa-border'></i></a></div>");
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



        public static int AddFAQData(FAQDetail objFAQDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[9];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objFAQDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngQuestion", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.EngQuestion);
            oParam[2] = DBHelper.GetParam("@EngAnswer", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.EngAnswer);

            oParam[3] = DBHelper.GetParam("@IndQuestion", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.IndQuestion);
            oParam[4] = DBHelper.GetParam("@IndAnswer", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.IndAnswer);

            oParam[5] = DBHelper.GetParam("@Icon", SqlDbType.VarChar, 255, ParameterDirection.Input, objFAQDetail.Icon);
            oParam[6] = DBHelper.GetParam("@urutan", SqlDbType.VarChar, 255, ParameterDirection.Input, objFAQDetail.urutan);
            oParam[7] = DBHelper.GetParam("@IsPrimary", SqlDbType.Int, 10, ParameterDirection.Input, objFAQDetail.IsPrimary);

            oParam[8] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objFAQDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateFAQ", oParam);
            return 1;
        }


        public static int UpdateFAQData(FAQDetail objFAQDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[9];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objFAQDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngQuestion", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.EngQuestion);
            oParam[2] = DBHelper.GetParam("@EngAnswer", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.EngAnswer);

            oParam[3] = DBHelper.GetParam("@IndQuestion", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.IndQuestion);
            oParam[4] = DBHelper.GetParam("@IndAnswer", SqlDbType.VarChar, 4000, ParameterDirection.Input, objFAQDetail.IndAnswer);

            oParam[5] = DBHelper.GetParam("@Icon", SqlDbType.VarChar, 255, ParameterDirection.Input, objFAQDetail.Icon);
            oParam[6] = DBHelper.GetParam("@urutan", SqlDbType.VarChar, 255, ParameterDirection.Input, objFAQDetail.urutan);
            oParam[7] = DBHelper.GetParam("@IsPrimary", SqlDbType.Int, 10, ParameterDirection.Input, objFAQDetail.IsPrimary);

            oParam[8] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objFAQDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateFAQ", oParam);
            return 1;
        }


        public static int DeleteFAQData(int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteFAQ", oParam);
            return 1;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddFAQ(FAQDetail objFAQDetail)
        {
            return AddFAQData(objFAQDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int UpdateFAQ(FAQDetail objFAQDetail)
        {
            return UpdateFAQData(objFAQDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int DeleteFAQ(string Id)
        {
            return DeleteFAQData(int.Parse(Id));
        }

    }
}