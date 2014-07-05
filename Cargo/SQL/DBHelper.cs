using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace Cargo.BLL
{
	/// <summary>
	/// Summary description for DBHelper.
	/// </summary>
	public class DBHelper
	{

		
		public static SqlDataReader GetSqlDR(string conn_str, string strSql )
		{
			return SqlHelper.ExecuteReader(conn_str, System.Data.CommandType.Text,strSql);
		}

		public static SqlDataReader GetSqlDR(SqlTransaction oTrans, string strSql )
		{
			return SqlHelper.ExecuteReader(oTrans,System.Data.CommandType.Text,strSql);
		}


		public static SqlParameter GetParam(string strPName, SqlDbType oSQLDbType, int intSize, ParameterDirection oPDirection , Object oPValue)
		{
			SqlParameter oParam = new SqlParameter();
			oParam.ParameterName = strPName;
			oParam.SqlDbType = oSQLDbType;
            oParam.Size = intSize;
			oParam.Direction = oPDirection;
			oParam.Value = oPValue;
			return oParam;
		}

		public static DataSet GetDS(string conn_str, string[] arrSql, string[] arrTableName)
		{
			DataSet ds = new DataSet();
			
			for(int i=0;i<arrSql.GetUpperBound(0);i++)
			{
				DataTable tb = SqlHelper.ExecuteDataset(conn_str, System.Data.CommandType.Text, arrSql[i].Trim()).Tables[0];
				tb.TableName= arrTableName[i];

				ds.Merge(tb);
			}	
			
			return ds;
		}


		public static DataSet GetDS(string conn_str, int timeout, string[] arrSql, string[] arrTableName)
		{
			DataSet ds = new DataSet();
			
			for(int i=0;i<arrSql.GetUpperBound(0);i++)
			{
				DataTable tb = SqlHelper.ExecuteDataset(conn_str, System.Data.CommandType.Text, arrSql[i].Trim(), timeout).Tables[0];
				tb.TableName= arrTableName[i];

				ds.Merge(tb);
			}	
			
			return ds;
		}

		public static DataTable ExecuteSP(string sqlConn, string strSPName,  SqlParameter[] oParamList )
		{
			DataTable result = null;
			DataSet ds = SqlHelper.ExecuteDataset(sqlConn, strSPName, oParamList);
			if (ds.Tables.Count>0) result = ds.Tables[0];

			return result;
		}

		public static DataTable ExecuteSP( string sqlConn, int timeout, string strSPName, SqlParameter[] oParamList )
		{
			DataTable result = null;
			DataSet ds = SqlHelper.ExecuteDataset(sqlConn, CommandType.StoredProcedure, strSPName, timeout, oParamList);
			if (ds.Tables.Count>0) result = ds.Tables[0];

			return result;
		}

		public static DataTable ExecuteSP(SqlTransaction oSqlTrans, string strSPName, SqlParameter[] oParamList )
		{
			DataTable result = null;
			DataSet ds = SqlHelper.ExecuteDataset(oSqlTrans,System.Data.CommandType.StoredProcedure, strSPName, oParamList);
			if (ds.Tables.Count>0) result = ds.Tables[0];

			return result;
		}
		
		public static DataTable ExecuteSP(string sqlConn,string strSPName, string strTableName,SqlParameter[] oParamList )
		{
			DataTable result = null;
			DataSet ds = SqlHelper.ExecuteDataset(sqlConn, CommandType.StoredProcedure, strSPName, oParamList);
            if (ds.Tables.Count > 0)
            {
                result = ds.Tables[0];
                result.TableName = strTableName;
            }

			return result;
		}

        public static DataTable ExecuteSP(string sqlConn, string strSPName, string strTableName,int timeoutSeconds, SqlParameter[] oParamList )
        {
            DataTable result = null;
            DataSet ds = SqlHelper.ExecuteDataset(sqlConn, CommandType.StoredProcedure,strSPName,  timeoutSeconds, oParamList);
            if (ds.Tables.Count > 0)
            {
                result = ds.Tables[0];
                result.TableName = strTableName;
            }

            return result;
        }


		public static DataSet ExecuteSP_DS( string sqlConn, int timeout,string strSPName, SqlParameter[] oParamList)
		{
			return SqlHelper.ExecuteDataset(sqlConn, CommandType.StoredProcedure, strSPName, timeout, oParamList);
		}
		

		public static int ExecuteNonQuery(string conn_str, string strSql)
		{
				return SqlHelper.ExecuteNonQuery(conn_str, CommandType.Text, strSql);
		}


		public static string getStrValue(Object obj)
		{
			return getStrValue(obj,"");
		}

		public static string getStrValue(Object obj, string strDefaultValue)
		{
			if((obj != DBNull.Value))
			{
				if (obj.ToString().Trim().Length > 0)
				{
					return obj.ToString().Trim();
				}
			}
			return strDefaultValue;
		}

		public static long getLongValue(Object obj)
		{
			return getLongValue(obj, 0);
		}


		public static long getLongValue(Object obj, long defaultValue)
		{
			if(obj!=null && obj != DBNull.Value)
			{
                long result;
                if (long.TryParse(obj.ToString(), out result))
                {
					return result;
				}
			}
			return defaultValue;
		}

		public static int getIntValue(Object obj)
		{
			return getIntValue(obj, 0);
		}

		public static int getIntValue(Object obj, int defaultValue)
		{
            if (obj != null && obj != DBNull.Value)
            {
                int result;
                if (int.TryParse(obj.ToString(), out result))
                {
                    return result;
                }
            }
			return defaultValue;
		}

		/// <summary>
		/// Strip out username/password part of connectionstring
		/// </summary>
		/// <param name="connection"></param>
		/// <returns></returns>
		public static string DisplayableConnectionString(string connection)
		{
			string safe = connection;
			if (safe.Length>0 && safe.IndexOf("uid")>0) safe = safe.Substring(0, safe.IndexOf(";uid")); 
			return safe;
		}


	}
}
