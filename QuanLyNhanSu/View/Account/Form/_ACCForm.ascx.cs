using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Account.Form
{
    public partial class _ACCForm : System.Web.UI.UserControl
    {
        private Models.AccountEntity _accEntity = new Models.AccountEntity();
        private string _email;
        protected void Page_Load(object sender, EventArgs e)
        {
            _email = Session["account"].ToString();
            txtEmail.Text = _email;
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            if (password.Equals(""))
            {
                pageHelper.AlertMessage(this.Page, "Nhập mật khẩu !...");
            }else
            {
                _accEntity.UpdateOwnAccount(_email, password);
                pageHelper.AlertMessage(this.Page, "Đã cập nhật thành công");
            }            
        }
    }
}