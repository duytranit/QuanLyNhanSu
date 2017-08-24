using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.ThuNhap.Form
{
    public partial class _TNRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.ThuNhapEntity _tnEntity = new Models.ThuNhapEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _tnEntity.Load_AllThuNhapOfKeKhai_ToRadGrid(rgThuNhap, _kekhaiID);
        }

        protected void rgThuNhap_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox thunhap = item["TNTen"].Controls[0] as TextBox;
                thunhap.Attributes.Add("Placeholder", "Nhập thu nhập");
                thunhap.ToolTip = "Nhập thu nhập cần tìm";
            }
        }

        protected void rgThuNhap_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgThuNhap, e, "lblSTT");
        }

        protected void rgThuNhap_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _tnEntity.Load_AllThuNhapOfKeKhai_ToRadGrid(rgThuNhap, _kekhaiID);
        }

        protected void rgThuNhap_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _tnEntity.Load_AllThuNhapOfKeKhai_ToRadGrid(rgThuNhap, _kekhaiID);
        }

        protected void rgThuNhap_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _tnEntity.Load_AllThuNhapOfKeKhai_ToRadGrid(rgThuNhap, _kekhaiID);
        }
    }
}