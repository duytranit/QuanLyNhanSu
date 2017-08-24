using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DaQui.Form
{
    public partial class _DQRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.DaQuiEntity _dqEntity = new Models.DaQuiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _dqEntity.Load_AllDaQuiOfNhanVien_ToRadGrid(rgDaQui, _kekhaiID);
        }

        protected void rgDaQui_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox daqui = item["DQTen"].Controls[0] as TextBox;
                daqui.Attributes.Add("Placeholder", "Nhập tài sản");
                daqui.ToolTip = "Nhập tài sản cần tìm";
            }
        }

        protected void rgDaQui_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDaQui, e, "lblSTT");
        }

        protected void rgDaQui_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _dqEntity.Load_AllDaQuiOfNhanVien_ToRadGrid(rgDaQui, _kekhaiID);
        }

        protected void rgDaQui_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _dqEntity.Load_AllDaQuiOfNhanVien_ToRadGrid(rgDaQui, _kekhaiID);
        }

        protected void rgDaQui_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _dqEntity.Load_AllDaQuiOfNhanVien_ToRadGrid(rgDaQui, _kekhaiID);
        }
    }
}