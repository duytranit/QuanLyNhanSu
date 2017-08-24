using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.KhoanNo.Form
{
    public partial class _KNRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.KhoanNoEntity _knEntity = new Models.KhoanNoEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _knEntity.Load_AllKhoanNoOfKeKhai_ToRadGrid(rgKhoanNo, _kekhaiID);
        }

        protected void rgKhoanNo_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox khoanno = item["KNTen"].Controls[0] as TextBox;
                khoanno.Attributes.Add("Placeholder", "Nhập khoản nợ");
                khoanno.ToolTip = "Nhập khoản nợ cần tìm";
            }
        }

        protected void rgKhoanNo_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgKhoanNo, e, "lblSTT");
        }

        protected void rgKhoanNo_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _knEntity.Load_AllKhoanNoOfKeKhai_ToRadGrid(rgKhoanNo, _kekhaiID);
        }

        protected void rgKhoanNo_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _knEntity.Load_AllKhoanNoOfKeKhai_ToRadGrid(rgKhoanNo, _kekhaiID);
        }

        protected void rgKhoanNo_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _knEntity.Load_AllKhoanNoOfKeKhai_ToRadGrid(rgKhoanNo, _kekhaiID);
        }
    }
}