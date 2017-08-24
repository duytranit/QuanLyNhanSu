using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.GiaiTrinh.Form
{
    public partial class _GTRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.GiaiTrinhEntity _gtEntity = new Models.GiaiTrinhEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _gtEntity.Load_AllGiaiTrinhOfKeKhai_ToRadGrid(rgGiaiTrinh, _kekhaiID);
        }

        protected void rgGiaiTrinh_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox lgt = item["LGTTenChung"].Controls[0] as TextBox;
                lgt.Attributes.Add("Placeholder", "Nhập loại tài sản");
                lgt.ToolTip = "Nhập loại tài sản cần tìm";
            }
        }

        protected void rgGiaiTrinh_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgGiaiTrinh, e, "lblSTT");
        }

        protected void rgGiaiTrinh_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _gtEntity.Load_AllGiaiTrinhOfKeKhai_ToRadGrid(rgGiaiTrinh, _kekhaiID);
        }

        protected void rgGiaiTrinh_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _gtEntity.Load_AllGiaiTrinhOfKeKhai_ToRadGrid(rgGiaiTrinh, _kekhaiID);
        }

        protected void rgGiaiTrinh_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _gtEntity.Load_AllGiaiTrinhOfKeKhai_ToRadGrid(rgGiaiTrinh, _kekhaiID);
        }
    }
}