using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Form
{
    public partial class _CCTable : System.Web.UI.UserControl
    {
        private Models.ChamCongEntity _ccEntity = new Models.ChamCongEntity();
        private Models.LamViecEntity _lvEntity = new Models.LamViecEntity();
        private int _donvichamcongID;
        protected IEnumerable<Models.LamViec> _lamviecs;
        protected DateTime _ngaychamcong;

        public IEnumerable<Models.LamViec> LamViecs
        {
            get
            {
                return _lamviecs;
            }
        }

        public DateTime NgayChamCong
        {
            get
            {
                return _ngaychamcong;
            }
        }

        public int DonViChamCongID
        {
            get
            {
                return _donvichamcongID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            Models.Account loginACC = accEntity.FindByEmail(email);

            lblNguoiChamCong.Text = loginACC.NhanVien.NVTen;

            _ngaychamcong = DateTime.Now;

            Models.DonVi donvichamcong = new Models.DonVi();
            if (loginACC.ACCChucNang != 0)
                donvichamcong = loginACC.PhuTrachChamCongs.FirstOrDefault().DonVi;
            else
            {
                Models.LamViec lamviec = loginACC.NhanVien.LamViecs.OrderByDescending(x => x.LVTuNgay).FirstOrDefault();
                donvichamcong = (lamviec != null) ? lamviec.DonVi : null;
            }
            _lamviecs = (donvichamcong != null) ? donvichamcong.LamViecs : null;
            _donvichamcongID = (donvichamcong != null) ? donvichamcong.DVID : 0;

            if (!this.Page.IsPostBack)
            {                
                _ccEntity.Load_DonViChamCongList_ToRadComboBox(cbbDonVi, loginACC);
                cbbDonVi.SelectedValue = (donvichamcong != null) ? donvichamcong.DVID.ToString() : "";
                dpkNgayThang.SelectedDate = DateTime.Now;
            }
        }

        protected void btChamCong_Click(object sender, EventArgs e)
        {
            _donvichamcongID = Convert.ToInt32(cbbDonVi.SelectedValue);
            _ngaychamcong = Convert.ToDateTime(dpkNgayThang.SelectedDate);
            _lamviecs = _lvEntity.FindByDonViAndDenNgayYear(_donvichamcongID, _ngaychamcong.Year);            
        }

        protected string ChamCong(DateTime _ngaythang, int _lamviecID)
        {
            string result = "X";
            Models.ChamCong chamcong = _ccEntity.FindByNgayThangLamViec(_lamviecID, _ngaythang);
            if (chamcong != null)
                result = chamcong.LoaiChamCong.LCCKyHieu;
            return result;
        }
    }
}