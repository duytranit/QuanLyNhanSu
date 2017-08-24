using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.TrinhDoTinHoc.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _tinhocID;
        private Models.TrinhDoTinHocEntity _tinhocEntity = new Models.TrinhDoTinHocEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["trinhdotinhoc"] != null)
            {
                this.UpdateStatus();
                _tinhocID = Convert.ToInt32(this.Page.RouteData.Values["trinhdotinhoc"]);
                Models.TrinhDoTinHoc tinhoc = _tinhocEntity.Find(_tinhocID);
                _nhanvienID = tinhoc.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = tinhoc.TDTHTen;
                    rblChungChi.SelectedValue = tinhoc.TDChungChi.ToString();
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
                string ten = txtTen.Text;
                bool chungchi = Convert.ToBoolean(rblChungChi.SelectedValue);
                _tinhocEntity.Insert(_nhanvienID, ten, chungchi);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                bool chungchi = Convert.ToBoolean(rblChungChi.SelectedValue);
                _tinhocEntity.Update(_tinhocID, ten, chungchi);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _tinhocEntity.Delete(_tinhocID);
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