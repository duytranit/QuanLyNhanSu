using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DonVi.Form
{
    public partial class _DonViRadGrid : System.Web.UI.UserControl
    {
        Models.DonViEntity _donviEntity = new Models.DonViEntity();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
                _donviEntity.Load_DataSource_RadGrid(RadGridDonVi);
        }

        protected void RadGridDonVi_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridDonVi, e, "LabelSTT");
        }

        protected void RadGridDonVi_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _donviEntity.Load_DataSource_RadGrid(RadGridDonVi);
        }

        protected void RadGridDonVi_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _donviEntity.Load_DataSource_RadGrid(RadGridDonVi);
        }

        protected void RadGridDonVi_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _donviEntity.Load_DataSource_RadGrid(RadGridDonVi);
        }

        protected void RadGridDonVi_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox dvTenFilter = filteringItem["DVTen"].Controls[0] as TextBox;
                dvTenFilter.Attributes.Add("Placeholder", "Nhập tên đơn vị");
                dvTenFilter.ToolTip = "Nhập tên đơn vị cần tìm";
                dvTenFilter.Font.Italic = true;

                TextBox tructhuocFilter = filteringItem["DVTrucThuoc"].Controls[0] as TextBox;
                tructhuocFilter.Attributes.Add("Placeholder", "Nhập đơn vị");
                tructhuocFilter.ToolTip = "Nhập đơn vị cần tìm";
                tructhuocFilter.Font.Italic = true;

                TextBox biencheFilter = filteringItem["DVBienChe"].Controls[0] as TextBox;
                biencheFilter.Attributes.Add("Placeholder", "Nhập số biên chế");
                biencheFilter.ToolTip = "Nhập số biên chế cần tìm";
                biencheFilter.Font.Italic = true;

                TextBox dienthoaiFilter = filteringItem["DVSDT"].Controls[0] as TextBox;
                dienthoaiFilter.Attributes.Add("Placeholder", "Nhập số điện thoại");
                dienthoaiFilter.ToolTip = "Nhập số điện thoại cần tìm";
                dienthoaiFilter.Font.Italic = true;
            }
        }
    }
}