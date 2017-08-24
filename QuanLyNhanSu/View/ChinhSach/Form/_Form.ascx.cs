using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChinhSach.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _chinhsachID;
        private Models.ChinhSachEntity _csEntity = new Models.ChinhSachEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["chinhsach"] != null)
            {
                this.UpdateStatus();
                _chinhsachID = Convert.ToInt32(this.Page.RouteData.Values["chinhsach"]);
                Models.ChinhSach chinhsach = _csEntity.Find(_chinhsachID);
                _nhanvienID = chinhsach.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtNoiDung.Text = chinhsach.CSTen;
                    dpkNgay.SelectedDate = chinhsach.CSNgay;
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
                DateTime ngay = Convert.ToDateTime(dpkNgay.SelectedDate);
                _csEntity.Insert(_nhanvienID, noidung, ngay);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                DateTime ngay = Convert.ToDateTime(dpkNgay.SelectedDate);
                _csEntity.Update(_chinhsachID, noidung, ngay);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _csEntity.Delete(_chinhsachID);
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