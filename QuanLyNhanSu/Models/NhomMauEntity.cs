using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class NhomMauEntity
    {
        public NhomMauEntity() { }

        // LOAD DATASOURCE
        public void Load_DataSource_DropDownList(RadDropDownList _dropDownList)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.NhomMau> nms = db.NhomMaus;
            _dropDownList.DataSource = nms.ToList();
            _dropDownList.DataTextField = "NMTen";
            _dropDownList.DataValueField = "NMID";
            _dropDownList.DataBind();
            _dropDownList.SelectedIndex = 0;
        }
    }
}