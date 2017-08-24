using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.PhongTangDanhHieu.Form
{
    public partial class _PTDHRadGrid : System.Web.UI.UserControl
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
        private Models.PhongTangDanhHieuEntity _danhhieuEntity = new Models.PhongTangDanhHieuEntity();
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
                _danhhieuEntity.Load_AllPhongTangDanhHieuOfNhanVien_ToRadGrid(rgDanhHieu, _nhanvienID);
        }

        protected void rgDanhHieu_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox danhhieu = item["PTDHTen"].Controls[0] as TextBox;
                danhhieu.Attributes.Add("Placeholder", "Nhập danh hiệu");
                danhhieu.ToolTip = "Nhập danh hiệu cần tìm";

                TextBox hoidong = item["PTDHHoiDong"].Controls[0] as TextBox;
                hoidong.Attributes.Add("Placeholder", "Nhập hội đồng");
                hoidong.ToolTip = "Nhập hội đồng cần tìm";
            }
        }

        protected void rgDanhHieu_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDanhHieu, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                HyperLink hplTen = item["PTDHTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                string tooltip = "- Danh hiệu: " + hplTen.Text;
                tooltip += ("\n- Hội đồng xét phong tặng: " + item["PTDHHoiDong"].Text);
                tooltip += ("\n- Ngày xét phong tặng: " + item["PTDHNgay"].Text);

                hplTen.ToolTip = tooltip;
            }
        }

        protected void rgDanhHieu_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _danhhieuEntity.Load_AllPhongTangDanhHieuOfNhanVien_ToRadGrid(rgDanhHieu, _nhanvienID);
        }

        protected void rgDanhHieu_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _danhhieuEntity.Load_AllPhongTangDanhHieuOfNhanVien_ToRadGrid(rgDanhHieu, _nhanvienID);
        }

        protected void rgDanhHieu_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _danhhieuEntity.Load_AllPhongTangDanhHieuOfNhanVien_ToRadGrid(rgDanhHieu, _nhanvienID);
        }
    }
}