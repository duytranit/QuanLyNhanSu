using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.LamViec.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _lamviecID;
        private Models.LamViecEntity _lvEntity = new Models.LamViecEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                Models.DonViEntity dvEntity = new Models.DonViEntity();
                dvEntity.Load_DataSource_RadDropDownTree(ddtDonVi);

                Models.ChucVuEntity cvEntity = new Models.ChucVuEntity();
                cvEntity.Load_AllChucVu_RadComboBox(cbbChucVu);

                Models.HeSoLuongEntity hslEntity = new Models.HeSoLuongEntity();
                hslEntity.Load_DataSource_ComboBox(cbbHeSoLuong);

                dpkTuNgay.SelectedDate = DateTime.Now;
            }

            if (this.Page.RouteData.Values["lamviec"] != null)
            {
                this.UpdateStatus();
                _lamviecID = Convert.ToInt32(this.Page.RouteData.Values["lamviec"]);
                Models.LamViec lamviec = _lvEntity.Find(_lamviecID);
                _nhanvienID = lamviec.NVID;
                if (!this.Page.IsPostBack)
                {
                    ddtDonVi.SelectedValue = lamviec.DVID.ToString();
                    cbbChucVu.SelectedValue = lamviec.CVID.ToString();
                    dpkTuNgay.SelectedDate = lamviec.LVTuNgay;
                    if (lamviec.LVDenNgay != null && lamviec.LVDenNgay != DateTime.MinValue)
                        dpkDenNgay.SelectedDate = lamviec.LVDenNgay;
                    cbbHeSoLuong.SelectedValue = lamviec.HSLID.ToString();
                    if (lamviec.LVLuongCoBan % 1 == 0)
                        txtLuongCoBan.Text = lamviec.LVLuongCoBan.ToString("###");
                    else
                        txtLuongCoBan.Text = lamviec.LVLuongCoBan.ToString();
                    txtNgheNghiep.Text = lamviec.LVNhiemVu;
                    txtPhuCapChucVu.Text = lamviec.LVPhuCapChucVu.ToString();
                    txtPhuCapCongVu.Text = lamviec.LVPhuCapCongVu.ToString();
                    txtPhuCapKiemNhiem.Text = lamviec.LVPhuCapKiemNhiem.ToString();
                    txtPhuCapNghe.Text = lamviec.LVPhuCapNghe.ToString();
                    txtPhuCapThamNien.Text = lamviec.LVPhuCapThamNienNghe.ToString();
                    txtPhuCapVuotKhung.Text = lamviec.LVPhuCapVuotKhung.ToString();
                    txtPhuCapDocHai.Text = lamviec.LVPhuCapVuotKhung.ToString();
                    txtTyLe.Text = lamviec.LVTyLe.ToString();
                    txtSoNgayPhep.Text = lamviec.LVSoNgayPhep.ToString();
                    txtSoHopDong.Text = lamviec.LVSoHopDong;
                    if (lamviec.LVNgayHopDong != null && lamviec.LVNgayHopDong != DateTime.MinValue)
                        dpkNgayHopDong.SelectedDate = Convert.ToDateTime(lamviec.LVNgayHopDong);
                }
            }else
            {
                this.CreateStatus();
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                Models.NhanVien nhanvien = nvEntity.Find_NhanVien(_nhanvienID);
                Models.LamViec lamviec = nhanvien.LamViecs.OrderByDescending(x => x.LVID).FirstOrDefault();
                if (lamviec != null && !this.Page.IsPostBack)
                {
                    ddtDonVi.SelectedValue = lamviec.DVID.ToString();
                    cbbChucVu.SelectedValue = lamviec.CVID.ToString();
                    dpkTuNgay.SelectedDate = lamviec.LVTuNgay;
                    if (lamviec.LVDenNgay != null && lamviec.LVDenNgay != DateTime.MinValue)
                        dpkDenNgay.SelectedDate = lamviec.LVDenNgay;
                    cbbHeSoLuong.SelectedValue = lamviec.HSLID.ToString();
                    if (lamviec.LVLuongCoBan % 1 == 0)
                        txtLuongCoBan.Text = lamviec.LVLuongCoBan.ToString("###");
                    else
                        txtLuongCoBan.Text = lamviec.LVLuongCoBan.ToString();
                    txtNgheNghiep.Text = lamviec.LVNhiemVu;
                    txtPhuCapChucVu.Text = lamviec.LVPhuCapChucVu.ToString();
                    txtPhuCapCongVu.Text = lamviec.LVPhuCapCongVu.ToString();
                    txtPhuCapKiemNhiem.Text = lamviec.LVPhuCapKiemNhiem.ToString();
                    txtPhuCapNghe.Text = lamviec.LVPhuCapNghe.ToString();
                    txtPhuCapThamNien.Text = lamviec.LVPhuCapThamNienNghe.ToString();
                    txtPhuCapVuotKhung.Text = lamviec.LVPhuCapVuotKhung.ToString();
                    txtPhuCapDocHai.Text = lamviec.LVPhuCapVuotKhung.ToString();
                    txtTyLe.Text = lamviec.LVTyLe.ToString();
                    txtSoNgayPhep.Text = lamviec.LVSoNgayPhep.ToString();
                }
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int donviID = Convert.ToInt32(ddtDonVi.SelectedValue);
                int chucvuID = Convert.ToInt32(cbbChucVu.SelectedValue);
                int hesoluongID = Convert.ToInt32(cbbHeSoLuong.SelectedValue);
                DateTime tungay = Convert.ToDateTime(dpkTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(dpkDenNgay.SelectedDate);
                decimal luongcoban = Convert.ToDecimal(txtLuongCoBan.Text);
                string nhiemvu = txtNgheNghiep.Text;
                decimal phucapchucvu = Convert.ToDecimal(txtPhuCapChucVu.Text);
                decimal phucapcongvu = Convert.ToDecimal(txtPhuCapCongVu.Text);
                decimal phucapkiemnhiem = Convert.ToDecimal(txtPhuCapKiemNhiem.Text);
                decimal phucapnghe = Convert.ToDecimal(txtPhuCapNghe.Text);
                decimal phucapthamnien = Convert.ToDecimal(txtPhuCapThamNien.Text);
                decimal phucapvuotkhung = Convert.ToDecimal(txtPhuCapVuotKhung.Text);
                decimal phucapdochai = Convert.ToDecimal(txtPhuCapDocHai.Text);
                decimal tyle = Convert.ToDecimal(txtTyLe.Text);
                int songayphep = Convert.ToInt32(txtSoNgayPhep.Text);
                string sohopdong = txtSoHopDong.Text;
                DateTime ngayhopdong = Convert.ToDateTime(dpkNgayHopDong.SelectedDate);
                _lvEntity.Insert(_nhanvienID, donviID, chucvuID, tungay, denngay, hesoluongID,
                    luongcoban, nhiemvu, phucapchucvu, phucapcongvu, phucapkiemnhiem, phucapnghe,
                    phucapthamnien, phucapvuotkhung, phucapdochai, tyle, songayphep, sohopdong, ngayhopdong);
                this.RedirectToIndex();
            }            
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int donviID = Convert.ToInt32(ddtDonVi.SelectedValue);
                int chucvuID = Convert.ToInt32(cbbChucVu.SelectedValue);
                int hesoluongID = Convert.ToInt32(cbbHeSoLuong.SelectedValue);
                DateTime tungay = Convert.ToDateTime(dpkTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(dpkDenNgay.SelectedDate);
                decimal luongcoban = Convert.ToDecimal(txtLuongCoBan.Text);
                string nhiemvu = txtNgheNghiep.Text;
                decimal phucapchucvu = Convert.ToDecimal(txtPhuCapChucVu.Text);
                decimal phucapcongvu = Convert.ToDecimal(txtPhuCapCongVu.Text);
                decimal phucapkiemnhiem = Convert.ToDecimal(txtPhuCapKiemNhiem.Text);
                decimal phucapnghe = Convert.ToDecimal(txtPhuCapNghe.Text);
                decimal phucapthamnien = Convert.ToDecimal(txtPhuCapThamNien.Text);
                decimal phucapvuotkhung = Convert.ToDecimal(txtPhuCapVuotKhung.Text);
                decimal phucapdochai = Convert.ToDecimal(txtPhuCapDocHai.Text);
                decimal tyle = Convert.ToDecimal(txtTyLe.Text);
                int songayphep = Convert.ToInt32(txtSoNgayPhep.Text);
                string sohopdong = txtSoHopDong.Text;
                DateTime ngayhopdong = Convert.ToDateTime(dpkNgayHopDong.SelectedDate);
                _lvEntity.Update(_lamviecID, donviID, chucvuID, tungay, denngay, hesoluongID,
                    luongcoban, nhiemvu, phucapchucvu, phucapcongvu, phucapkiemnhiem, phucapnghe,
                    phucapthamnien, phucapvuotkhung, phucapdochai, tyle, songayphep, sohopdong, ngayhopdong);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _lvEntity.Delete(_lamviecID);
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