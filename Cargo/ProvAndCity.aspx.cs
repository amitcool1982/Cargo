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
    public partial class ProvAndCity : System.Web.UI.Page
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

        public DataTable GetProvince(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetProvince", oParam).Tables[0];

            return otable;
        }

        public DataTable GetCity(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetCity", oParam).Tables[0];

            return otable;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetProvince(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            ProvAndCity objPOS = new ProvAndCity();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtProvAndCity = new DataTable();

            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "nama_daerah";
            }            

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }

            dtProvAndCity = objPOS.GetProvince(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtProvAndCity.Rows.Count > 0)
            {
                for (int i = 0; i < dtProvAndCity.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtProvAndCity.Rows.Count.ToString();
                        totalDisplayRecords = dtProvAndCity.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 50px;overflow: hidden;'><nobr>" + dtProvAndCity.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 200px;overflow: hidden;'><nobr>" + dtProvAndCity.Rows[i]["nama_daerah"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");
                    
                    sb.AppendFormat(@"""2"": ""{0}""", "<div><a class='edit' href='javascript:void(0)'><i class='fa fa-edit fa-border'></i></div>");
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
        public static string GetCity(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            ProvAndCity objPOS = new ProvAndCity();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtProvAndCity = new DataTable();

            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "nama_daerah";
            }
            else if (SortCol == "2")
            {
                SortBy = "nama_kota";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }

            dtProvAndCity = objPOS.GetCity(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtProvAndCity.Rows.Count > 0)
            {
                for (int i = 0; i < dtProvAndCity.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtProvAndCity.Rows.Count.ToString();
                        totalDisplayRecords = dtProvAndCity.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 50px;overflow: hidden;'><nobr>" + dtProvAndCity.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 120px;overflow: hidden;'><nobr>" + dtProvAndCity.Rows[i]["nama_daerah"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 120px;overflow: hidden;'><nobr>" + dtProvAndCity.Rows[i]["nama_kota"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div><a class='edit' href='javascript:void(0)'><i class='fa fa-edit fa-border'></i></a></div>");

                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", dtProvAndCity.Rows[i]["Provincealias"].ToString().Replace("\"", "\\" + "\""));
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

        public static int ProvinceAddUpdate(int Id, string Name,string Alias)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[3];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, Id);
            oParam[1] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, Name);
            oParam[2] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, Alias);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateProvince", oParam);
            return 1;
        }
        
        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddUpdateProvince(int Id, string Name)
        {
            return ProvinceAddUpdate(Id, Name,Name.ToLower().Replace(" ","_"));
        }

        public static int CityAddUpdate(int Id, string CityName,string CityAlias, string Province)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[4];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, Id);
            oParam[1] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, CityName);
            oParam[2] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, CityAlias);
            oParam[3] = DBHelper.GetParam("@Province", SqlDbType.VarChar, 100, ParameterDirection.Input, Province);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateCity", oParam);
            return 1;
        }
        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddUpdateCity(int Id, string CityName,string Province)
        {
            return CityAddUpdate(Id, CityName, CityName.ToLower().Replace(" ", "_"), Province);
        }
        public static DataTable GetProvinceDatatable()
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, 10000);
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, 1);
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetProvince", oParam).Tables[0];

            return otable;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static CommonObjects[] GetDropProvince()
        {
            DataTable dtProvince = GetProvinceDatatable();
            CommonObjects[] objProvince = new CommonObjects[dtProvince.Rows.Count + 1];
            DataRow newRowProvince = dtProvince.NewRow();
            newRowProvince["ID"] = "-1";
            newRowProvince["Alias"] = "-1";
            newRowProvince["nama_daerah"] = "-Province-";
            dtProvince.Rows.InsertAt(newRowProvince, 0);
            dtProvince.AcceptChanges();
            objProvince = new CommonObjects[dtProvince.Rows.Count];
            int intCount = 0;
            foreach (DataRow drw in dtProvince.Rows)
            {
                objProvince[intCount] = new CommonObjects();
                objProvince[intCount].Value = drw["Alias"].ToString();
                objProvince[intCount].Text = drw["nama_daerah"].ToString();
                objProvince[intCount].DefaultValue = objProvince[0].Value;
                intCount++;
            }
            return objProvince;
        }
    }
}