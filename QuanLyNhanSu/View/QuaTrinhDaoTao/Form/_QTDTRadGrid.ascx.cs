using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.QuaTrinhDaoTao.Form
{
    public partial class _QTDTRadGrid : System.Web.UI.UserControl
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

        private Models.QuaTrinhDaoTaoEntity _qtdtEntity = new Models.QuaTrinhDaoTaoEntity();
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
            {
                _qtdtEntity.Load_DataSource_RadGrid(RadGridQuaTrinhDaoTao, _nhanvienID);
            }
        }

        protected void RadGridQuaTrinhDaoTao_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridQuaTrinhDaoTao, e, "LabelSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;
                HyperLink hplTruong = item["QTDTTruong"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTruong.Enabled = false;

                string tooltip = "- Trường hoặc cơ sở đào tạo, bồi dưỡng: ";
                tooltip += (hplTruong.Text);
                tooltip += ("\n- Chuyên ngành đào tạo, bồi dưỡng: " + item["QTDTChuyenNganh"].Text);
                tooltip += ("\n- Từ ngày: " + item["QTDTTuNgay"].Text);
                if (!item["QTDTDenNgay"].Text.Equals("&nbsp;"))
                    tooltip += ("\n- Đến ngày: " + item["QTDTDenNgay"].Text);
                tooltip += ("\n- Hình thức đào tạo, bồi dưỡng: " + item["QTDTHinhThuc"].Text);
                tooltip += ("\n- Văn bằng, chứng chỉ: " + item["QTDTVanBang"].Text);

                hplTruong.ToolTip = tooltip;
            }
        }

        protected void RadGridQuaTrinhDaoTao_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _qtdtEntity.Load_DataSource_RadGrid(RadGridQuaTrinhDaoTao, _nhanvienID);
        }

        protected void RadGridQuaTrinhDaoTao_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _qtdtEntity.Load_DataSource_RadGrid(RadGridQuaTrinhDaoTao, _nhanvienID);
        }

        protected void RadGridQuaTrinhDaoTao_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _qtdtEntity.Load_DataSource_RadGrid(RadGridQuaTrinhDaoTao, _nhanvienID);
        }

        protected void RadGridQuaTrinhDaoTao_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox truongFilter = filteringItem["QTDTTruong"].Controls[0] as TextBox;
                truongFilter.Attributes.Add("Placeholder", "Nhập tên cơ sở");
                truongFilter.ToolTip = "Nhập tên cơ sở cần tìm";
                truongFilter.Font.Italic = true;

                TextBox chuyennganhFilter = filteringItem["QTDTChuyenNganh"].Controls[0] as TextBox;
                chuyennganhFilter.Attributes.Add("Placeholder", "Nhập chuyên ngành");
                chuyennganhFilter.ToolTip = "Nhập chuyên ngành cần tìm";
                chuyennganhFilter.Font.Italic = true;

                TextBox hinhthucFilter = filteringItem["QTDTHinhThuc"].Controls[0] as TextBox;
                hinhthucFilter.Attributes.Add("Placeholder", "Nhập hinh thức đào tạo");
                hinhthucFilter.ToolTip = "Nhập hình thức đào tạo, bồi dưỡng cần tìm";
                hinhthucFilter.Font.Italic = true;

                TextBox vanbangFilter = filteringItem["QTDTVanBang"].Controls[0] as TextBox;
                vanbangFilter.Attributes.Add("Placeholder", "Nhập văn bằng");
                vanbangFilter.ToolTip = "Nhập văn bằng, chứng chỉ cần tìm";
                vanbangFilter.Font.Italic = true;
            }
        }
    }
}