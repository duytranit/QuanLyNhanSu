using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.HeSoLuong.Form
{
    public partial class _HeSoLuongRadGrid : System.Web.UI.UserControl
    {
        private Models.HeSoLuongEntity _hesoluongEntity = new Models.HeSoLuongEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                _hesoluongEntity.Load_DataSource_RadGrid(RadGridHeSoLuong);
        }

        protected void RadGridHeSoLuong_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridHeSoLuong, e, "LabelSTT");
        }

        protected void RadGridHeSoLuong_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _hesoluongEntity.Load_DataSource_RadGrid(RadGridHeSoLuong);
        }

        protected void RadGridHeSoLuong_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _hesoluongEntity.Load_DataSource_RadGrid(RadGridHeSoLuong);
        }

        protected void RadGridHeSoLuong_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _hesoluongEntity.Load_DataSource_RadGrid(RadGridHeSoLuong);
        }
    }
}