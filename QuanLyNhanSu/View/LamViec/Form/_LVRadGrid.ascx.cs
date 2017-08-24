using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.LamViec.Form
{
    public partial class _LVRadGrid : System.Web.UI.UserControl
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

        private bool _quanly = true;
        private int _nhanvienID;
        private Models.LamViecEntity _lvEntity = new Models.LamViecEntity();
        private Models.Account _loginACC;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!_quanly)
            {
                string email = Session["account"].ToString();
                Models.AccountEntity accEntity = new Models.AccountEntity();
                _loginACC = accEntity.FindByEmail(email);
            }

            if (!this.Page.IsPostBack)
                _lvEntity.Load_AllLamViecOfNhanVien_ToRadGrid(rgLamViec, _nhanvienID);
        }

        protected void rgLamViec_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgLamViec, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplDVTen = item["DVTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplDVTen.Enabled = false;

                string tooltip = "- Đơn vị công tác: ";
                tooltip += (hplDVTen.Text);
                tooltip += ("\n- Chức vụ: " + item["CVTen"].Text);
                tooltip += ("\n- Từ ngày: " + item["LVTuNgay"].Text);
                tooltip += ("\n- Đến ngày: " + item["LVDenNgay"].Text);
                tooltip += ("\n- Nhóm ngạch: " + item["NGTen"].Text);
                tooltip += ("\n- Bậc lương: " + item["BLTen"].Text);
                tooltip += ("\n- Hệ số lương: " + item["LVHeSoLuong"].Text);
                tooltip += ("\n- Lương cơ bản: " + item["LVLuongCoBan"].Text);
                tooltip += ("\n- Nhiệm vụ được phân công: " + item["LVNhiemVu"].Text);
                tooltip += ("\n- Phụ cấp chức vụ: " + item["LVPhuCapChucVu"].Text);
                tooltip += ("\n- Phụ cấp công vụ: " + item["LVPhuCapCongVu"].Text);
                tooltip += ("\n- Phụ cấp kiêm nhiệm: " + item["LVPhuCapKiemNhiem"].Text);
                tooltip += ("\n- Phụ cấp nghề: " + item["LVPhuCapNghe"].Text);
                tooltip += ("\n- Phụ cấp thâm niên nghề: " + item["LVPhuCapThamNienNghe"].Text);
                tooltip += ("\n- Phụ cấp vượt khung: " + item["LVPhuCapVuotKhung"].Text);
                tooltip += ("\n- Phụ cấp độc hại: " + item["LVPhuCapDocHai"].Text);
                tooltip += ("\n- Tỷ lệ hưởng lương: " + item["LVTyLe"].Text + "%");

                hplDVTen.ToolTip = tooltip;
            }

            
        }

        protected void rgLamViec_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _lvEntity.Load_AllLamViecOfNhanVien_ToRadGrid(rgLamViec, _nhanvienID);
        }

        protected void rgLamViec_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _lvEntity.Load_AllLamViecOfNhanVien_ToRadGrid(rgLamViec, _nhanvienID);
        }

        protected void rgLamViec_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _lvEntity.Load_AllLamViecOfNhanVien_ToRadGrid(rgLamViec, _nhanvienID);
        }

        protected void rgLamViec_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox donvi = item["DVTen"].Controls[0] as TextBox;
                donvi.Attributes.Add("Placeholder", "Nhập đơn vị");
                donvi.ToolTip = "Nhập đơn vị cần tìm";
            }
        }
    }
}