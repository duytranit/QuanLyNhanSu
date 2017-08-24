using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class QuanLyNhaNuocEntity
    {
        public QuanLyNhaNuocEntity() { }

        public void Load_DataSource_DropDownList(RadDropDownList _dropDownList)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.QuanLyNhaNuoc> qlnns = db.QuanLyNhaNuocs;
            _dropDownList.DataSource = qlnns.ToList();
            _dropDownList.DataTextField = "QLNNTen";
            _dropDownList.DataValueField = "QLNNID";
            _dropDownList.DataBind();
            _dropDownList.SelectedIndex = 0;
        }
    }
}