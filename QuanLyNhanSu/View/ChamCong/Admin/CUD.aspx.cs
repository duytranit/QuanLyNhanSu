using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            Models.Account loginACC = accEntity.FindByEmail(email);

            if (loginACC.ACCChucNang > 0 && loginACC.PhuTrachChamCongs.Where(x => x.PCCCStatus == true).Count() == 0)
                RedirectToHomePage();
            else if (this.Page.RouteData.Values["lamviec"] != null && this.Page.RouteData.Values["ngaythang"] != null)
                try
                {
                    int lamviecID = Convert.ToInt32(this.Page.RouteData.Values["lamviec"]);
                    DateTime ngaythang = Convert.ToDateTime(this.Page.RouteData.Values["ngaythang"]);

                    Models.LamViecEntity lvEntiy = new Models.LamViecEntity();
                    Models.LamViec lamviec = lvEntiy.Find(lamviecID);

                    if (lamviec != null)
                    {
                        CCForm.LamViec = lamviec;
                        CCForm.NgayChamCong = ngaythang;
                    }
                    else
                    {
                        this.RedirectToHomePage();
                    }

                }
                catch
                {
                    this.RedirectToHomePage();
                }
            else
                this.RedirectToHomePage();


        }

        private void RedirectToHomePage()
        {
            Response.Redirect("~/");
        }
    }
}