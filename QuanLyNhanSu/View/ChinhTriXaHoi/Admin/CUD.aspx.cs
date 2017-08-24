using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChinhTriXaHoi.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null || account.ACCChucNang > 1)
                    Response.Redirect("~/");
                else if (this.Page.RouteData.Values["ctxh"] != null)
                {
                    try
                    {
                        int ctxhID = Convert.ToInt32(this.Page.RouteData.Values["ctxh"]);
                        Models.ChinhTriXaHoiEntity ctxhEntity = new Models.ChinhTriXaHoiEntity();
                        Models.ChinhTriXaHois ctxh = ctxhEntity.Find(ctxhID);
                        if (ctxh == null)
                            Response.Redirect("~/");
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/");
                    }
                }
            }
            else
                Response.Redirect("~/");
        }
    }
}