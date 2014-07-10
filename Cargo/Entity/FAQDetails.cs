using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cargo;

namespace Cargo
{
    [Serializable()]
    public class FAQDetail
    {
        long _Id = -1;
        public long Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        string _IndQuestion = string.Empty;
        public string IndQuestion
        {
            get { return _IndQuestion; }
            set { _IndQuestion = value; }
        }

        string _IndAnswer = string.Empty;
        public string IndAnswer
        {
            get { return _IndAnswer; }
            set { _IndAnswer = value; }
        }

        string _EngQuestion = string.Empty;
        public string EngQuestion
        {
            get { return _EngQuestion; }
            set { _EngQuestion = value; }
        }

        string _EngAnswer = String.Empty;
        public string EngAnswer
        {
            get { return _EngAnswer; }
            set { _EngAnswer = value; }
        }

        string _Icon = String.Empty;
        public string Icon
        {
            get { return _Icon; }
            set { _Icon = value; }
        }

        int _urutan = -1;
        public int urutan
        {
            get { return _urutan; }
            set { _urutan = value; }
        }

        int _IsPrimary = -1;
        public int IsPrimary
        {
            get { return _IsPrimary; }
            set { _IsPrimary = value; }
        }

        int _Count = -1;
        public int Count
        {
            get { return _Count; }
            set { _Count = value; }
        }

    }
}