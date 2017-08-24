using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DonVi.Admin
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
                else if (this.Page.RouteData.Values["donvi"] != null)
                {
                    try
                    {
                        int donviID = Convert.ToInt32(this.Page.RouteData.Values["donvi"]);
                        Models.DonViEntity donviEntity = new Models.DonViEntity();
                        Models.DonVi donvi = donviEntity.Find_DonVi(donviID);
                        if (donvi == null)
                            Response.Redirect("~/DonVi");
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/DonVi");
                    }
                }
            }
            else
                Response.Redirect("~/");
        }
    }
}