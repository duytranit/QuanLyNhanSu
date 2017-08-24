using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChinhTriXaHoi.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.ChinhTriXaHoiEntity _ctxhEntity = new Models.ChinhTriXaHoiEntity();
        private int _ctxhID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["ctxh"] == null)
                this.CreateStatus();
            else
            {
                this.UpdateStatus();
                _ctxhID = Convert.ToInt32(this.Page.RouteData.Values["ctxh"]);
                if (!IsPostBack)
                {
                    Models.ChinhTriXaHois ctxh = _ctxhEntity.Find(_ctxhID);
                    txtTen.Text = ctxh.CTXHTen;
                    txtSDT.Text = ctxh.CTXHDienThoai;
                    txtFax.Text = ctxh.CTXHFax;
                    txtEmail.Text = ctxh.CTXHEmail;
                    txtWebsite.Text = ctxh.CTXHWebsite;
                    txtDiaChi.Text = ctxh.CTXHDiaChi;
                    txtGioiThieu.Text = ctxh.CTXHGioiThieu;
                }                

            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                string sdt = txtSDT.Text;
                string fax = txtFax.Text;
                string email = txtEmail.Text;
                string website = txtWebsite.Text;
                string diachi = txtDiaChi.Text;
                string gioithieu = txtGioiThieu.Text;
                _ctxhEntity.Insert(ten, diachi, sdt, fax, email, website, gioithieu);
                Response.Redirect("~/CTXH");
            }            
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                string sdt = txtSDT.Text;
                string fax = txtFax.Text;
                string email = txtEmail.Text;
                string website = txtWebsite.Text;
                string diachi = txtDiaChi.Text;
                string gioithieu = txtGioiThieu.Text;
                _ctxhEntity.Update(_ctxhID, ten, diachi, sdt, fax, email, website, gioithieu);
                Response.Redirect("~/CTXH");
            }            
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _ctxhEntity.Delete(_ctxhID);
        }

        private void CreateStatus()
        {
            this.btCreate.Visible = true;
            this.btUpdate.Visible = false;
            this.btDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            this.btCreate.Visible = false;
            this.btUpdate.Visible = true;
            this.btDelete.Visible = true;
        }
    }
}