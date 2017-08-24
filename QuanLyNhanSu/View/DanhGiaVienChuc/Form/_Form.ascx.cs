﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGiaVienChuc.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _danhgiaID;
        private Models.DanhGiaVienChucEntity _dgEntity = new Models.DanhGiaVienChucEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
            if (this.Page.RouteData.Values["danhgia"] != null)
            {
                this.UpdateStatus();
                _danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                Models.DanhGiaVienChuc danhgia = _dgEntity.Find(_danhgiaID);
                _nhanvienID = danhgia.NVID;

                if (!this.Page.IsPostBack)
                {
                    dpkNgayThang.SelectedDate = danhgia.DGVCNgay;
                    txtNam.Text = danhgia.DGVCNam.ToString();
                    txtChucDanh.Text = danhgia.DGVCChucDanh;
                    txtDonVi.Text = danhgia.DGVCDonVi;
                    txtNgheNghiep.Text = danhgia.DGVCNgheNghiep;
                    txtBac.Text = danhgia.DGVCBac.ToString();
                    txtHeSoLuong.Text = danhgia.DGVCHeSoLuong.ToString();
                    txtKetQua.Text = danhgia.DGVCKetQua;
                    txtDaoDuc.Text = danhgia.DGVCDaoDuc;
                    txtTrachNhiem.Text = danhgia.DGVCTrachNhiem;
                    txtNghiaVu.Text = danhgia.DGVCNghiaVu;
                    txtUuDiem.Text = danhgia.DGVCUuDiem;
                    ddlDanhGia.SelectedValue = danhgia.DGVCUuDiem;
                    txtYKien.Text = danhgia.DGVCYKien;
                    ddlThongNhat.SelectedValue = danhgia.DGVCThongNhat;
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