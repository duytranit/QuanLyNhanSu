using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.NhanVien.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        private int _nhanvienID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null || account.ACCChucNang > 1)
                    Response.Redirect("~/");
                else if (this.Page.RouteData.Values["nhanvien"] != null)
                    try
                    {
                        _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                        Models.NhanVienEntity nhanvienEntity = new Models.NhanVienEntity();
                        Models.NhanVien nhanvien = nhanvienEntity.Find_NhanVien(_nhanvienID);
                        if (nhanvien == null)
                            Response.Redirect("~/NhanSu");
                        else
                        {
                            pnlExtraInforamtion.Visible = true;
                            CUDForm.NhanVienID = _nhanvienID;
                            LVRadGrid.NhanVienID = _nhanvienID;
                            CTXHRadGrid.NhanVienID = _nhanvienID;
                            DTRadGrid.NhanVienID = _nhanvienID;
                            QHRadGrid.NhanVienID = _nhanvienID;
                            TDNNRadGrid.NhanVienID = _nhanvienID;
                            TDTHRadGrid.NhanVienID = _nhanvienID;
                            PTDHRadGrid.NhanVienID = _nhanvienID;
                            KTRadGrid.NhanVienID = _nhanvienID;
                            KLRadGrid.NhanVienID = _nhanvienID;
                            DGRadGrid.NhanVienID = _nhanvienID;
                            CSRadGrid.NhanVienID = _nhanvienID;
                            KKRadGrid.NhanVienID = _nhanvienID;
                            DGLDRadGrid.NhanVienID = _nhanvienID;
                            DGVCRadGrid.NhanVienID = _nhanvienID;
                        }                            
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/NhanSu");
                    }
            }
            else
                Response.Redirect("~/");
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
    }
}