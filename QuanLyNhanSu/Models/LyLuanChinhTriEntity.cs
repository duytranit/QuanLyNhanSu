using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class LyLuanChinhTriEntity
    {
        public LyLuanChinhTriEntity() { }

        public void Load_DataSource_DropDownList(RadDropDownList _dropdownlist)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.LyLuanChinhTri> llcts = db.LyLuanChinhTris;
            _dropdownlist.DataSource = llcts.ToList();
            _dropdownlist.DataTextField = "LLCTTen";
            _dropdownlist.DataValueField = "LLCTID";
            _dropdownlist.DataBind();
            _dropdownlist.SelectedIndex = 0;
        }
    }
}