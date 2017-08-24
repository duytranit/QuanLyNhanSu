using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DanhGiaDangVien.Form
{
    public partial class _DGDVRadGrid : System.Web.UI.UserControl
    {
        public int NhanVienID
        {
            set
            {
                _nhanvienID = value;
            }
        }

        public bool QuanLy
        {
            set
            {
                _quanly = value;
            }
        }

        private int _nhanvienID;
        private Models.DanhGiaDangVienEntity _dgEntity = new Models.DanhGiaDangVienEntity();
        private bool _quanly = true;
        private Models.Account _loginACC;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!_quanly)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                _loginACC = accEntity.FindByEmail(email);
            }

            if (this.Page.IsPostBack)
                _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGDV, _nhanvienID);
        }

        protected void rgDGDV_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox nam = item["DGDVNam"].Controls[0] as TextBox;
                nam.Attributes.Add("Placeholder", "Nhập năm đánh giá");
                nam.ToolTip = "Nhập năm đánh giá cần tìm";

                TextBox chucvudang = item["DGDVChucVuDang"].Controls[0] as TextBox;
                chucvudang.Attributes.Add("Placeholder", "Nhập chức vụ Đảng");
                chucvudang.ToolTip = "Nhập chức chức vụ Đảng cần tìm";

                TextBox chucvuchinhquyen = item["DGDVChucVuChinhQuyen"].Controls[0] as TextBox;
                chucvuchinhquyen.Attributes.Add("Placeholder", "Nhấp chức vụ Chính quyền, Đoàn thể");
                chucvuchinhquyen.ToolTip = "Nhập chức vụ Chính quyền, Đoàn thể cần tìm";

                TextBox donvi = item["DGDVDonVi"].Controls[0] as TextBox;
                donvi.Attributes.Add("Placeholder", "Nhập đơn vị");
                donvi.ToolTip = "Nhập đơn vị cần tìm";
            }
        }

        protected void rgDGDV_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDGDV, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplNam = item["DGDVNam"].Controls[0] as HyperLink;
                if (!_quanly && !_loginACC.ACCUpDanhGia)
                    hplNam.Enabled = false;
            }
        }

        protected void rgDGDV_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGDV, _nhanvienID);
        }

        protected void rgDGDV_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGDV, _nhanvienID);
        }

        protected void rgDGDV_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGDV, _nhanvienID);
        }
    }
}