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

namespace Cargo
{
    public partial class POS: System.Web.UI.Page
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

        public DataTable GetPOS()
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString);
            conn.Open();
            string query = "SELECT * FROM [ledb_agen]";

            SqlCommand cmd = new SqlCommand(query, conn);

            DataTable t1 = new DataTable();
            using (SqlDataAdapter a = new SqlDataAdapter(cmd))
            {
                a.Fill(t1);
            }
            return t1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static string GetPOS(int PageIndex, int PageSize)
        {
            
            POS objPOS = new POS();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtPOS = new DataTable();
            int TotalRows = 0;
            dtPOS = objPOS.GetPOS();
            if (dtPOS.Rows.Count > 0)
            {
                for (int i = 0; i < dtPOS.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtPOS.Rows.Count.ToString();
                        totalDisplayRecords = dtPOS.Rows.Count.ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 90px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["id_agen_generator"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 60px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["daerah"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 80px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["kota"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div style='text-overflow: ellipsis; width: 80px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["name"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", "<div style='text-overflow: ellipsis; width: 70px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["tipe_lokasi"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""5"": ""{0}""", "<div style='text-overflow: ellipsis; width: 140px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["alamat_lokasi"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""6"": ""{0}""", "<div style='text-overflow: ellipsis; width: 100px;overflow: hidden;'><nobr>" + dtPOS.Rows[i]["pos_status"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
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