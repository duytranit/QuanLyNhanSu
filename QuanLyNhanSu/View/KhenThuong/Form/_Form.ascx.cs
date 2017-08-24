using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KhenThuong.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _khenthuongID;
        private Models.KhenThuongEntity _ktEntity = new Models.KhenThuongEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["khenthuong"] != null)
            {
                this.UpdateStatus();
                _khenthuongID = Convert.ToInt32(this.Page.RouteData.Values["khenthuong"]);
                Models.KhenThuong khenthuong = _ktEntity.Find(_khenthuongID);
                _nhanvienID = khenthuong.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtNoiDung.Text = khenthuong.KTNoiDung;
                    txtCapQuyetDinh.Text = khenthuong.KTCapQuyetDinh;
                    dpkNgay.SelectedDate = khenthuong.KTNgay;
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
                string noidung = txtNoiDung.Text;
                string capquyetdinh = txtCapQuyetDinh.Text;
                DateTime ngaythang = Convert.ToDateTime(dpkNgay.SelectedDate);
                _ktEntity.Insert(_nhanvienID, noidung, capquyetdinh, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                string capquyetdinh = txtCapQuyetDinh.Text;
                DateTime ngaythang = Convert.ToDateTime(dpkNgay.SelectedDate);
                _ktEntity.Update(_khenthuongID, noidung, capquyetdinh, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _ktEntity.Delete(_khenthuongID);
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