using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Account.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.AccountEntity accEntity = new Models.AccountEntity();
            if (Session["account"] != null)
            {
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null || account.ACCChucNang > 0)
                    this.RedirectToIndex();
                else if (this.Page.RouteData.Values["account"] != null)
                    try
                    {
                        int accountID = Convert.ToInt32(this.Page.RouteData.Values["account"]);
                        account = accEntity.Find(accountID);
                        if (account == null || account.ACCChucNang == 0)
                            this.RedirectToIndex();
                    }
                    catch
                    {
                        this.RedirectToIndex();
                    }
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