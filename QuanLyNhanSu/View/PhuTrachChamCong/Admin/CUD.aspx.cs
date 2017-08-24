using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.PhuTrachChamCong.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["phutrach"] != null)
                try
                {
                    int phutrachID = Convert.ToInt32(this.Page.RouteData.Values["phutrach"]);
                    Models.PhuTrachChamCongEntity ptccEntity = new Models.PhuTrachChamCongEntity();
                    Models.PhuTrachChamCong phutrach = ptccEntity.Find(phutrachID);
                    if (phutrach == null)
                        this.RedirectToHomePage();
                    else
                        PTCCForm.PhuTrachChamCong = phutrach;
                }catch
                {
                    this.RedirectToHomePage();
                }
        }

        private void RedirectToHomePage()
        {
            Response.Redirect("~/");
        }
    }
}