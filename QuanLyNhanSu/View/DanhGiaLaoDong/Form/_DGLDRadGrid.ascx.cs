using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.DanhGiaLaoDong.Form
{
    public partial class _DGLDRadGrid : System.Web.UI.UserControl
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
        private Models.DanhGiaLaoDongEntity _dgEntity = new Models.DanhGiaLaoDongEntity();
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
                _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGLD, _nhanvienID);
        }

        protected void rgDGLD_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox nam = item["DGLDNam"].Controls[0] as TextBox;
                nam.Attributes.Add("Placeholder", "Nhập năm đánh giá");
                nam.ToolTip = "Nhập năm đánh giá cần tìm";

                TextBox chucdanh = item["DGLDChucDanh"].Controls[0] as TextBox;
                chucdanh.Attributes.Add("Placeholder", "Nhập chức danh");
                chucdanh.ToolTip = "Nhập chức danh nghề nghiệp cần tìm";

                TextBox donvi = item["DGLDDonVi"].Controls[0] as TextBox;
                donvi.Attributes.Add("Placeholder", "Nhập đơn vị");
                donvi.ToolTip = "Nhập đơn vị cần tìm";
            }
        }

        protected void rgDGLD_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgDGLD, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplNam = item["DGLDNam"].Controls[0] as HyperLink;
                if (!_quanly && !_loginACC.ACCInDanhGia)
                    hplNam.Enabled = false;
            }
        }

        protected void rgDGLD_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGLD, _nhanvienID);
        }

        protected void rgDGLD_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGLD, _nhanvienID);
        }

        protected void rgDGLD_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _dgEntity.Load_AllDanhGiaOfNhanVien_ToRadGrid(rgDGLD, _nhanvienID);
        }
    }
}