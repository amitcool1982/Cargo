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
    public partial class Items : System.Web.UI.Page
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



        public DataTable GetItems(int PageIndex, int PageSize, string SearchFilter, string SortBy, int SortDirection)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[5];
            oParam[0] = DBHelper.GetParam("@piPageSize", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(1000));
            oParam[1] = DBHelper.GetParam("@piPageNumber", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(PageIndex));
            oParam[2] = DBHelper.GetParam("@piSortedBy", SqlDbType.VarChar, 20, ParameterDirection.Input, GetSQLSafeValue(SortBy));
            oParam[3] = DBHelper.GetParam("@piSearchFilter", SqlDbType.VarChar, -1, ParameterDirection.Input, SearchFilter);
            oParam[4] = DBHelper.GetParam("@piSortDirection", SqlDbType.Int, 4, ParameterDirection.Input, GetSQLSafeValue(SortDirection));
            DataTable otable = SqlHelper.ExecuteDataset(strConnectionStrings, CommandType.StoredProcedure, "USP_GetItems", oParam).Tables[0];

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
        public static string GetItems(int PageIndex, int PageSize, string SortCol, string SortDir, string SearchFilter)
        {
            Items objItems = new Items();
            Hashtable objHT = new Hashtable();
            string totalRecords = "";
            string totalDisplayRecords = "";
            int count = 0;
            string rowClass = "";
            var sb = new StringBuilder();
            string outputJson = string.Empty;
            DataTable dtItems = new DataTable();
            string SortBy = "menu_id_generator";
            int SortDirection = 1;
            if (SortCol == "0")
            {
                SortBy = "menu_id_generator";
            }
            else if (SortCol == "1")
            {
                SortBy = "nama_vendors";
            }
            else if (SortCol == "2")
            {
                SortBy = "nama_menu";
            }
            else if (SortCol == "2")
            {
                SortBy = "harga_menu";
            }



            if (SortDir == "asc")
            {
                SortDirection = 1;
            }
            else
            {
                SortDirection = 0;
            }
            dtItems = objItems.GetItems(PageIndex, PageSize, SearchFilter, SortBy, SortDirection);
            HttpContext.Current.Session["ItemData"] = dtItems;
            if (dtItems.Rows.Count > 0)
            {
                for (int i = 0; i < dtItems.Rows.Count; i++)
                {
                    if (totalRecords.Length == 0)
                    {
                        totalRecords = dtItems.Rows[i]["TotalCount"].ToString();
                        totalDisplayRecords = dtItems.Rows[i]["TotalCount"].ToString();
                    }
                    sb.Append("{");
                    sb.AppendFormat(@"""id"": ""{0}""", count++);
                    sb.Append(",");
                    sb.AppendFormat(@"""DT_RowClass"": ""{0}""", rowClass);
                    sb.Append(",");
                    sb.AppendFormat(@"""0"": ""{0}""", "<div style='text-overflow: ellipsis; width: 80px;overflow: hidden;'><nobr>" + dtItems.Rows[i]["menu_id_generator"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""1"": ""{0}""", "<div style='text-overflow: ellipsis; width: 130px;overflow: hidden;'><nobr>" + dtItems.Rows[i]["nama_vendors"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""2"": ""{0}""", "<div style='text-overflow: ellipsis; width: 140px;overflow: hidden;'><nobr>" + dtItems.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""3"": ""{0}""", "<div style='text-overflow: ellipsis; width: 80px;overflow: hidden;'><nobr>" + dtItems.Rows[i]["harga_menu"].ToString().Replace("\"", "\\" + "\"") + "</nobr></div>");
                    sb.Append(",");

                    sb.AppendFormat(@"""4"": ""{0}""", "<div><a href='javascript:void(0)' data-id='" + dtItems.Rows[i]["menu_id_generator"].ToString().Replace("\"", "\\" + "\"") + "' class='items-dialy-promo' data-toggle='tooltip' data-title='Dialy Promo " + dtItems.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "'><i class='fa fa-usd fa-border'></i></a><a href='javascript:void(0)' data-id='" + dtItems.Rows[i]["menu_id_generator"].ToString().Replace("\"", "\\" + "\"") + "' class='' data-toggle='tooltip' data-title='Item was recommended' ><i class='fa fa-thumbs-up fa-border fa-black'></i></a><a href='javascript:void(0)' data-id='" + dtItems.Rows[i]["menu_id_generator"].ToString().Replace("\"", "\\" + "\"") + "' class='items-show-form update-form' data-toggle='tooltip' data-title='Update Data " + dtItems.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "'><i class='fa fa-pencil-square-o fa-border'></i></a><a href='javascript:void(0)' data-id='" + dtItems.Rows[i]["menu_id_generator"].ToString().Replace("\"", "\\" + "\"") + "' class='delete_item' data-toggle='tooltip' data-title='Delete data " + dtItems.Rows[i]["nama_menu"].ToString().Replace("\"", "\\" + "\"") + "'><i class='fa fa-trash-o fa-border'></i></a></div>");
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

        public static int AddItems(string Name, string Alias)
        {
            string strConnectionStrings = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
            SqlParameter[] oParam = new SqlParameter[2];
            oParam[0] = DBHelper.GetParam("@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, Name);
            oParam[1] = DBHelper.GetParam("@Alias", SqlDbType.VarChar, 100, ParameterDirection.Input, Alias);
            SqlHelper.ExecuteNonQuery(strConnectionStrings, CommandType.StoredProcedure, "USP_AddItemCategory", oParam);
            return 1;
        }

        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static int AddItemss(string Name, string Alias)
        {
            return AddItems(Name, Alias);
        }




        public CommonObjects[] GetVendorsList()
        {
            DataTable dtVendors = SQL.BLL.GetVendorsList(1000, PageSize, "", "id", 1);

            DataRow newRowVendor = dtVendors.NewRow();
            newRowVendor["id"] = "-1";
            newRowVendor["alias_vendors"] = "-Select Vendor-";
            dtVendors.Rows.InsertAt(newRowVendor, 0);
            dtVendors.AcceptChanges();
            CommonObjects[] objVendor = new CommonObjects[dtVendors.Rows.Count];
            int intCount = 0;
            foreach (DataRow drw in dtVendors.Rows)
            {
                objVendor[intCount] = new CommonObjects();
                objVendor[intCount].Value = drw["id"].ToString();
                objVendor[intCount].Text = drw["alias_vendors"].ToString();
                objVendor[intCount].DefaultValue = objVendor[0].Value;
                intCount++;
            }
            return objVendor;
        }

        public CommonObjects[] GetItemCategoryList()
        {
            DataTable dtItemCategory = SQL.BLL.GetCategoryList(1, 1000, "", "id", 1);

            DataRow newRowItemCategory = dtItemCategory.NewRow();
            newRowItemCategory["id"] = "-1";
            newRowItemCategory["Category"] = "-Category-";
            dtItemCategory.Rows.InsertAt(newRowItemCategory, 0);
            dtItemCategory.AcceptChanges();
            CommonObjects[] objVendor = new CommonObjects[dtItemCategory.Rows.Count];
            int intCount = 0;
            foreach (DataRow drw in dtItemCategory.Rows)
            {
                objVendor[intCount] = new CommonObjects();
                objVendor[intCount].Value = drw["id"].ToString();
                objVendor[intCount].Text = drw["Category"].ToString();
                objVendor[intCount].DefaultValue = objVendor[0].Value;
                intCount++;
            }
            return objVendor;
        }


        [WebMethod(EnableSession = true)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json, UseHttpGet = false)]
        public static ItemDetail GetItemData(int ItemId)
        {
            ItemDetail objItemDetail = new ItemDetail();
            Items objItem = new Items();
            DataTable objmainDT = new DataTable();
            DataRow[] objMainRow = null;
            if (ItemId != -1)
            {
                objmainDT = (DataTable)HttpContext.Current.Session["ItemData"];
                objMainRow = objmainDT.Select("id=" + ItemId);
            }

            DataTable dtVendors = new DataTable();
            dtVendors = SQL.BLL.GetVendorsList(1, 1000, "", "id", 1);
            DataRow newRowVendor = dtVendors.NewRow();
            newRowVendor["id"] = "-1";
            newRowVendor["alias_vendors"] = "-Select Vendor-";
            dtVendors.Rows.InsertAt(newRowVendor, 0);
            dtVendors.AcceptChanges();
            objItemDetail.Vendor = new CommonObjects[dtVendors.Rows.Count];
            int intCount = 0;
            foreach (DataRow drw in dtVendors.Rows)
            {
                objItemDetail.Vendor[intCount] = new CommonObjects();
                objItemDetail.Vendor[intCount].Value = drw["id"].ToString();
                objItemDetail.Vendor[intCount].Text = drw["alias_vendors"].ToString();
                objItemDetail.Vendor[intCount].DefaultValue = ItemId != -1 ? objMainRow[0]["alias_vendors"].ToString() : objItemDetail.Vendor[0].Value;
                intCount++;
            }

            DataTable dtItemCategory = new DataTable();
            dtItemCategory = SQL.BLL.GetCategoryList(1, 1000, "", "id", 1);
            DataRow newItemCategory = dtItemCategory.NewRow();
            newItemCategory["id"] = "-1";
            newItemCategory["Category"] = "-Category-";
            dtItemCategory.Rows.InsertAt(newItemCategory, 0);
            dtItemCategory.AcceptChanges();
            objItemDetail.Categoty = new CommonObjects[dtItemCategory.Rows.Count];
            intCount = 0;
            foreach (DataRow drw in dtItemCategory.Rows)
            {
                objItemDetail.Categoty[intCount] = new CommonObjects();
                objItemDetail.Categoty[intCount].Value = drw["id"].ToString();
                objItemDetail.Categoty[intCount].Text = drw["Category"].ToString();
                objItemDetail.Categoty[intCount].DefaultValue = ItemId != -1 ? objMainRow[0]["Category"].ToString() : objItemDetail.Categoty[0].Value;
                intCount++;
            }

            int Price;
            bool IsRecommendItem;

            objItemDetail.ItemName = ItemId != -1 ? objMainRow[0]["nama_menu"].ToString() : "";
            objItemDetail.UrlAlias = ItemId != -1 ? "../" + objMainRow[0]["alias_menu"].ToString() : "";
            objItemDetail.Description = ItemId != -1 ? objMainRow[0]["deskripsi_menu"].ToString() : "";
            if (ItemId != -1)
            {
                int.TryParse(Convert.ToString(objMainRow[0]["harga_menu"]), out Price);
                objItemDetail.Price = Price;
            }

            objItemDetail.Tags = ItemId != -1 ? objMainRow[0]["tlp_vendors"].ToString() : "";

            if (ItemId != -1)
            {
                bool.TryParse(Convert.ToString(objMainRow[0]["is_recommended"]), out IsRecommendItem);
                objItemDetail.IsRecommendItem = IsRecommendItem;
            }

            objItemDetail.ItemImageUrl = ItemId != -1 ? "../" + objMainRow[0]["media_photo"].ToString() : "";

            return objItemDetail;
        }
    }
}