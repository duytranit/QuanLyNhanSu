using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.GiaiTrinh.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _giaitrinhID;
        private Models.GiaiTrinhEntity _gtEntity = new Models.GiaiTrinhEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                Models.LoaiGiaiTrinhEntity lgtEntity = new Models.LoaiGiaiTrinhEntity();
                lgtEntity.Load_DataSource_RadComboBox(cbbLoaiGiaiTrinh);
            }

            if (this.Page.RouteData.Values["giaitrinh"] != null)
            {
                this.UpdateStatus();
                _giaitrinhID = Convert.ToInt32(this.Page.RouteData.Values["giaitrinh"]);
                Models.GiaiTrinh giaitrinh = _gtEntity.Find(_giaitrinhID);
                _kekhaiID = giaitrinh.KKID;
                if (!this.Page.IsPostBack)
                {
                    cbbLoaiGiaiTrinh.SelectedValue = giaitrinh.LGTID.ToString();
                    rblTang.SelectedValue = giaitrinh.GTIsTang.ToString();
                    if (giaitrinh.GTSoLuong % 1 == 0)
                        txtSoLuong.Text = giaitrinh.GTSoLuong.ToString("###");
                    else
                        txtSoLuong.Text = giaitrinh.GTSoLuong.ToString();
                    txtNoiDung.Text = giaitrinh.GTNoiDung;
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
                int lgtID = Convert.ToInt32(cbbLoaiGiaiTrinh.SelectedValue);
                bool tang = Convert.ToBoolean(rblTang.SelectedValue);
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                string noidung = txtNoiDung.Text;
                _gtEntity.Insert(_kekhaiID, lgtID, soluong, tang, noidung);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int lgtID = Convert.ToInt32(cbbLoaiGiaiTrinh.SelectedValue);
                bool tang = Convert.ToBoolean(rblTang.SelectedValue);
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                string noidung = txtNoiDung.Text;
                _gtEntity.Update(_giaitrinhID, lgtID, soluong, tang, noidung);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _gtEntity.Delete(_giaitrinhID);
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