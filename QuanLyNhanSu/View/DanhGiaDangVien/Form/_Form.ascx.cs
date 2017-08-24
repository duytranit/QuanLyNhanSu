using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGiaDangVien.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _danhgiaID;
        private Models.DanhGiaDangVienEntity _dgEntity = new Models.DanhGiaDangVienEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["danhgia"] != null)
            {
                this.UpdateStatus();
                _danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                Models.DanhGiaDangVien danhgia = _dgEntity.Find(_danhgiaID);
                _nhanvienID = danhgia.NVID;                
                if (!this.Page.IsPostBack)
                {
                    txtChucVuDang.Text = danhgia.DGDVChucVuDang;
                    txtChucVuChinhQuyen.Text = danhgia.DGDVChucVuChinhQuyen;
                    txtDonVi.Text = danhgia.DGDVDonVi;
                    txtChiBo.Text = danhgia.DGDVChiBo;
                    txtHangChucDanh.Text = danhgia.DGDVHangChucDanh;
                    txtBac.Text = danhgia.DGDVBac.ToString();
                    txtHeSoLuong.Text = danhgia.DGDVHeSoLuong.ToString();
                    txtUuDiem.Text = danhgia.DGDVUuDiem;
                    txtKetQuaKhacPhuc.Text = danhgia.DGDVKetQuaKhacPhuc;
                    txtKhuyetDiem.Text = danhgia.DGDVKhuyetDiem;
                    txtPhuongHuong.Text = danhgia.DGDVPhuongHuong;
                    ddlDanhGia.SelectedValue = danhgia.DGDVDanhGia;
                    txtNam.Text = danhgia.DGDVNam.ToString();
                    dpkNgayThang.SelectedDate = danhgia.DGDVNgayThang;
                }
            }else
            {
                this.CreateStatus();
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
            }
            Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
            Models.NhanVien nhanvien = nvEntity.Find_NhanVien(_nhanvienID);
            lblTen.Text = nhanvien.NVTen;
            lblDOB.Text = nhanvien.NVNgaySinh.ToString("dd/MM/yyyy");
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string chucvudang = txtChucVuDang.Text;
                string chucvuchinhquyen = txtChucVuChinhQuyen.Text;
                string donvi = txtDonVi.Text;
                string chibo = txtChiBo.Text;
                string hangchucdanh = txtHangChucDanh.Text;
                int bac = Convert.ToInt32(txtBac.Text);
                decimal hesoluong = Convert.ToDecimal(txtHeSoLuong.Text);
                string uudiem = txtUuDiem.Text;
                string ketquakhacphuc = txtKetQuaKhacPhuc.Text;
                string khuyetdiem = txtKhuyetDiem.Text;
                string phuonghuong = txtPhuongHuong.Text;
                string danhgia = ddlDanhGia.SelectedValue;
                int nam = Convert.ToInt32(txtNam.Text);
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                _dgEntity.Insert(_nhanvienID, chucvudang, chucvuchinhquyen, donvi, chibo, hangchucdanh, bac, hesoluong, uudiem, ketquakhacphuc, khuyetdiem,
                    phuonghuong, danhgia, nam, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string chucvudang = txtChucVuDang.Text;
                string chucvuchinhquyen = txtChucVuChinhQuyen.Text;
                string donvi = txtDonVi.Text;
                string chibo = txtChiBo.Text;
                string hangchucdanh = txtHangChucDanh.Text;
                int bac = Convert.ToInt32(txtBac.Text);
                decimal hesoluong = Convert.ToDecimal(txtHeSoLuong.Text);
                string uudiem = txtUuDiem.Text;
                string ketquakhacphuc = txtKetQuaKhacPhuc.Text;
                string khuyetdiem = txtKhuyetDiem.Text;
                string phuonghuong = txtPhuongHuong.Text;
                string danhgia = ddlDanhGia.SelectedValue;
                int nam = Convert.ToInt32(txtNam.Text);
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                _dgEntity.Update(_danhgiaID, chucvudang, chucvuchinhquyen, donvi, chibo, hangchucdanh, bac, hesoluong, uudiem, ketquakhacphuc, khuyetdiem,
                    phuonghuong, danhgia, nam, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            _dgEntity.Delete(_danhgiaID);
            this.RedirectToIndex();
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void CreateStatus()
        {
            btCreate.Visible = true;
            btUpdate.Visible = false;
            btDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            btCreate.Visible = false;
            btUpdate.Visible = true;
            btDelete.Visible = true;
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID);
        }
    }
}