using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.PhongTangDanhHieu.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _danhhieuID;
        private Models.PhongTangDanhHieuEntity _danhhieuEntity = new Models.PhongTangDanhHieuEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["phongtangdanhhieu"] != null)
            {
                this.UpdateStatus();
                _danhhieuID = Convert.ToInt32(this.Page.RouteData.Values["phongtangdanhhieu"]);
                Models.PhongTangDanhHieu danhhieu = _danhhieuEntity.Find(_danhhieuID);
                _nhanvienID = danhhieu.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = danhhieu.PTDHTen;
                    txtHoiDong.Text = danhhieu.PTDHHoiDong;
                    if (danhhieu.PTDHNgay != DateTime.MinValue)
                        dpkNgayThang.SelectedDate = danhhieu.PTDHNgay;
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
                string danhhieu = txtTen.Text;
                string hoidong = txtHoiDong.Text;
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                _danhhieuEntity.Insert(_nhanvienID, danhhieu, ngaythang, hoidong);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string danhhieu = txtTen.Text;
                string hoidong = txtHoiDong.Text;
                DateTime ngaythang = Convert.ToDateTime(dpkNgayThang.SelectedDate);
                _danhhieuEntity.Update(_danhhieuID, danhhieu, ngaythang, hoidong);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _danhhieuEntity.Delete(_danhhieuID);
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