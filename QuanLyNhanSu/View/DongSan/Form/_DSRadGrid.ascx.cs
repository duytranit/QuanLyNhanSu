using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DongSan.Form
{
    public partial class _DSRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.DongSanEntity _dsEntity = new Models.DongSanEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _dsEntity.Load_AllDongSanOfKeKhai_ToRadGrid(rgDongSan, _kekhaiID);
        }

        protected void rgDongSan_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox dongsan = item["DSTen"].Controls[0] as TextBox;
                dongsan.Attributes.Add("Placeholder", "Nhập tên tài sản");
                dongsan.ToolTip = "Nhập tên tài sản cần tìm";
            }
        }

        protected void rgDongSan_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDongSan, e, "lblSTT");
        }

        protected void rgDongSan_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _dsEntity.Load_AllDongSanOfKeKhai_ToRadGrid(rgDongSan, _kekhaiID);
        }

        protected void rgDongSan_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _dsEntity.Load_AllDongSanOfKeKhai_ToRadGrid(rgDongSan, _kekhaiID);
        }

        protected void rgDongSan_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _dsEntity.Load_AllDongSanOfKeKhai_ToRadGrid(rgDongSan, _kekhaiID);
        }
    }
}