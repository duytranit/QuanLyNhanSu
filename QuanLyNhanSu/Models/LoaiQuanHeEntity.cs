using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class LoaiQuanHeEntity
    {
        public LoaiQuanHeEntity() { }

        // LOAD DATASOURCE
        public void Load_AllLoaiQuanHe_ToRadComboBox(RadComboBox _cbb)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            IEnumerable<Models.LoaiQuanHe> lqhs = db.LoaiQuanHes.OrderBy(x => x.LQHTen);
            _cbb.DataSource = lqhs.ToList();
            _cbb.DataTextField = "LQHTen";
            _cbb.DataValueField = "LQHID";
            _cbb.DataBind();
        }
    }
}