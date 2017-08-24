using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class LoaiChamCongEntity
    {
        public LoaiChamCongEntity() { }

        private IEnumerable<Models.LoaiChamCong> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.LoaiChamCongs;
            }
        }

        public void Load_AllLoaiChamCong_RadioButtonList(RadioButtonList _rbl)
        {
            _rbl.DataSource = this.All.ToList();
            _rbl.DataTextField = "LCCTen";
            _rbl.DataValueField = "LCCID";
            _rbl.DataBind();
        }
    }
}