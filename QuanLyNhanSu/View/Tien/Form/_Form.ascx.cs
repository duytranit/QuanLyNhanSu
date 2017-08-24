using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Tien.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _tienID;
        private Models.TienEntity _tienEntity = new Models.TienEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["tien"] != null)
            {
                this.UpdateStatus();
                _tienID = Convert.ToInt32(this.Page.RouteData.Values["tien"]);
                Models.Tien tien = _tienEntity.Find(_tienID);
                _kekhaiID = tien.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtNoiDung.Text = tien.TIENoiDung;
                    if (tien.TIESoLuong % 1 == 0)
                        txtSoLuong.Text = tien.TIESoLuong.ToString("###");
                    else
                        txtSoLuong.Text = tien.ToString();
                    txtTienTe.Text = tien.TIETienTe;
                }
            }else
            {
                this.CreateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                string tiente = txtTienTe.Text;
                _tienEntity.Insert(_kekhaiID, soluong, tiente, noidung);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string noidung = txtNoiDung.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                string tiente = txtTienTe.Text;
                _tienEntity.Update(_tienID, soluong, tiente, noidung);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _tienEntity.Delete(_tienID);
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
            Response.Redirect("~/KeKhai/" + _kekhaiID);
        }
    }
}