using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.KeKhai.Form
{
    public partial class _KKRadGrid : System.Web.UI.UserControl
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
        private Models.KeKhaiEntity _kkEntity = new Models.KeKhaiEntity();
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

            if (!this.Page.IsPostBack)
                _kkEntity.Load_AllKeKhaiOfNhanVien_ToRadGrid(rgKeKhai, _nhanvienID);
        }

        protected void rgKeKhai_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox nam = item["KKNam"].Controls[0] as TextBox;
                nam.Attributes.Add("Placeholder", "Nhập năm kê khai");
                nam.ToolTip = "Nhập năm kê khai cần tìm";

                TextBox coquan = item["KKCoQuan"].Controls[0] as TextBox;
                coquan.Attributes.Add("Placeholder", "Nhập cơ quan");
                coquan.ToolTip = "Nhập cơ quan/ đơn vị công tác cần tìm";

                TextBox chucvu = item["KKChucVu"].Controls[0] as TextBox;
                chucvu.Attributes.Add("Placeholder", "Nhập chức vụ");
                chucvu.ToolTip = "Nhập chức vụ/ chức danh công tác";
            }
        }

        protected void rgKeKhai_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgKeKhai, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplNam = item["KKNam"].Controls[0] as HyperLink;
                if (!_quanly && !_loginACC.ACCUpKeKhai)
                    hplNam.Enabled = false;
            }
        }

        protected void rgKeKhai_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _kkEntity.Load_AllKeKhaiOfNhanVien_ToRadGrid(rgKeKhai, _nhanvienID);
        }

        protected void rgKeKhai_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _kkEntity.Load_AllKeKhaiOfNhanVien_ToRadGrid(rgKeKhai, _nhanvienID);
        }

        protected void rgKeKhai_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _kkEntity.Load_AllKeKhaiOfNhanVien_ToRadGrid(rgKeKhai, _nhanvienID);
        }
    }
}