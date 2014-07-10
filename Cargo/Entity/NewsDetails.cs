using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cargo;

namespace Cargo
{
    [Serializable()]
    public class NewsDetail
    {

        int _Id = -1;
        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        string _IndTitleEncrypt = string.Empty;
        public string IndTitleEncrypt
        {
            get { return _IndTitleEncrypt; }
            set { _IndTitleEncrypt = value; }
        }


        string _EngTitle = string.Empty;
        public string EngTitle
        {
            get { return _EngTitle; }
            set { _EngTitle = value; }
        }

        string _EngURLAlias = string.Empty;
        public string EngURLAlias
        {
            get { return _EngURLAlias; }
            set { _EngURLAlias = value; }
        }

        string _EngContent = string.Empty;
        public string EngContent
        {
            get { return _EngContent; }
            set { _EngContent = value; }
        }


        string _IndTitle = string.Empty;
        public string IndTitle
        {
            get { return _IndTitle; }
            set { _IndTitle = value; }
        }

        string _IndURLAlias = string.Empty;
        public string IndURLAlias
        {
            get { return _IndURLAlias; }
            set { _IndURLAlias = value; }
        }

        string _IndContent = string.Empty;
        public string IndContent
        {
            get { return _IndContent; }
            set { _IndContent = value; }
        }

        DateTime _PostDate = DateTime.Now;
        public DateTime PostDate
        {
            get { return _PostDate; }
            set { _PostDate = value; }
        }

        string _ImageURL = string.Empty;
        public string ImageURL
        {
            get { return _ImageURL; }
            set { _ImageURL = value; }
        }

        string _Author = string.Empty;
        public string Author
        {
            get { return _Author; }
            set { _Author = value; }
        }

        int _IsOnline = -1;
        public int IsOnline
        {
            get { return _IsOnline; }
            set { _IsOnline = value; }
        }

        int _IsSchedule = -1;
        public int IsSchedule
        {
            get { return _IsSchedule; }
            set { _IsSchedule = value; }
        }

        int _Count = -1;
        public int Count
        {
            get { return _Count; }
            set { _Count = value; }
        }

    }
}