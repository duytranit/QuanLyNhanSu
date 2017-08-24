using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.ThamGiaCTXH.Form
{
    public partial class _TGCTXHRadGrid : System.Web.UI.UserControl
    {
        public bool QuanLy
        {
            set
            {
                _quanly = value;
            }
        }

        public int NhanVienID
        {
            set
            {
                _nhanvienID = value;
            }
        }

        private Models.ThamGiaChinhTriXaHoiEntity _TGCTXHEntity = new Models.ThamGiaChinhTriXaHoiEntity();
        private int _nhanvienID;
        private bool _quanly = true;
        private Models.Account _loginACC;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!_quanly)
            {
                string email = Session["account"].ToString();
                Models.AccountEntity accEntity = new Models.AccountEntity();
                _loginACC = accEntity.FindByEmail(email);
            }

            if (!IsPostBack)
                _TGCTXHEntity.Load_DataSource_Of_NhanVien_RadGrid(RadGridThamGiaCTXH, _nhanvienID);
        }

        protected void RadGridThamGiaCTXH_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridThamGiaCTXH, e, "LabelSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplTen = item["TGCTXHTCTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                string tooltip = "- Tổ chức chính trị - xã hội: ";
                tooltip += (hplTen.Text);
                tooltip += ("\n- Vị trí phụ trách: " + item["TGCTXHChucVu"].Text);
                tooltip += ("\n- Từ ngày: " + item["TGCTXHTuNgay"].Text);
                if (!item["TGCTXHDenNgay"].Text.Equals("&nbsp;"))
                    tooltip += ("\n- Đến ngày: " + item["TGCTXHDenNgay"].Text);
                if (!item["TGCTXHNoiDung"].Text.Equals("&nbsp;"))
                    tooltip += ("\n- Nội dung: " + item["TGCTXHNoiDung"].Text);

                hplTen.ToolTip = tooltip;
            }
        }

        protected void RadGridThamGiaCTXH_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _TGCTXHEntity.Load_DataSource_Of_NhanVien_RadGrid(RadGridThamGiaCTXH, _nhanvienID);
        }

        protected void RadGridThamGiaCTXH_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _TGCTXHEntity.Load_DataSource_Of_NhanVien_RadGrid(RadGridThamGiaCTXH, _nhanvienID);
        }

        protected void RadGridThamGiaCTXH_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _TGCTXHEntity.Load_DataSource_Of_NhanVien_RadGrid(RadGridThamGiaCTXH, _nhanvienID);
        }

        protected void RadGridThamGiaCTXH_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox tochucFilter = filteringItem["TGCTXHTCTen"].Controls[0] as TextBox;
                tochucFilter.Attributes.Add("Placeholder", "Nhập tên tổ chức");
                tochucFilter.ToolTip = "Nhập tổ chức chính trị xã hội cần tìm";
                tochucFilter.Font.Italic = true;

                TextBox chucvuFilter = filteringItem["TGCTXHChucVu"].Controls[0] as TextBox;
                chucvuFilter.Attributes.Add("Placeholder", "Nhập vị trí phụ trách");
                chucvuFilter.ToolTip = "Nhập vị trí phụ trách cần tìm";
                chucvuFilter.Font.Italic = true;
            }
        }
    }
}