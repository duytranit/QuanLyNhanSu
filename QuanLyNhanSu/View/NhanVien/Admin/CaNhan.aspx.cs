using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.NhanVien.Admin
{
    public partial class CaNhan : System.Web.UI.Page
    {
        private int _nhanvienID;
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            Models.Account account = accEntity.FindByEmail(email);
            _nhanvienID = account.NVID;
            CUDForm.NhanVienID = _nhanvienID;
            CUDForm.QuanLy = false;

            LVRadGrid.NhanVienID = _nhanvienID;
            LVRadGrid.QuanLy = false;

            CTXHRadGrid.NhanVienID = _nhanvienID;
            CTXHRadGrid.QuanLy = false;

            DTRadGrid.NhanVienID = _nhanvienID;
            DTRadGrid.QuanLy = false;

            QHRadGrid.NhanVienID = _nhanvienID;
            QHRadGrid.QuanLy = false;

            TDNNRadGrid.NhanVienID = _nhanvienID;
            TDNNRadGrid.QuanLy = false;

            TDTHRadGrid.NhanVienID = _nhanvienID;
            TDTHRadGrid.QuanLy = false;

            PTDHRadGrid.NhanVienID = _nhanvienID;
            PTDHRadGrid.QuanLy = false;

            KTRadGrid.NhanVienID = _nhanvienID;
            KTRadGrid.QuanLy = false;

            KLRadGrid.NhanVienID = _nhanvienID;
            KLRadGrid.QuanLy = false;

            DGRadGrid.NhanVienID = _nhanvienID;
            DGRadGrid.QuanLy = false;

            CSRadGrid.NhanVienID = _nhanvienID;
            CSRadGrid.QuanLy = false;

            KKRadGrid.NhanVienID = _nhanvienID;
            KKRadGrid.QuanLy = false;

            DGLDRadGrid.NhanVienID = _nhanvienID;
            DGLDRadGrid.QuanLy = false;

            DGVCRadGrid.NhanVienID = _nhanvienID;
            DGVCRadGrid.QuanLy = false;

            DGDVRadGrid.NhanVienID = _nhanvienID;
            DGDVRadGrid.QuanLy = false;

            if (!account.ACCInLyLich)
            {
                btLamViecNew.Visible = false;
                btCTXHNew.Visible = false;
                btDaoTaoNew.Visible = false;
                btQuanHeNew.Visible = false;
                btNgoaiNguNew.Visible = false;
                btTinHocNew.Visible = false;
                btDanhHieuNew.Visible = false;
                btKhenThuongNew.Visible = false;
                btKyLuatNew.Visible = false;
                btDanhGiaNew.Visible = false;
                btChinhSachNew.Visible = false;
            }

            if (!account.ACCInKeKhai)
                btKeKhaiNew.Visible = false;

            if (!account.ACCInDanhGia)
            {
                btDanhGiaDangVienNew.Visible = false;
                btDanhGiaLaoDongNew.Visible = false;
                btDanhGiaVienChucNew.Visible = false;
            }
        }        

        protected void btKeKhaiNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/KeKhai");
        }

        protected void btDanhGiaLaoDongNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/DanhGiaLaoDong");
        }

        protected void btDanhGiaVienChucNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/DanhGiaVienChuc");
        }

        protected void btDanhGiaDangVienNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/DanhGiaDangVien");
        }

        protected void btLamViecNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/LamViec");
        }

        protected void btCTXHNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/CTXH");
        }

        protected void btDaoTaoNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/QuaTrinhDaoTao");
        }

        protected void btQuanHeNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/QuanHe");
        }

        protected void btNgoaiNguNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/TrinhDoNgoaiNgu");
        }

        protected void btTinHocNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/TrinhDoTinHoc");
        }

        protected void btDanhHieuNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/PhongTangDanhHieu");
        }

        protected void btKhenThuongNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/KhenThuong");
        }

        protected void btKyLuatNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/KyLuat");
        }

        protected void btDanhGiaNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/DanhGia");
        }

        protected void btChinhSachNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/ChinhSach");
        }
    }
}