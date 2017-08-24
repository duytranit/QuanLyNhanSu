using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChinhTriXaHoi.Form
{
    public partial class _CTXHRadGrid : System.Web.UI.UserControl
    {
        private Models.ChinhTriXaHoiEntity _ctxhEntity = new Models.ChinhTriXaHoiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                _ctxhEntity.Load_DataSource_RadGrid(RadGridCTXH);
        }

        protected void RadGridCTXH_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridCTXH, e, "LabelSTT");
        }

        protected void RadGridCTXH_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _ctxhEntity.Load_DataSource_RadGrid(RadGridCTXH);
        }

        protected void RadGridCTXH_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _ctxhEntity.Load_DataSource_RadGrid(RadGridCTXH);
        }

        protected void RadGridCTXH_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _ctxhEntity.Load_DataSource_RadGrid(RadGridCTXH);
        }
    }
}