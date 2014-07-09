using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cargo;

namespace Cargo.Vendor
{
    [Serializable()]
    public class VendorDetail
    {
        string _VendorsAlias = string.Empty;
        public string VendorsAlias
        {
            get { return _VendorsAlias; }
            set { _VendorsAlias = value; }
        }

        string _VendorsName = string.Empty;
        public string VendorsName
        {
            get { return _VendorsName; }
            set { _VendorsName = value; }
        }

        string _VendorsAddress = string.Empty;
        public string VendorsAddress
        {
            get { return _VendorsAddress; }
            set { _VendorsAddress = value; }
        }

        long _VendorID = -1;
        public long VendorID
        {
            get { return _VendorID; }
            set { _VendorID = value; }
        }

        CommonObjects[] _Province = null;
        public CommonObjects[] Province
        {
            get { return _Province; }
            set { _Province = value; }
        }

        string _ProvinceAlias = String.Empty;
        public string ProvinceAlias
        {
            get { return _ProvinceAlias; }
            set { _ProvinceAlias = value; }
        }

        CommonObjects[] _City = null;
        public CommonObjects[] City
        {
            get { return _City; }
            set { _City = value; }
        }

        string _CityAlias = String.Empty;
        public string CityAlias
        {
            get { return _CityAlias; }
            set { _CityAlias = value; }
        }

        string _Phone = String.Empty;
        public string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }

        string _Email = String.Empty;
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }

        string _ImageUrl = String.Empty;
        public string ImageUrl
        {
            get { return _ImageUrl; }
            set { _ImageUrl = value; }
        }

        string _BannerUrl = String.Empty;
        public string BannerUrl
        {
            get { return _BannerUrl; }
            set { _BannerUrl = value; }
        }
        
    }
}