using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.PhuTrachChamCong.Form
{
    public partial class _PTCCRadGrid : System.Web.UI.UserControl
    {
        private Models.PhuTrachChamCongEntity _ptccEntity = new Models.PhuTrachChamCongEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
                _ptccEntity.Load_AllPhuTrach_ToRadGrid(rgPhuTrachChamCong);
        }

        protected void rgPhuTrachChamCong_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _ptccEntity.Load_AllPhuTrach_ToRadGrid(rgPhuTrachChamCong);
        }

        protected void rgPhuTrachChamCong_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _ptccEntity.Load_AllPhuTrach_ToRadGrid(rgPhuTrachChamCong);
        }

        protected void rgPhuTrachChamCong_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _ptccEntity.Load_AllPhuTrach_ToRadGrid(rgPhuTrachChamCong);
        }

        protected void rgPhuTrachChamCong_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgPhuTrachChamCong, e, "lblSTT");
        }

        protected void rgPhuTrachChamCong_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;

                TextBox txtEmail = item["ACCEmail"].Controls[0] as TextBox;
                txtEmail.Attributes.Add("Placeholder", "Nhập email");
                txtEmail.ToolTip = "Nhập email cần tìm";

                TextBox txtHoTen = item["NVTen"].Controls[0] as TextBox;
                txtHoTen.Attributes.Add("Placeholder", "Nhập họ và tên");
                txtHoTen.ToolTip = "Nhập họ và tên nhân viên cần tìm";

                TextBox txtDonVi = item["DVTen"].Controls[0] as TextBox;
                txtDonVi.Attributes.Add("Placeholder", "Nhập tên đơn vị");
                txtDonVi.ToolTip = "Nhập đơn vị cần tìm";
            }
        }
    }
}