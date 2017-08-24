using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DaQui.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _daquiID;
        private Models.DaQuiEntity _dqEntity = new Models.DaQuiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["daqui"] != null)
            {
                this.UpdateStatus();
                _daquiID = Convert.ToInt32(this.Page.RouteData.Values["daqui"]);
                Models.DaQui daqui = _dqEntity.Find(_daquiID);
                _kekhaiID = daqui.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = daqui.DQTen;
                    txtSoLuong.Text = daqui.DQSoLuong.ToString();
                    if (daqui.DQGiaTri % 1 == 0)
                        txtGiaTri.Text = daqui.DQGiaTri.ToString("###");
                    else
                        txtGiaTri.Text = daqui.DQGiaTri.ToString();
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
                _dqEntity.Insert(_kekhaiID, ten, soluong, giatri);
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
                _dqEntity.Update(_daquiID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _dqEntity.Delete(_daquiID);
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