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
using System.Security.Cryptography;

namespace Cargo
{
    public partial class News : System.Web.UI.Page
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

        public DataTable GetNews(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetNews", oParam).Tables[0];

            return otable;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetNews(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            News objNews = new News();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtNews = new DataTable();

            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "en_judul";
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


            dtNews = objNews.GetNews(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            HttpContext.Current.Session["NewsData"] = dtNews;
            if (dtNews.Rows.Count > 0)
            {
                for (int i = 0; i < dtNews.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtNews.Rows.Count.ToString();
                        totalDisplayRecords = dtNews.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 30px;overflow: hidden;'><nobr>" + dtNews.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 320px;overflow: hidden;'><nobr>" + dtNews.Rows[i]["en_judul"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 50px;overflow: hidden;'><nobr>" + dtNews.Rows[i]["count"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)' data-id='" + dtNews.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='update data news'><i class='fa fa-edit fa-border'></i></a><a class='delete' href='javascript:void(0)' data-id='" + dtNews.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' data-toggle='tooltip' title='delete data news'><i class='fa fa-trash-o fa-border'></i></a></div>");
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
        public static NewsDetail GetNewsData(int NewsId)
        {
            NewsDetail objNewsDetail = new NewsDetail();            
            DataTable objmainDT = new DataTable();
            DataRow[] objMainRow = null;
            if (NewsId != -1)
            {
                objmainDT = (DataTable)HttpContext.Current.Session["NewsData"];
                objMainRow = objmainDT.Select("id=" + NewsId);
            }

            objNewsDetail.EngTitle = NewsId != -1 ? objMainRow[0]["en_alias"].ToString() : "";
            objNewsDetail.EngURLAlias = NewsId != -1 ? objMainRow[0]["en_judul"].ToString() : "";
            objNewsDetail.EngContent = NewsId != -1 ? objMainRow[0]["en_isi"].ToString() : "";
            objNewsDetail.IndTitle = NewsId != -1 ? objMainRow[0]["alias"].ToString() : "";
            objNewsDetail.IndURLAlias = NewsId != -1 ? objMainRow[0]["judul"].ToString() : "";
            objNewsDetail.IndContent = NewsId != -1 ? "../" + objMainRow[0]["isi"].ToString() : "";
            objNewsDetail.ImageURL = NewsId != -1 ? "../" + objMainRow[0]["gambar"].ToString() : "";
            return objNewsDetail;
        }





        public static int AddNewsData(NewsDetail objNewsDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            SqlParameter[] oParam = new SqlParameter[13];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objNewsDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.EngTitle);
            oParam[2] = DBHelper.GetParam("@EngTitleEncrypt", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndTitleEncrypt);
            oParam[3] = DBHelper.GetParam("@EngURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.EngURLAlias);
            oParam[4] = DBHelper.GetParam("@EngContent", SqlDbType.VarChar, 4000, ParameterDirection.Input, objNewsDetail.EngContent);

            oParam[5] = DBHelper.GetParam("@IndTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndTitle);
            oParam[6] = DBHelper.GetParam("@IndURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndURLAlias);
            oParam[7] = DBHelper.GetParam("@IndContent", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndContent);

            oParam[8] = DBHelper.GetParam("@Author", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.Author);
            oParam[9] = DBHelper.GetParam("@IsSchedule", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.IsSchedule);
            oParam[10] = DBHelper.GetParam("@PostDate", SqlDbType.DateTime, 100, ParameterDirection.Input, objNewsDetail.PostDate);
            oParam[11] = DBHelper.GetParam("@IsOnline", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.IsOnline);
            oParam[12] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateNewsData", oParam);
            return 1;
        }


        public static int UpdateNewsData(NewsDetail objNewsDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[13];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objNewsDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.EngTitle);
            oParam[2] = DBHelper.GetParam("@EngTitleEncrypt", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndTitleEncrypt);
            oParam[3] = DBHelper.GetParam("@EngURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.EngURLAlias);
            oParam[4] = DBHelper.GetParam("@EngContent", SqlDbType.VarChar, 4000, ParameterDirection.Input, objNewsDetail.EngContent);

            oParam[5] = DBHelper.GetParam("@IndTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndTitle);
            oParam[6] = DBHelper.GetParam("@IndURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndURLAlias);
            oParam[7] = DBHelper.GetParam("@IndContent", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.IndContent);

            oParam[8] = DBHelper.GetParam("@Author", SqlDbType.VarChar, 255, ParameterDirection.Input, objNewsDetail.Author);
            oParam[9] = DBHelper.GetParam("@IsSchedule", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.IsSchedule);
            oParam[10] = DBHelper.GetParam("@PostDate", SqlDbType.DateTime, 100, ParameterDirection.Input, objNewsDetail.PostDate);
            oParam[11] = DBHelper.GetParam("@IsOnline", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.IsOnline);
            oParam[12] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objNewsDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateNewsData", oParam);
            return 1;
        }

        public static int DeleteNewsData(int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteNewsData", oParam);
            return 1;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddNews(NewsDetail objNewsDetail)
        {
            objNewsDetail.IndTitleEncrypt = SQL.BLL.EncryptData(objNewsDetail.IndTitle);
            objNewsDetail.PostDate = DateTime.Now;
            objNewsDetail.Author = Convert.ToString(HttpContext.Current.Session["LoginName"]);
            return AddNewsData(objNewsDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int UpdateNews(NewsDetail objNewsDetail)
        {
            objNewsDetail.IndTitleEncrypt = SQL.BLL.EncryptData(objNewsDetail.IndTitle);
            objNewsDetail.PostDate = DateTime.Now;
            objNewsDetail.Author = Convert.ToString(HttpContext.Current.Session["LoginName"]);
            return UpdateNewsData(objNewsDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int DeleteNews(string Id)
        {
            return DeleteNewsData(int.Parse(Id));
        }



    }
}