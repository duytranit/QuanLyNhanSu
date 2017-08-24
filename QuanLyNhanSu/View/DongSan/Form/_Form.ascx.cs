using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DongSan.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _dongsanID;
        private Models.DongSanEntity _dsEntity = new Models.DongSanEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["dongsan"] != null)
            {
                this.UpdateStatus();
                _dongsanID = Convert.ToInt32(this.Page.RouteData.Values["dongsan"]);
                Models.DongSan dongsan = _dsEntity.Find(_dongsanID);
                _kekhaiID = dongsan.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = dongsan.DSTen;
                    txtSoLuong.Text = dongsan.DSSoLuong.ToString();
                    if (dongsan.DSGiaTri % 1 == 0)
                        txtGiaTri.Text = dongsan.DSGiaTri.ToString("###");
                    else
                        txtGiaTri.Text = dongsan.DSGiaTri.ToString();
                }
            }else
            {
                this.CreateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack)
            {
                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _dsEntity.Insert(_kekhaiID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack)
            {
                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _dsEntity.Update(_dongsanID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _dsEntity.Delete(_dongsanID);
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