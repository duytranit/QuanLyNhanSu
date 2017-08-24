using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class BacLuongEntity
    {
        public BacLuongEntity() { }

        // LOAD DATASOURCE
        public void Load_AllBacLuong_RadComboBox(RadComboBox _combobox)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            _combobox.DataSource = db.BacLuongs.ToList();
            _combobox.DataTextField = "BLTen";
            _combobox.DataValueField = "BLID";
            _combobox.DataBind();
        }

        public void Load_DataSource_DropDownList(DropDownList _dropDownList)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            _dropDownList.DataSource = db.BacLuongs.ToList();
            _dropDownList.DataTextField = "BLTen";
            _dropDownList.DataValueField = "BLID";
            _dropDownList.DataBind();
        }
    }
}