using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class LoaiGiaiTrinhEntity
    {
        public LoaiGiaiTrinhEntity() { }

        //LOAD DATA SOURCE
        public void Load_DataSource_RadComboBox(RadComboBox _radcombobox)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.LoaiGiaiTrinh> loaigiaitrinhs = db.LoaiGiaiTrinhs;
            _radcombobox.DataSource = loaigiaitrinhs.ToList();
            _radcombobox.DataTextField = "LGTTen";
            _radcombobox.DataValueField = "LGTID";
            _radcombobox.DataBind();
        }
    }
}