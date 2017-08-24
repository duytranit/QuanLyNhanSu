using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DanTocEntity
    {
        public DanTocEntity() { }

        /*********** ATTRIBUTES *****************/
        public IEnumerable<Models.DanToc> All
        {
            get
            {
                EmployeeManagementEntities db = new EmployeeManagementEntities();
                IEnumerable<Models.DanToc> dantocs = db.DanTocs.OrderBy(x => x.DTTen);
                return dantocs;
            }
        }
        /****************************************/

        /*********** LOAD DATASOURCE *****************/
        public void Load_DataSource_RadComboBox(RadComboBox _cbb)
        {
            _cbb.DataSource = this.All.ToList();
            _cbb.DataTextField = "DTTen";
            _cbb.DataValueField = "DTID";
            _cbb.DataBind();
        }
        /****************************/
    }
}