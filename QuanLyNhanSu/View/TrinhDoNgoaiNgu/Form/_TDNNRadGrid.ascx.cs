using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.TrinhDoNgoaiNgu.Form
{
    public partial class _TDNNRadGrid : System.Web.UI.UserControl
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
        private Models.TrinhDoNgoaiNguEntity _nnEntity = new Models.TrinhDoNgoaiNguEntity();
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
                _nnEntity.Load_AllTrinhDoNgoaiNgu_ToRadGrid(rgNgoaiNgu, _nhanvienID);
        }

        protected void rgNgoaiNgu_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgNgoaiNgu, e, "lblSTT");

            if (e.Item is GridDataItem)
            {
                GridDataItem item = e.Item as GridDataItem;

                HyperLink hplTen = item["TDNNTen"].Controls[0] as HyperLink;

                if (!_quanly && !_loginACC.ACCUpLyLich)
                    hplTen.Enabled = false;

                string tooltip = ("- Trình độ ngoại ngữ: " + hplTen.Text);
                tooltip += ("\n- Bằng cấp: " + item["TDNNChungChi"].Text);
                tooltip += ("\n- Ngôn ngữ: " + item["TDNNTiengDanToc"].Text);

                hplTen.ToolTip = tooltip;
            }
        }

        protected void rgNgoaiNgu_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox ngoaingu = item["TDNNTen"].Controls[0] as TextBox;
                ngoaingu.Attributes.Add("Placeholder", "Nhập ngoại ngữ");
                ngoaingu.ToolTip = "Nhập trình độ ngoại ngữ cần tìm";
                ngoaingu.Font.Italic = true;
            }
        }

        protected void rgNgoaiNgu_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _nnEntity.Load_AllTrinhDoNgoaiNgu_ToRadGrid(rgNgoaiNgu, _nhanvienID);
        }

        protected void rgNgoaiNgu_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _nnEntity.Load_AllTrinhDoNgoaiNgu_ToRadGrid(rgNgoaiNgu, _nhanvienID);
        }

        protected void rgNgoaiNgu_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _nnEntity.Load_AllTrinhDoNgoaiNgu_ToRadGrid(rgNgoaiNgu, _nhanvienID);
        }
    }
}