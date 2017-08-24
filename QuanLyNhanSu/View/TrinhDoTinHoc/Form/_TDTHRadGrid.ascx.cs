using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.TrinhDoTinHoc.Form
{
    public partial class _TDTHRadGrid : System.Web.UI.UserControl
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
        private Models.TrinhDoTinHocEntity _tinhocEntity = new Models.TrinhDoTinHocEntity();
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
                _tinhocEntity.Load_AllTrinhDoTinHocOfNhanVien_ToRadGrid(rgTrinhDoTinHoc, _nhanvienID);
        }

        protected void rgTrinhDoTinHoc_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox tinhoc = item["TDTHTen"].Controls[0] as TextBox;
                tinhoc.Attributes.Add("Placeholder", "Nhập trình độ tin học");
                tinhoc.ToolTip = "Nhập trình độ tin học cần tìm";
                tinhoc.Font.Italic = true;
            }
        }

        protected void rgTrinhDoTinHoc_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgTrinhDoTinHoc, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                HyperLink hplTen = item["TDTHTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                string tooltip = ("- Trình độ tin học: " + hplTen.Text);
                tooltip += ("\n- Bằng cấp: " + item["TDTHChungChi"].Text);                

                hplTen.ToolTip = tooltip;
            }
        }

        protected void rgTrinhDoTinHoc_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _tinhocEntity.Load_AllTrinhDoTinHocOfNhanVien_ToRadGrid(rgTrinhDoTinHoc, _nhanvienID);
        }

        protected void rgTrinhDoTinHoc_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _tinhocEntity.Load_AllTrinhDoTinHocOfNhanVien_ToRadGrid(rgTrinhDoTinHoc, _nhanvienID);
        }

        protected void rgTrinhDoTinHoc_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _tinhocEntity.Load_AllTrinhDoTinHocOfNhanVien_ToRadGrid(rgTrinhDoTinHoc, _nhanvienID);
        }
    }
}