using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cargo.Entity
{
    [Serializable()]
    public class POSCompanyDetails
    {
        string _CompanyName = string.Empty;
        public string CompanyName
        {
            get { return _CompanyName; }
            set { _CompanyName = value; }
        }

        string _ExistYear = string.Empty;
        public string ExistYear
        {
            get { return _ExistYear; }
            set { _ExistYear = value; }
        }

        string _Owner = string.Empty;
        public string Owner
        {
            get { return _Owner; }
            set { _Owner = value; }
        }

        string _Nationality = String.Empty;
        public string Nationality
        {
            get { return _Nationality; }
            set { _Nationality = value; }
        }

        string _NationalityOthers = String.Empty;
        public string NationalityOthers
        {
            get { return _NationalityOthers; }
            set { _NationalityOthers = value; }
        }

        string _Address = String.Empty;
        public string Address
        {
            get { return _Address; }
            set { _Address = value; }
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