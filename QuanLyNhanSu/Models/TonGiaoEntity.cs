using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TonGiaoEntity
    {
        public TonGiaoEntity() { }

        /********** ATTRIBUTE ***********/
        private IEnumerable<Models.TonGiao> All
        {
            get
            {
                EmployeeManagementEntities db = new EmployeeManagementEntities();
                IEnumerable<Models.TonGiao> tongiaos = from tg in db.TonGiaos
                                                       orderby tg.TGTen
                                                       select tg;
                return tongiaos;
            }
        }
        /*******************************/

        /********** LOAD DATASOURCE ***********/
        public void Load_DataSource_RadComboBox(RadComboBox _cbb)
        {
            _cbb.DataSource = this.All.ToList();
            _cbb.DataTextField = "TGTen";
            _cbb.DataValueField = "TGID";
            _cbb.DataBind();
        }

        /********************************/
    }
}