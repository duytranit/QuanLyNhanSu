using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChucVu.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.ChucVuEntity _chucvuEntity = new Models.ChucVuEntity();
        private int _chucvuID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["chucvu"] != null)
            {
                this.UpdateStatus();
                _chucvuID = Convert.ToInt32(Page.RouteData.Values["chucvu"]);
                Models.ChucVu chucvu = _chucvuEntity.Find(_chucvuID);
                if (!IsPostBack)
                    RadTextBoxChucVuTen.Text = chucvu.CVTen;
            }
            else
                this.CreateStatus();
            
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = RadTextBoxChucVuTen.Text;
                _chucvuEntity.Insert(ten);
                Response.Redirect("~/ChucVu");
            }            
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = RadTextBoxChucVuTen.Text;
                _chucvuEntity.Update(_chucvuID, ten);
                Response.Redirect("~/ChucVu");
            }            
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _chucvuEntity.Delete(_chucvuID);
            Response.Redirect("~/ChucVu");
        }

        public void CreateStatus()
        {
            this.ButtonCreate.Visible = true;
            this.ButtonUpdate.Visible = false;
            this.ButtonDelete.Visible = false;
        }

        public void UpdateStatus()
        {
            this.ButtonCreate.Visible = false;
            this.ButtonUpdate.Visible = true;
            this.ButtonDelete.Visible = true;
        }
    }
}