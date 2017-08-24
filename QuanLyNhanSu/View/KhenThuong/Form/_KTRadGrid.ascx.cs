using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.KhenThuong.Form
{
    public partial class _KTRadGrid : System.Web.UI.UserControl
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
        private Models.KhenThuongEntity _ktEntity = new Models.KhenThuongEntity();
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
                _ktEntity.Load_AllKhenThuongOfNhanVien_ToRadGrid(rgKhenThuong, _nhanvienID);
        }

        protected void rgKhenThuong_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox noidung = item["KTNoiDung"].Controls[0] as TextBox;
                noidung.Attributes.Add("Placeholder", "Nhập khen thưởng");
                noidung.ToolTip = "Nhập nội dung khen thưởng";

                TextBox capquyetdinh = item["KTCapQuyetDinh"].Controls[0] as TextBox;
                capquyetdinh.Attributes.Add("Placeholder", "Nhập cấp quyết định");
                capquyetdinh.ToolTip = "Nhập cấp quyết định khen thưởng";
            }
        }

        protected void rgKhenThuong_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgKhenThuong, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                HyperLink hplNoiDung = item["KTNoiDung"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplNoiDung.Enabled = false;

                string tooltip = "- Nội dung khen thưởng: " + hplNoiDung.Text;
                tooltip += ("\n- Cấp quyết định: " + item["KTCapQuyetDinh"].Text);
                tooltip += ("\n- Ngày ký quyết định: " + item["KTNgay"].Text);

                hplNoiDung.ToolTip = tooltip;
            }
        }

        protected void rgKhenThuong_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _ktEntity.Load_AllKhenThuongOfNhanVien_ToRadGrid(rgKhenThuong, _nhanvienID);
        }

        protected void rgKhenThuong_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _ktEntity.Load_AllKhenThuongOfNhanVien_ToRadGrid(rgKhenThuong, _nhanvienID);
        }

        protected void rgKhenThuong_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _ktEntity.Load_AllKhenThuongOfNhanVien_ToRadGrid(rgKhenThuong, _nhanvienID);
        }
    }
}