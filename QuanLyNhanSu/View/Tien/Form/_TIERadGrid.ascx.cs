using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.Tien.Form
{
    public partial class _TIERadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.TienEntity _tienEntity = new Models.TienEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _tienEntity.Load_AllTienOfKeKhai_ToRadGrid(rgTien, _kekhaiID);
        }

        protected void rgTien_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;

                TextBox noidung = item["TIENoiDung"].Controls[0] as TextBox;
                noidung.Attributes.Add("Placeholder", "Nhập tiền");
                noidung.ToolTip = "Nhập tiền cần tìm";
            }
        }

        protected void rgTien_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgTien, e, "lblSTT");
        }

        protected void rgTien_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _tienEntity.Load_AllTienOfKeKhai_ToRadGrid(rgTien, _kekhaiID);
        }

        protected void rgTien_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _tienEntity.Load_AllTienOfKeKhai_ToRadGrid(rgTien, _kekhaiID);
        }

        protected void rgTien_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _tienEntity.Load_AllTienOfKeKhai_ToRadGrid(rgTien, _kekhaiID);
        }
    }
}