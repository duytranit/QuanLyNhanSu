using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class NgachEntity
    {
        public NgachEntity() { }

        // LOAD DATA SOURCE
        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            _radgrid.DataSource = db.Ngaches.ToList();
        }

        public void Load_DataSource_DropDownList(DropDownList _dropdownlist)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            _dropdownlist.DataSource = db.Ngaches.ToList();
            _dropdownlist.DataTextField = "NGTen";
            _dropdownlist.DataValueField = "NGID";
            _dropdownlist.DataBind();
        }

        public void Load_AllNgach_ToRadComboBox(RadComboBox _combobox)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            _combobox.DataSource = db.Ngaches.ToList();
            _combobox.DataTextField = "NGTen";
            _combobox.DataValueField = "NGID";
            _combobox.DataBind();
        }
    }
}