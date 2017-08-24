using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KyLuat.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _kyluatID;
        private Models.KyLuatEntity _klEntity = new Models.KyLuatEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["kyluat"] != null)
            {
                this.UpdateStatus();
                _kyluatID = Convert.ToInt32(this.Page.RouteData.Values["kyluat"]);
                Models.KyLuat kyluat = _klEntity.Find(_kyluatID);
                _nhanvienID = kyluat.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtNoiDung.Text = kyluat.KLNoiDung;
                    txtCapQuyetDinh.Text = kyluat.KLCap;
                    dpkNgay.SelectedDate = kyluat.KLNgay;
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
                string hoidong = txtCapQuyetDinh.Text;
                DateTime ngay = Convert.ToDateTime(dpkNgay.SelectedDate);
                _klEntity.Insert(_nhanvienID, noidung, hoidong, ngay);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                string hoidong = txtCapQuyetDinh.Text;
                DateTime ngay = Convert.ToDateTime(dpkNgay.SelectedDate);
                _klEntity.Update(_kyluatID, noidung, hoidong, ngay);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _klEntity.Delete(_kyluatID);
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