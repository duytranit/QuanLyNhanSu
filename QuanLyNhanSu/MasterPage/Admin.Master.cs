using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.MasterPage
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
                try
                {
                    string email = Session["account"].ToString();
                    Models.AccountEntity accEntity = new Models.AccountEntity();
                    Models.Account account = accEntity.FindByEmail(email);
                    if (account == null)
                        this.RedirectToIndex();
                    else
                    {
                        btLoginAccount.Text = "Xin chào " + email + " !...";
                        if (account.ACCChucNang < 1)
                        {
                            btNhanSu.Visible = true;
                            btLuong.Visible = true;
                            btTaiKhoan.Visible = true;
                        } else
                            btChamCong.Visible = (account.PhuTrachChamCongs.Where(x => x.PCCCStatus == true).Count() > 0 ? true : false);
                    }                        
                }
                catch
                {
                    this.RedirectToIndex();
                }
            else
                this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/");
        }
    }
}