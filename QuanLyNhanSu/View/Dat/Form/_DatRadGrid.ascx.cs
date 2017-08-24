using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.Dat.Form
{
    public partial class _DatRadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.DatEntity _datEntity = new Models.DatEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(Page.RouteData.Values["kekhai"]);
            if (!IsPostBack)
                _datEntity.Load_DataSource_RadGrid(RadGridDat, _kekhaiID);
        }

        protected void RadGridDat_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridDat, e, "LabelSTT");
        }

        protected void RadGridDat_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _datEntity.Load_DataSource_RadGrid(RadGridDat, _kekhaiID);
        }

        protected void RadGridDat_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _datEntity.Load_DataSource_RadGrid(RadGridDat, _kekhaiID);
        }

        protected void RadGridDat_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _datEntity.Load_DataSource_RadGrid(RadGridDat, _kekhaiID);
        }

        protected void RadGridDat_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if(e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox diachi = item["DATDiaChi"].Controls[0] as TextBox;
                diachi.Attributes.Add("Placeholder", "Nhập địa chỉ");
                diachi.ToolTip = "Nhập địa chỉ cần tìm";
            }
        }
    }
}