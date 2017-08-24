using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ChuyenMonEntity
    {
        public ChuyenMonEntity() { }

        public void Load_DataSource_DropDownList(RadDropDownList _dropDownList)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.ChuyenMon> chuyenMons = db.ChuyenMons;
            _dropDownList.DataSource = chuyenMons.ToList();
            _dropDownList.DataTextField = "CMTen";
            _dropDownList.DataValueField = "CMID";
            _dropDownList.DataBind();
            _dropDownList.SelectedIndex = 0;
        }
    }
}