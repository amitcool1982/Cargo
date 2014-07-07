using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cargo
{
    [Serializable()]
    public class CommonObjects
    {
        string _Text = string.Empty;
        public string Text
        {
            get { return _Text; }
            set { _Text = value; }
        }

        string _Value = string.Empty;
        public string Value
        {
            get { return _Value; }
            set { _Value = value; }
        }

        string _DefaultValue = string.Empty;

        public string DefaultValue
        {
            get { return _DefaultValue; }
            set { _DefaultValue = value; }
        }

        string _Additional = string.Empty;

        public string Additional
        {
            get { return _Additional; }
            set { _Additional = value; }
        }

        bool _IsLocked = false;

        public bool IsLocked
        {
            get { return _IsLocked; }
            set { _IsLocked = value; }
        }
    }
}