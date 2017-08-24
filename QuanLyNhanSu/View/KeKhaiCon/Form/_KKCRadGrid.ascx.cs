using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.KeKhaiCon.Form
{
    public partial class _KKCRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.KeKhaiConEntity _kkcEntity = new Models.KeKhaiConEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _kkcEntity.Load_AllConOfKeKhai_ToRadGrid(rgKeKhaiCon, _kekhaiID);
        }

        protected void rgKeKhaiCon_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox ten = item["KKCTen"].Controls[0] as TextBox;
                ten.Attributes.Add("Placeholder", "Nhập họ và tên");
                ten.ToolTip = "Nhập họ và tên cần tìm";

                TextBox hokhau = item["KKCHoKhau"].Controls[0] as TextBox;
                hokhau.Attributes.Add("Placeholder", "Nhập hộ khẩu");
                hokhau.ToolTip = "Nhập hộ khẩu cần tìm";

                TextBox choo = item["KKCChoO"].Controls[0] as TextBox;
                choo.Attributes.Add("Placeholder", "Nhập chổ ở");
                choo.ToolTip = "Nhập chổ ở cần tìm";
            }
        }

        protected void rgKeKhaiCon_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _kkcEntity.Load_AllConOfKeKhai_ToRadGrid(rgKeKhaiCon, _kekhaiID);
        }

        protected void rgKeKhaiCon_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgKeKhaiCon, e, "lblSTT");
        }

        protected void rgKeKhaiCon_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _kkcEntity.Load_AllConOfKeKhai_ToRadGrid(rgKeKhaiCon, _kekhaiID);
        }

        protected void rgKeKhaiCon_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _kkcEntity.Load_AllConOfKeKhai_ToRadGrid(rgKeKhaiCon, _kekhaiID);
        }
    }
}