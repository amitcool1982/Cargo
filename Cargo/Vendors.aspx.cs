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
using Cargo.Vendor;

namespace Cargo
{
    public partial class Vendors : System.Web.UI.Page
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
             

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetVendors(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtVendors = new DataTable();
            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "alias_vendors";
            }

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }

            dtVendors = SQL.BLL.GetVendorsList(1000, PageSize, SearchFilter, SortBy, SortDirection);
            HttpContext.Current.Session["VendorData"] = dtVendors;
            if (dtVendors.Rows.Count > 0)
            {
                for (int i = 0; i < dtVendors.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtVendors.Rows.Count.ToString();
                        totalDisplayRecords = dtVendors.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 40px;overflow: hidden;'><nobr>" + dtVendors.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 180px;overflow: hidden;'><nobr>" + dtVendors.Rows[i]["alias_vendors"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div><a href='javascript:void(0)' data-id='" + dtVendors.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "' class='vendors-show-form update-form' data-toggle='tooltip' title='update data vendors'><i class='fa fa-edit fa-border'></i></a></div>");
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

        public static object GetSQLSafeValue(object obj)
        {
            if (obj == null)
                return DBNull.Value;
            else if (obj.ToString().Length == 0)
                return DBNull.Value;
            else
                return obj;
        }

        public DataTable GetProvince()
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(10000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetProvince", oParam).Tables[0];

            return otable;
        }

        public DataTable GetCityForProvince(string ProvinceId)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@ProvinceAlias", SqlDbType.VarChar,50, ParameterDirection.Input, GetSQLSafeValue(ProvinceId));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetCityForProvince", oParam).Tables[0];

            return otable;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static CommonObjects[] GetCity(string ProvinceId)
        {
            Vendors objVendors=new Vendors();
            DataTable dtCity = objVendors.GetCityForProvince(ProvinceId);
            DataRow newRowCity = dtCity.NewRow();
            newRowCity["alias"] = "-1";
            newRowCity["nama_kota"] = "-City-";
            dtCity.Rows.InsertAt(newRowCity, 0);
            dtCity.AcceptChanges();
            CommonObjects[] objCity = new CommonObjects[dtCity.Rows.Count];
            int intCount = 0;
            foreach (DataRow drw in dtCity.Rows)
            {
                objCity[intCount] = new CommonObjects();
                objCity[intCount].Value = drw["alias"].ToString();
                objCity[intCount].Text = drw["nama_kota"].ToString();
                objCity[intCount].DefaultValue = objCity[0].Value;
                intCount++;
            }
            return objCity;

        }

        public static int AddUpdateVendor(VendorDetail objVendor)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[10];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.BigInt, 8, ParameterDirection.Input, objVendor.VendorID);
            oParam[1] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.VendorsName);
            oParam[2] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.VendorsAlias);
            oParam[3] = DBHelper.GetParam("@AliasProvince", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.ProvinceAlias);
            oParam[4] = DBHelper.GetParam("@AliasCity", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.CityAlias);
            oParam[5] = DBHelper.GetParam("@Phone", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.Phone);
            oParam[6] = DBHelper.GetParam("@Email", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.Email);
            oParam[7] = DBHelper.GetParam("@Address", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.VendorsAddress);
            oParam[8] = DBHelper.GetParam("@ImageUrl", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.ImageUrl);
            oParam[9] = DBHelper.GetParam("@BannerUrl", SqlDbType.VarChar, 100, ParameterDirection.Input, objVendor.BannerUrl);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateVendor", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int SaveUpdateVendorData(VendorDetail objVendordetail)
        {
            return AddUpdateVendor(objVendordetail);            
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static VendorDetail GetVendorData(int VendorId)
        {
            VendorDetail objVendorDetail = new VendorDetail();
            Vendors objVendors = new Vendors();
            DataTable objmainDT = new DataTable();
            DataRow[] objMainRow = null;
            if (VendorId != -1)
            {
                objmainDT = (DataTable)HttpContext.Current.Session["VendorData"];
                objMainRow = objmainDT.Select("id=" + VendorId);
            }
            DataTable dtProvince = new DataTable();
            dtProvince = objVendors.GetProvince();
            DataRow newRowProvince = dtProvince.NewRow();
            newRowProvince["ID"] = "-1";
            newRowProvince["Alias"] = "-1";
            newRowProvince["nama_daerah"] = "-Province-";
            dtProvince.Rows.InsertAt(newRowProvince, 0);
            dtProvince.AcceptChanges();
            objVendorDetail.Province = new CommonObjects[dtProvince.Rows.Count];
            int intCount=0;
            foreach (DataRow drw in dtProvince.Rows)
            {
                objVendorDetail.Province[intCount] = new CommonObjects();
                objVendorDetail.Province[intCount].Value = drw["Alias"].ToString();
                objVendorDetail.Province[intCount].Text = drw["nama_daerah"].ToString();
                objVendorDetail.Province[intCount].DefaultValue = VendorId != -1 ? objMainRow[0]["alias_daerah"].ToString() : objVendorDetail.Province[0].Value;
                intCount++;
            }

            DataTable dtCity = new DataTable();
            dtCity = objVendors.GetCityForProvince(objVendorDetail.Province[0].DefaultValue);
            DataRow newRowCity = dtCity.NewRow();
            newRowCity["alias"] = "-1";
            newRowCity["nama_kota"] = "-City-";
            dtCity.Rows.InsertAt(newRowCity, 0);
            dtCity.AcceptChanges();
            objVendorDetail.City = new CommonObjects[dtCity.Rows.Count];
            intCount = 0;
            foreach (DataRow drw in dtCity.Rows)
            {
                objVendorDetail.City[intCount] = new CommonObjects();
                objVendorDetail.City[intCount].Value = drw["alias"].ToString();
                objVendorDetail.City[intCount].Text = drw["nama_kota"].ToString();
                objVendorDetail.City[intCount].DefaultValue = VendorId != -1 ? objMainRow[0]["alias_kota"].ToString() : objVendorDetail.City[0].Value;
                intCount++;
            }

            objVendorDetail.VendorsName = VendorId != -1 ? objMainRow[0]["nama_vendors"].ToString() : "";
            objVendorDetail.VendorsAlias = VendorId != -1 ? objMainRow[0]["alias_vendors"].ToString() : "";
            objVendorDetail.VendorsAddress = VendorId != -1 ? objMainRow[0]["alias_vendors"].ToString() : "";
            objVendorDetail.Phone = VendorId != -1 ? objMainRow[0]["tlp_vendors"].ToString() : "";
            objVendorDetail.Email = VendorId != -1 ? objMainRow[0]["email_vendors"].ToString() : "";
            objVendorDetail.ImageUrl = VendorId != -1 ? "../"+objMainRow[0]["logo_vendors"].ToString() : "";
            objVendorDetail.BannerUrl = VendorId != -1 ? "../"+objMainRow[0]["banner_vendors"].ToString() : "";
            return objVendorDetail;
        }
    }
}