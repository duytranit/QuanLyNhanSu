using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.TaiSanNuocNgoai.Form
{
    public partial class _TSNNRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.TaiSanNuocNgoaiEntity _tsEntity = new Models.TaiSanNuocNgoaiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _tsEntity.Load_AllTaiSanOfKeKhai_ToRadGrid(rgTaiSan, _kekhaiID);
        }

        protected void rgTaiSan_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox taisan = item["TSNNTen"].Controls[0] as TextBox;
                taisan.Attributes.Add("Placeholder", "Nhập tài sản");
                taisan.ToolTip = "Nhập tài sản cần tìm";
            }
        }

        protected void rgTaiSan_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgTaiSan, e, "lblSTT");
        }

        protected void rgTaiSan_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _tsEntity.Load_AllTaiSanOfKeKhai_ToRadGrid(rgTaiSan, _kekhaiID);
        }

        protected void rgTaiSan_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _tsEntity.Load_AllTaiSanOfKeKhai_ToRadGrid(rgTaiSan, _kekhaiID);
        }

        protected void rgTaiSan_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _tsEntity.Load_AllTaiSanOfKeKhai_ToRadGrid(rgTaiSan, _kekhaiID);
        }
    }
}