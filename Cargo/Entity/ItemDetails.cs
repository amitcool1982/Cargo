using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cargo;

namespace Cargo
{
    [Serializable()]
    public class ItemDetail
    {
        CommonObjects[] _Vendor = null;
        public CommonObjects[] Vendor
        {
            get { return _Vendor; }
            set { _Vendor = value; }
        }

        CommonObjects[] _Categoty = null;
        public CommonObjects[] Categoty
        {
            get { return _Categoty; }
            set { _Categoty = value; }
        }

        long _ItemID = -1;
        public long ItemID
        {
            get { return _ItemID; }
            set { _ItemID = value; }
        }

        string _ItemName = string.Empty;
        public string ItemName
        {
            get { return _ItemName; }
            set { _ItemName = value; }
        }

        string _UrlAlias = String.Empty;
        public string UrlAlias
        {
            get { return _UrlAlias; }
            set { _UrlAlias = value; }
        }

        string _Description = string.Empty;
        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        int _Price = 0;
        public int Price
        {
            get { return _Price; }
            set { _Price = value; }
        }

        string _Tags = string.Empty;
        public string Tags
        {
            get { return _Tags; }
            set { _Tags = value; }
        }

        bool _IsRecommendItem = false;
        public bool IsRecommendItem
        {
            get { return _IsRecommendItem; }
            set { _IsRecommendItem = value; }
        }
                               
        string _ItemImageUrl = String.Empty;
        public string ItemImageUrl
        {
            get { return _ItemImageUrl; }
            set { _ItemImageUrl = value; }
        }
         
    }
}