using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.ChinhSach.Form
{
    public partial class _CSRadGrid : System.Web.UI.UserControl
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
        private Models.ChinhSachEntity _csEntity = new Models.ChinhSachEntity();
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
                _csEntity.Load_AllChinhSachOfNhanVien_ToRadGrid(rgChinhSach, _nhanvienID);
        }

        protected void rgChinhSach_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox chinhsach = item["CSTen"].Controls[0] as TextBox;
                chinhsach.Attributes.Add("Placeholder", "Nhập chính sách");
                chinhsach.ToolTip = "Nhập nội dung chính sách cần tìm";
            }
        }

        protected void rgChinhSach_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgChinhSach, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplTen = item["CSTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                string tooltip = "- Diện chính sách: " + hplTen.Text;
                tooltip += ("\n- Ngày xét: " + item["CSNgay"].Text);

                hplTen.ToolTip = tooltip;
            }
        }

        protected void rgChinhSach_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _csEntity.Load_AllChinhSachOfNhanVien_ToRadGrid(rgChinhSach, _nhanvienID);
        }

        protected void rgChinhSach_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _csEntity.Load_AllChinhSachOfNhanVien_ToRadGrid(rgChinhSach, _nhanvienID);
        }

        protected void rgChinhSach_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _csEntity.Load_AllChinhSachOfNhanVien_ToRadGrid(rgChinhSach, _nhanvienID);
        }
    }
}