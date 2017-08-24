using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cldHomNay.SelectedDate = DateTime.Now;
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            Models.AccountEntity accEntity = new Models.AccountEntity();
            Models.Account account = accEntity.Login(email, password);
            if (account == null)
            {
                Helper.PageHelper pageHelper = new Helper.PageHelper();
                pageHelper.AlertMessage(this.Page, "Thông tin tài khoản không đúng !...");
            }
            else
            {
                Session["account"] = account.ACCEmail;
                Response.Redirect("~/CapNhatTaiKhoan");
            }
        }
    }
}