using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Account.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.AccountEntity accEntity = new Models.AccountEntity();
            if (Session["account"] != null)
            {
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null || account.ACCChucNang > 0)
                    Response.Redirect("~/");
            }
            else
                Response.Redirect("~/");
        }
    }
}