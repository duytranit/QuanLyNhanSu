using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DonVi.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.DonViEntity _donviEntity = new Models.DonViEntity();
        private int _currentDVID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                _donviEntity.Load_DataSource_RadDropDownTree(ddtTrucThuoc);

            if (this.Page.RouteData.Values["donvi"] == null)
                this.CreateStatus();
            else
            {
                this.UpdateStatus();
                _currentDVID = Convert.ToInt32(this.Page.RouteData.Values["donvi"]);
                if (!IsPostBack)
                {
                    Models.DonVi currentDV = _donviEntity.Find_DonVi(_currentDVID);
                    txtTen.Text = currentDV.DVTen;
                    txtBienChe.Text = currentDV.DVBienChe.ToString();
                    txtChucNang.Text = currentDV.DVNoiDung;
                    rblTrangThai.SelectedValue = currentDV.DVTrangThai.ToString();
                    ddtTrucThuoc.SelectedValue = currentDV.DVTrucThuocID.ToString();
                    txtSDT.Text = currentDV.DVSDT;
                    txtDiaChi.Text = currentDV.DVDiaChi;
                }

            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                string noidung = txtChucNang.Text;
                bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                int bienche = Convert.ToInt32(txtBienChe.Text);
                string sdt = txtSDT.Text;
                string diachi = txtDiaChi.Text;
                int tructhuocID = 0;
                if (!ddtTrucThuoc.SelectedValue.Equals(""))
                    tructhuocID = Convert.ToInt32(ddtTrucThuoc.SelectedValue);
                _donviEntity.Insert(ten, noidung, bienche, trangthai, tructhuocID, sdt, diachi);
                Response.Redirect("~/DonVi");
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                string noidung = txtChucNang.Text;
                bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                int bienche = Convert.ToInt32(txtBienChe.Text);
                int tructhuocID = 0;
                if (!ddtTrucThuoc.SelectedValue.Equals(""))
                    tructhuocID = Convert.ToInt32(ddtTrucThuoc.SelectedValue);
                string sdt = txtSDT.Text;
                string diachi = txtDiaChi.Text;
                _donviEntity.Update(_currentDVID, ten, noidung, bienche, trangthai, tructhuocID, sdt, diachi);
                Response.Redirect("~/DonVi");
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _donviEntity.Delete(_currentDVID);
            Response.Redirect("~/DonVi");
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
    }
}