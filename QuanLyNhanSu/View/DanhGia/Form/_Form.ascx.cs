using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGia.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _danhgiaID;
        private Models.DanhGiaEntity _dgEntity = new Models.DanhGiaEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["danhgia"] != null)
            {
                this.UpdateStatus();
                _danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                Models.DanhGia danhgia = _dgEntity.Find(_danhgiaID);
                _nhanvienID = danhgia.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtNoiDung.Text = danhgia.DGNoiDung;
                    dpkNgay.SelectedDate = danhgia.DGNgay;
                }
            }
            else
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
                DateTime ngaythang = Convert.ToDateTime(dpkNgay.SelectedDate);
                _dgEntity.Insert(_nhanvienID, noidung, ngaythang);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                DateTime ngaythang = Convert.ToDateTime(dpkNgay.SelectedDate);
                _dgEntity.Update(_danhgiaID, noidung, ngaythang);
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
    }
}