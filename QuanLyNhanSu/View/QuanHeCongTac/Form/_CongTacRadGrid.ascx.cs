using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.QuanHeCongTac.Form
{
    public partial class _CongTacRadGrid : System.Web.UI.UserControl
    {
        private Models.QuanHeCongTacEntity quanhectEntity = new Models.QuanHeCongTacEntity();
        private int quanheID;

        protected void Page_Load(object sender, EventArgs e)
        {
            quanheID = Convert.ToInt32(Page.RouteData.Values["quanhe"]);
            if (!IsPostBack)
                quanhectEntity.Load_DataSource_Of_QuanHe_RadGrid(RadGridQuanHeCongTac, quanheID);
        }

        protected void RadGridQuanHeCongTac_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            quanhectEntity.Load_DataSource_Of_QuanHe_RadGrid(RadGridQuanHeCongTac, quanheID);
        }

        protected void RadGridQuanHeCongTac_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            quanhectEntity.Load_DataSource_Of_QuanHe_RadGrid(RadGridQuanHeCongTac, quanheID);
        }

        protected void RadGridQuanHeCongTac_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            quanhectEntity.Load_DataSource_Of_QuanHe_RadGrid(RadGridQuanHeCongTac, quanheID);
        }

        protected void RadGridQuanHeCongTac_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridQuanHeCongTac, e, "LabelSTT");
        }

        protected void RadGridQuanHeCongTac_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox dvTenFilter = filteringItem["QHCTDonVi"].Controls[0] as TextBox;
                dvTenFilter.Attributes.Add("Placeholder", "Nhập tên đơn vị");
                dvTenFilter.ToolTip = "Nhập tên đơn vị cần tìm";
                dvTenFilter.Font.Italic = true;

                TextBox chucvuFilter = filteringItem["QHCTChucVu"].Controls[0] as TextBox;
                chucvuFilter.Attributes.Add("Placeholder", "Nhập chức vụ");
                chucvuFilter.ToolTip = "Nhập chức vụ cần tìm";
                chucvuFilter.Font.Italic = true;

                TextBox nghenghiepFilter = filteringItem["QHCTNgheNghiep"].Controls[0] as TextBox;
                nghenghiepFilter.Attributes.Add("Placeholder", "Nhập chức năng, nhiệm vụ");
                nghenghiepFilter.ToolTip = "Nhập chức năng, nhiệm vụ cần tìm";
                nghenghiepFilter.Font.Italic = true;
            }
        }
    }
}