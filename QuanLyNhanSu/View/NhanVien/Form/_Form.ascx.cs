using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.NhanVien.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.DanTocEntity _dantocEntity = new Models.DanTocEntity();
        private Models.TonGiaoEntity _tongiaoEntity = new Models.TonGiaoEntity();
        private Models.GiaoDucPhoThongEntity _giaoducphothongEntity = new Models.GiaoDucPhoThongEntity();
        private Models.ChuyenMonEntity _chuyenMonEntity = new Models.ChuyenMonEntity();
        private Models.LyLuanChinhTriEntity _lyluanchinhtriEntity = new Models.LyLuanChinhTriEntity();
        private Models.QuanLyNhaNuocEntity _quanlynhanuocEntity = new Models.QuanLyNhaNuocEntity();
        private Models.GiaDinhChinhSachEntity _giadinhchinhsachEntity = new Models.GiaDinhChinhSachEntity();
        private Models.NhomMauEntity _nhommauEntity = new Models.NhomMauEntity();
        private Models.NhanVienEntity _nhanvienEntity = new Models.NhanVienEntity();
        private int _nhanvienID;
        private bool _quanly = true;

        public bool QuanLy
        {
            set
            {
                _quanly = value;
            }
        }

        public int NhanVienID
        {
            set
            {
                _nhanvienID = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            RadDatePickerNgaySinh.MaxDate = DateTime.Now.AddYears(-18);
            RadDatePickerNgaySinh.MinDate = DateTime.Now.AddYears(-80);

            if (!IsPostBack)
            {
                // LOAD DATASOURCE
                _dantocEntity.Load_DataSource_RadComboBox(cbbDanToc);
                cbbDanToc.SelectedValue = "1";
                _tongiaoEntity.Load_DataSource_RadComboBox(cbbTonGiao);
                cbbTonGiao.SelectedValue = "14";
                _giaoducphothongEntity.Load_DataSource_DropDownList(RadDropDownListGiaoDucPhoThong);
                RadDropDownListGiaoDucPhoThong.SelectedValue = "12";
                _chuyenMonEntity.Load_DataSource_DropDownList(RadDropDownListChuyenMon);
                _lyluanchinhtriEntity.Load_DataSource_DropDownList(RadDropDownListLyLuanChinhTri);
                _quanlynhanuocEntity.Load_DataSource_DropDownList(RadDropDownListQuanLyNhaNuoc);
                _nhommauEntity.Load_DataSource_DropDownList(RadDropDownListNhomMau);

                // DEFAULT VALUE
                RadDatePickerNgaySinh.SelectedDate = DateTime.Now.AddYears(-18);
            }

            if (_nhanvienID != 0)
            {
                if (_quanly)
                    this.UpdateStatus();
                else
                    this.CaNhanStatus();

                Models.NhanVien currentNhanVien = _nhanvienEntity.Find_NhanVien(_nhanvienID);

                if (!IsPostBack)
                {
                    // LOAD DATA
                    if (currentNhanVien.NVHinh != null)
                        ImageIMG.ImageUrl = "~/Uploads/Images/NhanVien/" + currentNhanVien.NVHinh;
                    else
                        ImageIMG.ImageUrl = "~/Uploads/Images/NhanVien/DefaultUser.png";
                    RadTextBoxTen.Text = currentNhanVien.NVTen;
                    RadTextBoxTenKhac.Text = currentNhanVien.NVTenKhac;
                    RadDatePickerNgaySinh.SelectedDate = Convert.ToDateTime(currentNhanVien.NVNgaySinh);
                    RadioButtonGioiTinh.SelectedValue = currentNhanVien.NVGioiTinh.ToString();
                    cbbDanToc.SelectedValue = currentNhanVien.DTID.ToString();
                    cbbTonGiao.SelectedValue = currentNhanVien.TGID.ToString();
                    RadTextBoxHoKhau.Text = currentNhanVien.NVHoKhau;
                    RadTextBoxNoiO.Text = currentNhanVien.NVNoiO;
                    txtBHXH.Text = currentNhanVien.NVBHXH;
                    RadDropDownListGiaoDucPhoThong.SelectedValue = currentNhanVien.GDPTID.ToString();
                    RadDropDownListChuyenMon.SelectedValue = currentNhanVien.CMID.ToString();
                    RadDropDownListLyLuanChinhTri.SelectedValue = currentNhanVien.LLCTID.ToString();
                    RadDropDownListQuanLyNhaNuoc.SelectedValue = currentNhanVien.QLNNID.ToString();
                    rblSucKhoe.SelectedValue = currentNhanVien.NVTinhTrangSucKhoe;
                    if (currentNhanVien.NVChieuCao != null)
                        if (currentNhanVien.NVChieuCao % 1 == 0)
                            RadTextBoxChieuCao.Text = Convert.ToDecimal(currentNhanVien.NVChieuCao).ToString("###");
                        else
                            RadTextBoxChieuCao.Text = currentNhanVien.NVChieuCao.ToString();
                    if (currentNhanVien.NVCanNang != null)
                        if (currentNhanVien.NVCanNang % 1 == 0)
                            RadTextBoxCanNang.Text = Convert.ToDecimal(currentNhanVien.NVCanNang).ToString("###");
                        else
                            RadTextBoxCanNang.Text = currentNhanVien.NVCanNang.ToString();
                    RadDropDownListNhomMau.SelectedValue = currentNhanVien.NMID.ToString();
                    RadTextBoxCMND.Text = currentNhanVien.NVCMND;
                    if (currentNhanVien.NVNgayCapCMND != null)
                        RadDatePickerCMNDNgayCap.SelectedDate = Convert.ToDateTime(currentNhanVien.NVNgayCapCMND);
                    RadTextBoxNoiSinh.Text = currentNhanVien.NVNoiSinh;
                    RadTextBoxQueQuan.Text = currentNhanVien.NVQueQuan;
                    RadTextBoxNganh.Text = currentNhanVien.NVNganh;
                }
            }
            else
            {
                this.CreateStatus();
            }
        }


        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = RadTextBoxTen.Text;
                string tenkhac = RadTextBoxTenKhac.Text;
                DateTime ngaysinh = Convert.ToDateTime(RadDatePickerNgaySinh.SelectedDate);
                bool gioitinh = Convert.ToBoolean(RadioButtonGioiTinh.SelectedValue);
                string noisinh = RadTextBoxNoiSinh.Text;
                string quequan = RadTextBoxQueQuan.Text;
                string bhxh = txtBHXH.Text;
                int dantoc = Convert.ToInt32(cbbDanToc.SelectedValue);
                int tongiao = Convert.ToInt32(cbbTonGiao.SelectedValue);
                string hokhau = RadTextBoxHoKhau.Text;
                string noio = RadTextBoxNoiO.Text;
                int giaoducphothong = Convert.ToInt32(RadDropDownListGiaoDucPhoThong.SelectedValue);
                int chuyenmon = Convert.ToInt32(RadDropDownListChuyenMon.SelectedValue);
                int chinhtri = Convert.ToInt32(RadDropDownListLyLuanChinhTri.SelectedValue);
                int quanlynhanuoc = Convert.ToInt32(RadDropDownListQuanLyNhaNuoc.SelectedValue);
                string suckhoe = rblSucKhoe.Text;
                int nhommau = Convert.ToInt32(RadDropDownListNhomMau.SelectedValue);
                string cmnd = RadTextBoxCMND.Text;
                DateTime cmndNgay = Convert.ToDateTime(RadDatePickerCMNDNgayCap.SelectedDate);
                string chuyennganh = RadTextBoxNganh.Text;
                decimal chieucao = 0;
                try
                {
                    chieucao = Convert.ToDecimal(RadTextBoxChieuCao.Text);
                }catch { }

                decimal cannang = 0;
                try
                {
                    cannang = Convert.ToDecimal(RadTextBoxCanNang.Text);
                }catch { }
                

                _nhanvienEntity.Insert(ten, tenkhac, ngaysinh, gioitinh, dantoc, tongiao, hokhau, noio, giaoducphothong, chuyenmon, chinhtri, quanlynhanuoc, suckhoe, chieucao,
                    cannang, nhommau, cmnd, cmndNgay, noisinh, quequan, chuyennganh, FileUploadImage, bhxh);
                
                Response.Redirect("~/NhanSu/" + _nhanvienEntity.LastNhanVien.NVID);
            }            
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = RadTextBoxTen.Text;
                string tenkhac = RadTextBoxTenKhac.Text;
                DateTime ngaysinh = Convert.ToDateTime(RadDatePickerNgaySinh.SelectedDate);
                bool gioitinh = Convert.ToBoolean(RadioButtonGioiTinh.SelectedValue);
                string noisinh = RadTextBoxNoiSinh.Text;
                string quequan = RadTextBoxQueQuan.Text;
                int dantoc = Convert.ToInt32(cbbDanToc.SelectedValue);
                int tongiao = Convert.ToInt32(cbbTonGiao.SelectedValue);
                string hokhau = RadTextBoxHoKhau.Text;
                string noio = RadTextBoxNoiO.Text;
                string bhxh = txtBHXH.Text;
                int giaoducphothong = Convert.ToInt32(RadDropDownListGiaoDucPhoThong.SelectedValue);
                int chuyenmon = Convert.ToInt32(RadDropDownListChuyenMon.SelectedValue);
                int chinhtri = Convert.ToInt32(RadDropDownListLyLuanChinhTri.SelectedValue);
                int quanlynhanuoc = Convert.ToInt32(RadDropDownListQuanLyNhaNuoc.SelectedValue);
                string suckhoe = rblSucKhoe.Text;
                int nhommau = Convert.ToInt32(RadDropDownListNhomMau.SelectedValue);
                string cmnd = RadTextBoxCMND.Text;
                DateTime cmndNgay = Convert.ToDateTime(RadDatePickerCMNDNgayCap.SelectedDate);
                string nganh = RadTextBoxNganh.Text;
                decimal chieucao = Convert.ToDecimal(RadTextBoxChieuCao.Text);
                decimal cannang = Convert.ToDecimal(RadTextBoxCanNang.Text);

                _nhanvienEntity.Update(_nhanvienID, ten, tenkhac, ngaysinh, gioitinh, dantoc, tongiao, hokhau, noio, giaoducphothong, chuyenmon,
                    chinhtri, quanlynhanuoc, suckhoe, chieucao, cannang, nhommau, cmnd, cmndNgay, noisinh, quequan, nganh, FileUploadImage, CheckBoxUseImage.Checked, bhxh);

                Response.Redirect("~/NhanSu");
            }            
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            Models.NhanVien nhanvien = _nhanvienEntity.Find_NhanVien(_nhanvienID);
            if (nhanvien.Accounts.Where(x => x.ACCChucNang == 0).Count() > 0)
            {
                Helper.PageHelper pageHelper = new Helper.PageHelper();
                pageHelper.AlertMessage(this.Page, "Nhân viên " + nhanvien.NVTen + " phụ trách chức năng quản trị nên không thể xóa!");
            }else
            {
                _nhanvienEntity.Delete(_nhanvienID);
                Response.Redirect("~/NhanSu");
            }            
        }

        private void CreateStatus()
        {
            ButtonCreate.Visible = true;
            CheckBoxUseImage.Visible = false;
            ButtonUpdate.Visible = false;
            ButtonDelete.Visible = false;
            ButtonBack.Visible = true;
        }

        private void UpdateStatus()
        {
            ButtonCreate.Visible = false;
            CheckBoxUseImage.Visible = true;
            ButtonUpdate.Visible = true;
            ButtonDelete.Visible = true;
            ButtonBack.Visible = true;
        }

        private void CaNhanStatus()
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            Models.Account account = accEntity.FindByEmail(email);
            if (account.ACCUpThongTinCaNhan)
            {
                CheckBoxUseImage.Visible = true;
                ButtonUpdate.Visible = true;
            }else
            {
                CheckBoxUseImage.Visible = false;
                ButtonUpdate.Visible = false;
            }
            
            ButtonCreate.Visible = false;            
            ButtonDelete.Visible = false;
            ButtonBack.Visible = false;
        }

        protected void btKeKhaiTaiSan_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID + "/KeKhai");
        }
    }
}