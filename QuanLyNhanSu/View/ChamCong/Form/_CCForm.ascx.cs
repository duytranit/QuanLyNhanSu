using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Form
{
    public partial class _CCForm : System.Web.UI.UserControl
    {
        private Models.ChamCongEntity _ccEntity = new Models.ChamCongEntity();
        private Models.LamViec _lamviec;
        private DateTime _ngaychamcong;
        
        public Models.LamViec LamViec
        {
            set
            {
                _lamviec = value;
            }
        }

        public DateTime NgayChamCong
        {
            set
            {
                _ngaychamcong = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblNgayThang.Text = _ngaychamcong.ToString("dd/MM/yyyy");
            lblDonVi.Text = _lamviec.DonVi.DVTen;
            lblNhanVien.Text = _lamviec.NhanVien.NVTen;
            if (!this.Page.IsPostBack)
            {
                Models.LoaiChamCongEntity lccEntity = new Models.LoaiChamCongEntity();
                lccEntity.Load_AllLoaiChamCong_RadioButtonList(rblLoaiChamCong);
                Models.ChamCong chamcong = _ccEntity.FindByNgayThangLamViec(_lamviec.LVID, _ngaychamcong);
                if (chamcong != null)
                    rblLoaiChamCong.SelectedValue = chamcong.LCCID.ToString();
                else
                    rblLoaiChamCong.SelectedIndex = 0;
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int loaichamcong = Convert.ToInt32(rblLoaiChamCong.SelectedValue);
                _ccEntity.Insert(_lamviec.LVID, _ngaychamcong, loaichamcong);
                this.RedirectToIndex();
            }
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/ChamCong");
        }
    }
}