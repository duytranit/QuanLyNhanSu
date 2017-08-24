using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGiaLaoDong.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _danhgiaID;
        private Models.DanhGiaLaoDongEntity _dgEntity = new Models.DanhGiaLaoDongEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
            if (this.Page.RouteData.Values["danhgia"] != null)
            {
                this.UpdateStatus();
                _danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                Models.DanhGiaLaoDong danhgia = _dgEntity.Find(_danhgiaID);
                _nhanvienID = danhgia.NVID;
                
                if (!this.Page.IsPostBack)
                {
                    dpkNgayThang.SelectedDate = danhgia.DGLDNgay;
                    txtNam.Text = danhgia.DGLDNam.ToString();                    
                    txtChucDanh.Text = danhgia.DGLDChucDanh;
                    txtDonVi.Text = danhgia.DGLDDonVi;
                    txtNgheNghiep.Text = danhgia.DGLDNgheNghiep;
                    txtBac.Text = danhgia.DGLDBac.ToString();
                    txtHeSoLuong.Text = danhgia.DGLDHeSoLuong.ToString();
                    txtKetQua.Text = danhgia.DGLDKetQua;
                    txtDaoDuc.Text = danhgia.DGLDDaoDuc;
                    txtTrachNhiem.Text = danhgia.DGLDTrachNhiem;
                    txtNghiaVu.Text = danhgia.DGLDNghiaVu;
                    txtUuDiem.Text = danhgia.DGLDUuDiem;
                    ddlDanhGia.SelectedValue = danhgia.DGLDUuDiem;
                    txtYKien.Text = danhgia.DGLDYKien;
                    ddlThongNhat.SelectedValue = danhgia.DGLDThongNhat;
                }
            }
            else
            {
                this.CreateStatus();
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                if (!this.Page.IsPostBack)
                    dpkNgayThang.SelectedDate = DateTime.Now;
            }

            Models.NhanVien nhanvien = nvEntity.Find_NhanVien(_nhanvienID);
            lblHoTen.Text = nhanvien.NVTen;
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                int nam = Convert.ToInt32(txtNam.Text);
                string chucdanh = txtChucDanh.Text;
                string donvi = txtDonVi.Text;
                string nghenghiep = txtNgheNghiep.Text;
                int bac = Convert.ToInt32(txtBac.Text);
                decimal hesoluong = Convert.ToDecimal(txtHeSoLuong.Text);
                string ketqua = txtKetQua.Text;
                string daoduc = txtDaoDuc.Text;
                string trachnhiem = txtTrachNhiem.Text;
                string nghiavu = txtNghiaVu.Text;
                string uudiem = txtUuDiem.Text;
                string danhgia = ddlDanhGia.SelectedValue;
                string ykien = txtYKien.Text;
                string thongnhat = ddlThongNhat.SelectedValue;
                _dgEntity.Insert(_nhanvienID, nam, chucdanh, donvi, nghenghiep, bac,
                    hesoluong, ketqua, daoduc, trachnhiem, nghiavu, uudiem, danhgia, ykien, thongnhat, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                int nam = Convert.ToInt32(txtNam.Text);
                string chucdanh = txtChucDanh.Text;
                string donvi = txtDonVi.Text;
                string nghenghiep = txtNgheNghiep.Text;
                int bac = Convert.ToInt32(txtBac.Text);
                decimal hesoluong = Convert.ToDecimal(txtHeSoLuong.Text);
                string ketqua = txtKetQua.Text;
                string daoduc = txtDaoDuc.Text;
                string trachnhiem = txtTrachNhiem.Text;
                string nghiavu = txtNghiaVu.Text;
                string uudiem = txtUuDiem.Text;
                string danhgia = ddlDanhGia.SelectedValue;
                string ykien = txtYKien.Text;
                string thongnhat = ddlThongNhat.SelectedValue;
                _dgEntity.Update(_danhgiaID, nam, chucdanh, donvi, nghenghiep, bac,
                    hesoluong, ketqua, daoduc, trachnhiem, nghiavu, uudiem, danhgia, ykien, thongnhat, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
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

        protected void ddlDanhGia_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            ddlThongNhat.SelectedValue = ddlDanhGia.SelectedValue;
        }
    }
}