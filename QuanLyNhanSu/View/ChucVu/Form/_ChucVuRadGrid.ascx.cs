using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChucVu.Form
{
    public partial class _ChucVuRadGrid : System.Web.UI.UserControl
    {
        private Models.ChucVuEntity _chucvuEntity = new Models.ChucVuEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                _chucvuEntity.Load_DataSource_RadGrid(RadGridChucVu);
        }

        protected void RadGridChucVu_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridChucVu, e, "LabelSTT");
        }

        protected void RadGridChucVu_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _chucvuEntity.Load_DataSource_RadGrid(RadGridChucVu);
        }

        protected void RadGridChucVu_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _chucvuEntity.Load_DataSource_RadGrid(RadGridChucVu);
        }

        protected void RadGridChucVu_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _chucvuEntity.Load_DataSource_RadGrid(RadGridChucVu);
        }
    }
}