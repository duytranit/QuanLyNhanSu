using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.KyLuat.Form
{
    public partial class _KLRadGrid : System.Web.UI.UserControl
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
        private Models.KyLuatEntity _klEntity = new Models.KyLuatEntity();
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
                _klEntity.Load_AllKyLuatOfNhanVien_ToRadGrid(rgKyLuat, _nhanvienID);
        }

        protected void rgKyLuat_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox kyluat = item["KLNoiDung"].Controls[0] as TextBox;
                kyluat.Attributes.Add("Placeholder", "Nhập nội dung");
                kyluat.ToolTip = "Nhập nội dung kỹ luật cần tìm kiếm";

                TextBox hoidong = item["KLCap"].Controls[0] as TextBox;
                hoidong.Attributes.Add("Placeholder", "Nhập hội đồng kỹ luật");
                hoidong.ToolTip = "Nhập hội đồng kỹ luật cần tìm";
            }
        }

        protected void rgKyLuat_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgKyLuat, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                HyperLink hplNoiDung = item["KLNoiDung"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplNoiDung.Enabled = false;

                string tooltip = "- Nội dung kỷ luật: " + hplNoiDung.Text;
                tooltip += ("\n- Cấp quyết định: " + item["KLCap"].Text);
                tooltip += ("\n- Ngày ký quyết định: " + item["KLNgay"].Text);

                hplNoiDung.ToolTip = tooltip;
            }
        }

        protected void rgKyLuat_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _klEntity.Load_AllKyLuatOfNhanVien_ToRadGrid(rgKyLuat, _nhanvienID);
        }

        protected void rgKyLuat_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _klEntity.Load_AllKyLuatOfNhanVien_ToRadGrid(rgKyLuat, _nhanvienID);
        }

        protected void rgKyLuat_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _klEntity.Load_AllKyLuatOfNhanVien_ToRadGrid(rgKyLuat, _nhanvienID);
        }
    }
}