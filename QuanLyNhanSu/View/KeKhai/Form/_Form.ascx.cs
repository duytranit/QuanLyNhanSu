using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KeKhai.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _kekhaiID;
        private Models.KeKhaiEntity _kkEntity = new Models.KeKhaiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["kekhai"] != null)
            {
                this.UpdateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                Models.KeKhai kekhai = _kkEntity.Find(_kekhaiID);
                _nhanvienID = kekhai.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtNam.Text = kekhai.KKNam.ToString();
                    dpkNgayKeKhai.SelectedDate = kekhai.KKNgayKeKhai;
                    dpkNgayNhap.SelectedDate = kekhai.KKNgayNhap;
                    txtChucVu.Text = kekhai.KKChucVu;
                    txtCoQuan.Text = kekhai.KKCoQuan;
                    txtHoKhau.Text = kekhai.KKHoKhau;
                    txtChoO.Text = kekhai.KKChoO;
                    txtVoChong.Text = kekhai.KKVoChong;
                    dpkVCDOB.SelectedDate = kekhai.KKVCDOB;
                    txtVCChucVu.Text = kekhai.KKVCChucVu;
                    txtVCCoQuan.Text = kekhai.KKVCCoQuan;
                    txtVCHoKhau.Text = kekhai.KKVCHoKhau;
                    txtVCChoO.Text = kekhai.KKVCChoO;
                }
            }else
            {
                this.CreateStatus();
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int nam = Convert.ToInt32(txtNam.Text);
                DateTime ngaykekhai = Convert.ToDateTime(dpkNgayKeKhai.SelectedDate);
                DateTime ngaynhap = Convert.ToDateTime(dpkNgayNhap.SelectedDate);
                string chucvu = txtChucVu.Text;
                string coquan = txtCoQuan.Text;
                string hokhau = txtHoKhau.Text;
                string choo = txtChoO.Text;
                string vochong = txtVoChong.Text;
                DateTime vcDOB = Convert.ToDateTime(dpkVCDOB.SelectedDate);
                string vcChucVu = txtVCChucVu.Text;
                string vcCoQuan = txtVCCoQuan.Text;
                string vcHoKhau = txtVCHoKhau.Text;
                string vcChoO = txtVCChoO.Text;
                _kkEntity.Insert(_nhanvienID, nam, ngaykekhai, ngaynhap, chucvu, coquan, hokhau, choo,
                    vochong, vcDOB, vcChucVu, vcCoQuan, vcHoKhau, vcChoO);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int nam = Convert.ToInt32(txtNam.Text);
                DateTime ngaykekhai = Convert.ToDateTime(dpkNgayKeKhai.SelectedDate);
                DateTime ngaynhap = Convert.ToDateTime(dpkNgayNhap.SelectedDate);
                string chucvu = txtChucVu.Text;
                string coquan = txtCoQuan.Text;
                string hokhau = txtHoKhau.Text;
                string choo = txtChoO.Text;
                string vochong = txtVoChong.Text;
                DateTime vcDOB = Convert.ToDateTime(dpkVCDOB.SelectedDate);
                string vcChucVu = txtVCChucVu.Text;
                string vcCoQuan = txtVCCoQuan.Text;
                string vcHoKhau = txtVCHoKhau.Text;
                string vcChoO = txtVCChoO.Text;
                _kkEntity.Update(_kekhaiID, nam, ngaykekhai, ngaynhap, chucvu, coquan, hokhau, choo,
                    vochong, vcDOB, vcChucVu, vcCoQuan, vcHoKhau, vcChoO);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _kkEntity.Delete(_kekhaiID);
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