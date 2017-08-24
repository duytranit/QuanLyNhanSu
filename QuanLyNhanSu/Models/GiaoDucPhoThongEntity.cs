using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class GiaoDucPhoThongEntity
    {
        public GiaoDucPhoThongEntity() { }

        public void Load_DataSource_DropDownList(RadDropDownList _dropDownList)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.GiaoDucPhoThong> gdpts = db.GiaoDucPhoThongs;
            _dropDownList.DataSource = gdpts.ToList();
            _dropDownList.DataTextField = "GDPTTen";
            _dropDownList.DataValueField = "GDPTID";
            _dropDownList.DataBind();
            _dropDownList.SelectedIndex = 0;
        }
    }
}