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




        public static string AliasEncrypt(string alias)
        {
            string hash = "";
            string source = "Hello World!";
            using (MD5 md5Hash = MD5.Create())
            {
                hash = GetMd5Hash(md5Hash, source);

                Console.WriteLine("The MD5 hash of " + source + " is: " + hash + ".");

                Console.WriteLine("Verifying the hash...");

                if (VerifyMd5Hash(md5Hash, source, hash))
                {
                    Console.WriteLine("The hashes are the same.");
                }
                else
                {
                    Console.WriteLine("The hashes are not same.");
                }
            }

            return hash;
        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash. 
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }


        // Verify a hash against a string. 
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input. 
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public static int AddNewsData(NewsDetail objItemDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

            SqlParameter[] oParam = new SqlParameter[13];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objItemDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.EngTitle);
            oParam[2] = DBHelper.GetParam("@EngTitleEncrypt", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndTitleEncrypt);
            oParam[3] = DBHelper.GetParam("@EngURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.EngURLAlias);
            oParam[4] = DBHelper.GetParam("@EngContent", SqlDbType.VarChar, 4000, ParameterDirection.Input, objItemDetail.EngContent);

            oParam[5] = DBHelper.GetParam("@IndTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndTitle);
            oParam[6] = DBHelper.GetParam("@IndURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndURLAlias);
            oParam[7] = DBHelper.GetParam("@IndContent", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndContent);

            oParam[8] = DBHelper.GetParam("@Author", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.Author);
            oParam[9] = DBHelper.GetParam("@IsSchedule", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.IsSchedule);
            oParam[10] = DBHelper.GetParam("@PostDate", SqlDbType.DateTime, 100, ParameterDirection.Input, objItemDetail.PostDate);
            oParam[11] = DBHelper.GetParam("@IsOnline", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.IsOnline);
            oParam[12] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateNews", oParam);
            return 1;
        }


        public static int UpdateNewsData(NewsDetail objItemDetail)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[13];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.VarChar, 100, ParameterDirection.Input, objItemDetail.Id);

            oParam[1] = DBHelper.GetParam("@EngTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.EngTitle);
            oParam[2] = DBHelper.GetParam("@EngTitleEncrypt", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndTitleEncrypt);
            oParam[3] = DBHelper.GetParam("@EngURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.EngURLAlias);
            oParam[4] = DBHelper.GetParam("@EngContent", SqlDbType.VarChar, 4000, ParameterDirection.Input, objItemDetail.EngContent);

            oParam[5] = DBHelper.GetParam("@IndTitle", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndTitle);
            oParam[6] = DBHelper.GetParam("@IndURLAlias", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndURLAlias);
            oParam[7] = DBHelper.GetParam("@IndContent", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.IndContent);

            oParam[8] = DBHelper.GetParam("@Author", SqlDbType.VarChar, 255, ParameterDirection.Input, objItemDetail.Author);
            oParam[9] = DBHelper.GetParam("@IsSchedule", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.IsSchedule);
            oParam[10] = DBHelper.GetParam("@PostDate", SqlDbType.DateTime, 100, ParameterDirection.Input, objItemDetail.PostDate);
            oParam[11] = DBHelper.GetParam("@IsOnline", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.IsOnline);
            oParam[12] = DBHelper.GetParam("@Count", SqlDbType.Int, 10, ParameterDirection.Input, objItemDetail.Count);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateNews", oParam);
            return 1;
        }

        public static int DeleteNewsData(int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteNews", oParam);
            return 1;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddNews(NewsDetail objItemDetail)
        {
            objItemDetail.IndTitleEncrypt = AliasEncrypt(objItemDetail.IndTitle);
            objItemDetail.PostDate = DateTime.Now;
            objItemDetail.Author = Convert.ToString(HttpContext.Current.Session["LoginName"]);
            return AddNewsData(objItemDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int UpdateNews(NewsDetail objItemDetail)
        {
            objItemDetail.IndTitleEncrypt = AliasEncrypt(objItemDetail.IndTitle);
            objItemDetail.PostDate = DateTime.Now;
            objItemDetail.Author = Convert.ToString(HttpContext.Current.Session["LoginName"]);
            return UpdateNewsData(objItemDetail);
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int DeleteNews(string Id)
        {
            return DeleteNewsData(int.Parse(Id));
        }



    }
}