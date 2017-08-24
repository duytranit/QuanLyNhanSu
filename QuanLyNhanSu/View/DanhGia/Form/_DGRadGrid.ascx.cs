using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DanhGia.Form
{
    public partial class _DGRadGrid : System.Web.UI.UserControl
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
        private Models.DanhGiaEntity _dgEntity = new Models.DanhGiaEntity();
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
                _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDanhGia, _nhanvienID);
        }

        protected void rgDanhGia_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox danhgia = item["DGNoiDung"].Controls[0] as TextBox;
                danhgia.Attributes.Add("Placeholder", "Nhập nội dung");
                danhgia.ToolTip = "Nhập nội dung đánh giá cần tìm";                
            }
        }

        protected void rgDanhGia_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDanhGia, e, "lblSTT");

            if(e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplNoiDung = item["DGNoiDung"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplNoiDung.Enabled = false;

                string tooltip = "- Nội dung đánh giá: " + hplNoiDung.Text;
                tooltip += ("\n- Ngày tháng đánh giá: " + item["DGNgay"].Text);

                hplNoiDung.ToolTip = tooltip;
            }
        }

        protected void rgDanhGia_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDanhGia, _nhanvienID);
        }

        protected void rgDanhGia_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDanhGia, _nhanvienID);
        }

        protected void rgDanhGia_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDanhGia, _nhanvienID);
        }
    }
}