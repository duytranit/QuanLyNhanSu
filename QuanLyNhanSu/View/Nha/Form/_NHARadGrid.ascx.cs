using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.Nha.Form
{
    public partial class _NHARadGrid : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private Models.NhaEntity _nhaEntity = new Models.NhaEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            if (!this.Page.IsPostBack)
                _nhaEntity.Load_AllNhaOfNhanVien_ToRadGrid(rgNha, _kekhaiID);
        }

        protected void rgNha_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;

                TextBox diachi = item["NHADiaChi"].Controls[0] as TextBox;
                diachi.Attributes.Add("Placeholder", "Nhập địa chỉ");
                diachi.ToolTip = "Nhập địa chỉ cần tìm";

                TextBox loainha = item["NHALoai"].Controls[0] as TextBox;
                loainha.Attributes.Add("Placeholder", "Nhập loại nhà");
                loainha.ToolTip = "Nhập loại nhà cần tìm";

                TextBox capcongtrinh = item["NHACap"].Controls[0] as TextBox;
                capcongtrinh.Attributes.Add("Placeholder", "Nhập cấp công trình");
                capcongtrinh.ToolTip = "Nhập cấp công trình cần tìm";

                TextBox chusohuu = item["NHAQuyenSoHuu"].Controls[0] as TextBox;
                chusohuu.Attributes.Add("Placeholder", "Nhập quyền chủ sở hữu");
                chusohuu.ToolTip = "Nhập quyền chủ sở hữu cần tìm";
            }
        }

        protected void rgNha_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgNha, e, "lblSTT");
        }

        protected void rgNha_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _nhaEntity.Load_AllNhaOfNhanVien_ToRadGrid(rgNha, _kekhaiID);
        }

        protected void rgNha_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _nhaEntity.Load_AllNhaOfNhanVien_ToRadGrid(rgNha, _kekhaiID);
        }

        protected void rgNha_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _nhaEntity.Load_AllNhaOfNhanVien_ToRadGrid(rgNha, _kekhaiID);
        }
    }
}