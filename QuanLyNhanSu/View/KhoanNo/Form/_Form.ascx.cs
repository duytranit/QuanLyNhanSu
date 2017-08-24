using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KhoanNo.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _khoannoID;
        private Models.KhoanNoEntity _knEntity = new Models.KhoanNoEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["khoanno"] != null)
            {
                this.UpdateStatus();
                _khoannoID = Convert.ToInt32(this.Page.RouteData.Values["khoanno"]);
                Models.KhoanNo khoanno = _knEntity.Find(_khoannoID);
                _kekhaiID = khoanno.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = khoanno.KNTen;
                    txtSoLuong.Text = khoanno.KNSoLuong.ToString();
                    if (khoanno.KNGiaTri % 1 == 0)
                        txtGiaTri.Text = khoanno.KNGiaTri.ToString("###");
                    else
                        txtGiaTri.Text = khoanno.KNGiaTri.ToString();
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

                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _knEntity.Insert(_kekhaiID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {

                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _knEntity.Update(_khoannoID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _knEntity.Delete(_khoannoID);
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