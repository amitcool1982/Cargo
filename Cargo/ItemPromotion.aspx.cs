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
    public partial class ItemPromotion : System.Web.UI.Page
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



        public DataTable GetItemPromotion(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetItemPromotion", oParam).Tables[0];

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
        public static string GetItemPromotion(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            ItemPromotion objItemPromotion = new ItemPromotion();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtItemPromotion = new DataTable();
            string SortBy = "id";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "id";
            }
            else if (SortCol == "1")
            {
                SortBy = "nama_menu";
            }
            else if (SortCol == "2")
            {
                SortBy = "tipe_promo";
            }
            else if (SortCol == "3")
            {
                SortBy = "diskon";
            }
            else if (SortCol == "4")
            {
                SortBy = "mulai_promo";
            }
            else if (SortCol == "5")
            {
                SortBy = "akhir_promo";
            }
            

            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }
            dtItemPromotion = objItemPromotion.GetItemPromotion(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            if (dtItemPromotion.Rows.Count > 0)
            {
                for (int i = 0; i < dtItemPromotion.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtItemPromotion.Rows[i]["TotalCount"].ToString();
                        totalDisplayRecords = dtItemPromotion.Rows[i]["TotalCount"].ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 50px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["id"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 100px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 90px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["tipe_promo"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div style='text-overflow: ellipsis; width: 40px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["diskon"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", "<div style='text-overflow: ellipsis; width: 130px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["mulai_promo"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""5"": ""{0}""", "<div style='text-overflow: ellipsis; width: 130px;overflow: hidden;'><nobr>" + dtItemPromotion.Rows[i]["akhir_promo"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");
                    if (dtItemPromotion.Rows[i]["IsRecommended"].ToString() == "1")
                    {
                        sb.AppendFormat(@"""6"": ""{0}""", "<div><a class='edit' href='javascript:void(0)' title='Item was recommended'><i class='fa fa-thumbs-up fa-border fa-black'></i></a><a class='edit' href='javascript:void(0)'><i class='fa fa-pencil-square-o fa-border'></i></a><a class='delete' href='javascript:void(0)'><i class='fa fa-trash-o fa-border'></i></a></div>");
                    }
                    else
                    {
                        sb.AppendFormat(@"""6"": ""{0}""", "<div><a href='javascript:void(0)' onclick='javascript:RecommendItem(" + dtItemPromotion.Rows[i]["id"].ToString() + ")' title='Recommend " + dtItemPromotion.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "'><i class='fa fa-thumbs-up fa-border'></i></a><a class='edit' href='javascript:void(0)'><i class='fa fa-pencil-square-o fa-border'></i></a><a class='delete' href='javascript:void(0)'><i class='fa fa-trash-o fa-border'></i></a></div>");
                    }
                    sb.Append(",");

                    sb.AppendFormat(@"""7"": ""{0}""", dtItemPromotion.Rows[i]["id_menu"].ToString().Replace("\"", "\\" + "\""));
                    sb.Append(",");

                    sb.AppendFormat(@"""8"": ""{0}""", dtItemPromotion.Rows[i]["deskripsi_promo"].ToString().Replace("\"", "\\" + "\""));
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
        
        
        public static int AddUpdateItemPromotion(long itemiD, string promoType, string description, int discount, DateTime startPromoAt, DateTime endPromoAt, int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[7];
            oParam[0] = DBHelper.GetParam("@itemiD", SqlDbType.VarChar, 20, ParameterDirection.Input, itemiD);
            oParam[1] = DBHelper.GetParam("@promoType", SqlDbType.VarChar, 100, ParameterDirection.Input, promoType);
            oParam[2] = DBHelper.GetParam("@description", SqlDbType.VarChar, 200, ParameterDirection.Input, description);
            oParam[3] = DBHelper.GetParam("@discount", SqlDbType.Int, 100, ParameterDirection.Input, discount);
            oParam[4] = DBHelper.GetParam("@startPromoAt", SqlDbType.DateTime, 100, ParameterDirection.Input, startPromoAt);
            oParam[5] = DBHelper.GetParam("@endPromoAt", SqlDbType.DateTime, 100, ParameterDirection.Input, endPromoAt);
            oParam[6] = DBHelper.GetParam("@iD", SqlDbType.Int, 100, ParameterDirection.Input, id);

            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddUpdateItemPromotion", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddUpdateItemPromotions(long itemiD, string promoType, string description, int discount, DateTime startPromoAt, DateTime endPromoAt, int Id)
        {
            return AddUpdateItemPromotion(itemiD, promoType, description, discount, startPromoAt, endPromoAt, Id);
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int RecommendItem(int Id)
        {
            return MakeItemRecommended(Id);
        }

        public static int MakeItemRecommended(int Id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, Id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_RecommendItem", oParam);
            return 1;
        }


        public static int DeletePromotion(int id)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[1];
            oParam[0] = DBHelper.GetParam("@Id", SqlDbType.Int, 4, ParameterDirection.Input, id);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_DeleteItemPromotion", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int DeleteItemPromotion(int Id)
        {
            return DeletePromotion(Id);
        } 
    }
}