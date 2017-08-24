using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.TrinhDoNgoaiNgu.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _nhanvienID;
        private int _ngoainguID;
        private Models.TrinhDoNgoaiNguEntity _nnEntity = new Models.TrinhDoNgoaiNguEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["trinhdongoaingu"] != null)
            {
                this.UpdateStatus();
                _ngoainguID = Convert.ToInt32(this.Page.RouteData.Values["trinhdongoaingu"]);
                Models.TrinhDoNgoaiNgu ngoaingu = _nnEntity.Find(_ngoainguID);
                _nhanvienID = ngoaingu.NVID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = ngoaingu.TDNNTen;
                    rblChungChi.SelectedValue = ngoaingu.TDNNChungChi.ToString();
                    rblTiengDanToc.SelectedValue = ngoaingu.TDNNTiengDanToc.ToString();
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
                bool tiengdantoc = Convert.ToBoolean(rblTiengDanToc.SelectedValue);
                _nnEntity.Insert(_nhanvienID, ten, chungchi, tiengdantoc);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                bool chungchi = Convert.ToBoolean(rblChungChi.SelectedValue);
                bool tiengdantoc = Convert.ToBoolean(rblTiengDanToc.SelectedValue);
                _nnEntity.Update(_ngoainguID, ten, chungchi, tiengdantoc);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _nnEntity.Delete(_ngoainguID);
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