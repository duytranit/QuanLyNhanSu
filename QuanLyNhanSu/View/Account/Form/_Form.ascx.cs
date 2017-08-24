using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Account.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _accountID;
        private Models.AccountEntity _accEntity = new Models.AccountEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                nvEntity.Load_AllNhanVienDonVi_ToRadDropDownTree(ddtNhanVien);
            }

            if (this.Page.RouteData.Values["account"] != null)
            {
                this.UpdateStatus();
                _accountID = Convert.ToInt32(this.Page.RouteData.Values["account"]);
                Models.Account account = _accEntity.Find(_accountID);
                if (!this.Page.IsPostBack)
                {
                    ddtNhanVien.SelectedValue = account.NVID.ToString();
                    txtEmail.Text = account.ACCEmail;
                    txtPassword.Text = account.ACCPassword;
                    rblChucNang.SelectedValue = account.ACCChucNang.ToString();
                    rblTrangThai.SelectedValue = account.ACCStatus.ToString();
                    cbThongTinCaNhan.Checked = account.ACCUpThongTinCaNhan;
                    cbLyLich.Checked = account.ACCUpLyLich;
                    cbInLyLich.Checked = account.ACCInLyLich;
                    cbInKeKhai.Checked = account.ACCInKeKhai;
                    cbUpKeKhai.Checked = account.ACCUpKeKhai;
                    cbInDanhGia.Checked = account.ACCInDanhGia;
                    cbUpDanhGia.Checked = account.ACCUpDanhGia;
                }
            }else
            {
                this.CreateStatus();
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                try
                {
                    int nhanvienID = Convert.ToInt32(ddtNhanVien.SelectedValue);
                    string email = txtEmail.Text;
                    string password = txtPassword.Text;
                    int chucnang = Convert.ToInt32(rblChucNang.SelectedValue);
                    bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                    bool upThongTinCaNhan = cbThongTinCaNhan.Checked;
                    bool upLyLich = cbLyLich.Checked;
                    bool inLyLich = cbInLyLich.Checked;
                    bool inKeKhai = cbInKeKhai.Checked;
                    bool upKeKhai = cbUpKeKhai.Checked;
                    bool inDanhGia = cbInDanhGia.Checked;
                    bool upDanhGia = cbUpDanhGia.Checked;
                    _accEntity.Insert(nhanvienID, email, password, chucnang, trangthai, upThongTinCaNhan, upLyLich, inLyLich, inKeKhai, upKeKhai, inDanhGia, upDanhGia);
                    this.RedirectToIndex();
                }catch
                {
                    Helper.PageHelper pageHelper = new Helper.PageHelper();
                    pageHelper.AlertMessage(this.Page, "Chọn nhân viên thích hợp");
                }
                
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                try
                {
                    int nhanvienID = Convert.ToInt32(ddtNhanVien.SelectedValue);
                    string email = txtEmail.Text;
                    string password = txtPassword.Text;
                    int chucnang = Convert.ToInt32(rblChucNang.SelectedValue);
                    bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                    bool upThongTinCaNhan = cbThongTinCaNhan.Checked;
                    bool upLyLich = cbLyLich.Checked;
                    bool inLyLich = cbInLyLich.Checked;
                    bool inKeKhai = cbInKeKhai.Checked;
                    bool upKeKhai = cbUpKeKhai.Checked;
                    bool inDanhGia = cbInDanhGia.Checked;
                    bool upDanhGia = cbUpDanhGia.Checked;
                    _accEntity.Update(nhanvienID, _accountID, chucnang, trangthai, upThongTinCaNhan, upLyLich, inLyLich, inKeKhai, upKeKhai, inDanhGia, upDanhGia);
                    this.RedirectToIndex();
                }
                catch
                {
                    Helper.PageHelper pageHelper = new Helper.PageHelper();
                    pageHelper.AlertMessage(this.Page, "Chọn nhân viên thích hợp");
                }
                
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _accEntity.Delete(_accountID);
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
            txtEmail.Enabled = false;
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/TaiKhoan");
        }

        protected void rblChucNang_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblChucNang.SelectedIndex != 2)
            {
                cbThongTinCaNhan.Checked = true;
                cbLyLich.Checked = true;
                cbInLyLich.Checked = true;
                cbInKeKhai.Checked = true;
                cbUpKeKhai.Checked = true;
                cbInDanhGia.Checked = true;
                cbUpDanhGia.Checked = true;

                cbThongTinCaNhan.Enabled = false;
                cbLyLich.Enabled = false;
                cbInLyLich.Enabled = false;
                cbInKeKhai.Enabled = false;
                cbUpKeKhai.Enabled = false;
                cbInDanhGia.Enabled = false;
                cbUpDanhGia.Enabled = false;
            }else
            {
                cbThongTinCaNhan.Enabled = true;
                cbLyLich.Enabled = true;
                cbInLyLich.Enabled = true;
                cbInKeKhai.Enabled = true;
                cbUpKeKhai.Enabled = true;
                cbInDanhGia.Enabled = true;
                cbUpDanhGia.Enabled = true;
            }
        }
    }
}