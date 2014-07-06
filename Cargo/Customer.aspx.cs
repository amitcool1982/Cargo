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

                    sb.AppendFormat(@"""7"": ""{0}""", "<div><a class='edit' href='javascript:void(0)'><i class='fa fa-edit fa-border'></i></a><a class='delete' href='javascript:void(0)'><i class='fa fa-trash-o fa-border'></i></a></div>");
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
    }
}