using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KeKhaiCon.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _concaiID;
        private Models.KeKhaiConEntity _ccEntity = new Models.KeKhaiConEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["concai"] != null)
            {
                this.UpdateStatus();
                _concaiID = Convert.ToInt32(this.Page.RouteData.Values["concai"]);
                Models.KeKhaiCon concai = _ccEntity.Find(_kekhaiID);
                _kekhaiID = concai.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = concai.KKCTen;
                    txtChoO.Text = concai.KKCChoO;
                    txtHoKhau.Text = concai.KKCHoKhau;
                    dpkDOB.SelectedDate = concai.KKCDOB;
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
                string hokhau = txtHoKhau.Text;
                string choo = txtChoO.Text;
                DateTime dob = Convert.ToDateTime(dpkDOB.SelectedDate);
                _ccEntity.Insert(_kekhaiID, ten, dob, hokhau, choo);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                string hokhau = txtHoKhau.Text;
                string choo = txtChoO.Text;
                DateTime dob = Convert.ToDateTime(dpkDOB.SelectedDate);
                _ccEntity.Update(_concaiID, ten, dob, hokhau, choo);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _ccEntity.Delete(_kekhaiID);
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