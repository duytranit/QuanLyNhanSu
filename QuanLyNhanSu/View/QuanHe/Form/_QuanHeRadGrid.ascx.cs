using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.QuanHe.Form
{
    public partial class _QuanHeRadGrid : System.Web.UI.UserControl
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
        private Models.QuanHeEntity _quanheEntity = new Models.QuanHeEntity();
        private int _nhanvienID;
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
                _quanheEntity.Load_DataSource_RadGrid(RadGridQuanHe, _nhanvienID);
        }

        protected void RadGridQuanHe_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridQuanHe, e, "LabelSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplTen = item["QHTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                CheckBox chbBenVo = item["chbQHBenVo"].Controls[0] as CheckBox;

                string tooltip = ("- Quan hệ gia đình: ");
                if (!chbBenVo.Checked)
                    tooltip += ("Họ hàng ruột");
                else
                    tooltip += ("Họ hàng bên vợ/chồng");
                tooltip += ("\n- Họ và tên: " + hplTen.Text);
                tooltip += ("\n- Giới tính: " + item["QHGioiTinh"].Text);
                tooltip += ("\n- Mối quan hệ: " + item["LQHTen"].Text);
                tooltip += ("\n- Ngày tháng năm sinh: " + item["QHNgaySinh"].Text);
                tooltip += ("\n- Hộ khẩu: " + item["QHHoKhau"].Text);
                tooltip += ("\n- Nơi ở: " + item["QHNoiO"].Text);

                hplTen.ToolTip = tooltip;
            }
        }

        protected void RadGridQuanHe_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _quanheEntity.Load_DataSource_RadGrid(RadGridQuanHe, _nhanvienID);
        }

        protected void RadGridQuanHe_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _quanheEntity.Load_DataSource_RadGrid(RadGridQuanHe, _nhanvienID);
        }

        protected void RadGridQuanHe_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _quanheEntity.Load_DataSource_RadGrid(RadGridQuanHe, _nhanvienID);
        }

        protected void RadGridQuanHe_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox tenFilter = filteringItem["QHTen"].Controls[0] as TextBox;
                tenFilter.Attributes.Add("Placeholder", "Nhập họ và tên");
                tenFilter.ToolTip = "Nhập họ và tên cần tìm";
                tenFilter.Font.Italic = true;

                TextBox quanheFilter = filteringItem["LQHTen"].Controls[0] as TextBox;
                quanheFilter.Attributes.Add("Placeholder", "Nhập mối quan hệ");
                quanheFilter.ToolTip = "Nhập mối quan hệ cần tìm";
                quanheFilter.Font.Italic = true;
            }
        }
    }
}