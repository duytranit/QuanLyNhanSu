using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ThuNhap.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _thunhapID;
        private Models.ThuNhapEntity _tnEntity = new Models.ThuNhapEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["thunhap"] != null)
            {
                this.UpdateStatus();
                _thunhapID = Convert.ToInt32(this.Page.RouteData.Values["thunhap"]);
                Models.ThuNhap thunhap = _tnEntity.Find(_thunhapID);
                _kekhaiID = thunhap.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = thunhap.TNTen;
                    if (thunhap.TNTien % 1 == 0)
                        txtTien.Text = thunhap.TNTien.ToString("###");
                    else
                        txtTien.Text = thunhap.TNTien.ToString();
                }
            } else
            {
                this.CreateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                decimal tien = Convert.ToDecimal(txtTien.Text);
                _tnEntity.Insert(_kekhaiID, ten, tien);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                decimal tien = Convert.ToDecimal(txtTien.Text);
                _tnEntity.Update(_thunhapID, ten, tien);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _tnEntity.Delete(_thunhapID);
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