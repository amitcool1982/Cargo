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
using Cargo.SQL;
using Cargo.BLL;

namespace Cargo
{
    public partial class Customer : System.Web.UI.Page
    {
        static int sEcho = 1;

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
        public static string GetCustomers(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {

            Customer objCustomer = new Customer();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtCustomer = new DataTable();

            string SortBy = "id_generator";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id_generator";
            }
            else if (SortCol == "1")
            {
                SortBy = "email";
            }
            else if (SortCol == "2")
            {
                SortBy = "nama_lengkap";
            }
            else if (SortCol == "3")
            {
                SortBy = "telepon";
            }
            else if (SortCol == "4")
            {
                SortBy = "kota";
            }
            else if (SortCol == "5")
            {
                SortBy = "join_datetime";
            }
            else if (SortCol == "6")
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

            dtCustomer = SQL.BLL.GetCustomersList(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtCustomer.Rows.Count > 0)
            {
                for (int i = 0; i < dtCustomer.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtCustomer.Rows.Count.ToString();
                        totalDisplayRecords = dtCustomer.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 120px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["ID"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 150px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["email"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 90px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["nama_lengkap"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div style='text-overflow: ellipsis; width: 80px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["telepon"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", "<div style='text-overflow: ellipsis; width: 110px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["kota"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""5"": ""{0}""", "<div style='text-overflow: ellipsis; width: 140px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["join_datetime"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""6"": ""{0}""", "<div style='text-overflow: ellipsis; width: 140px;overflow: hidden;'><nobr>" + dtCustomer.Rows[i]["last_login"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""7"": ""{0}""", "<div><a href='javascript:void(0)' data-id='" + dtCustomer.Rows[i]["ID"].ToString().Replace("\"", "\\" + "\"") + "' class='detail-customer' data-toggle='tooltip' title='detail customer'><i class='fa fa-edit fa-border'></i></a><a href='javascript:void(0)' data-id='" + dtCustomer.Rows[i]["ID"].ToString().Replace("\"", "\\" + "\"") + "' class='delete-customer' data-toggle='tooltip' title='delete customer'><i class='fa fa-trash-o fa-border'></i></a></div>");
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
        public static long DeleteCustomer(string Id)
        {
            return DeleteCustomerData(long.Parse(Id));
        }

        public static int DeleteCustomerData(long id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.BigInt, 20, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteCustomer", oParam);
            return 1;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetCustomerDetails(string Id)
        {
            return GetCustomerDetailsData(long.Parse(Id));
        }

        public static string GetCustomerDetailsData(long id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.BigInt, 20, ParameterDirection.Input, id);
            DataTable dt = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetCustomerDetail", oParam).Tables[0];

            string display = "<table>";
            if (dt.Rows.Count > 0)
            {                
                display += "<tr><td><b>ID</b></td><td>: " + Convert.ToString(dt.Rows[0]["id_generator"]) + "</td></tr>";
                display += "<tr><td><b>Fullname</b></td><td>: " + Convert.ToString(dt.Rows[0]["nama_lengkap"]) + "</td></tr>";
                display += "<tr><td><b>Born</b></td><td>: " + Convert.ToString(dt.Rows[0]["tempat_lahir"]) + ", " + Convert.ToString(dt.Rows[0]["tanggal_lahir"]) + "</td></tr>";
                display += "<tr><td><b>Gender</b></td><td>: " + Convert.ToString(dt.Rows[0]["jenis_kelamin"]) + "</td></tr>";
                display += "<tr><td><b>Phone</b></td><td>: " + Convert.ToString(dt.Rows[0]["telepon"]) + "</td></tr>";
                display += "<tr><td><b>Handphone</b></td><td>: " + Convert.ToString(dt.Rows[0]["handphone"]) + "</td></tr>";
                display += "<tr><td><b>Address</b></td><td>: " + Convert.ToString(dt.Rows[0]["alamat"]) + "</td></tr>";
                display += "<tr><td><b>Province</b></td><td>: " + Convert.ToString(dt.Rows[0]["provinsi"]).Replace("_", " ") + "</td></tr>";
                display += "<tr><td><b>City</b></td><td>: " + Convert.ToString(dt.Rows[0]["kota"]).Replace("_", " ") + "</td></tr>";
                display += "<tr><td><b>Zip Code</b></td><td>: " + Convert.ToString(dt.Rows[0]["kode_pos"]) + "</td></tr>";
                display += "<tr><td><b>Email</b></td><td>: <a href='mailto:" + Convert.ToString(dt.Rows[0]["email"]) + "'>" + Convert.ToString(dt.Rows[0]["email"]) + "</a></td></tr>";
                display += "<tr><td><b>join Date</b></td><td>: " + Convert.ToString(dt.Rows[0]["join_datetime"]) + "</td></tr>";
                display += "<tr><td><b>Last Login</b></td><td>: " + Convert.ToString(dt.Rows[0]["last_login"]) + "</td></tr>";
                display += "</table>";
            }

            return  display;
        }


    }
}