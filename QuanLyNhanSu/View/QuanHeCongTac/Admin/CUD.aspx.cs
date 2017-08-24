using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuanHeCongTac.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                string email = Session["account"].ToString();
                Models.AccountEntity accEntity = new Models.AccountEntity();
                Models.Account account = accEntity.FindByEmail(email);

                if (account == null)
                    this.RedirectToIndex();
                else if (account.ACCChucNang > 1)
                    if (!account.ACCUpLyLich)
                        this.RedirectToIndex();
                    else if (this.Page.RouteData.Values["quanhecongtac"] != null)
                        try
                        {
                            int congtacID = Convert.ToInt32(this.Page.RouteData.Values["quanhecongtac"]);
                            Models.QuanHeCongTacEntity congtacEntity = new Models.QuanHeCongTacEntity();
                            Models.QuanHeCongTac congtac = congtacEntity.Find(congtacID);
                            if (congtac == null)
                                this.RedirectToIndex();
                            else if (congtac.QuanHe.NVID != account.NVID)
                                this.RedirectToIndex();
                            else
                                lblNhanVien.Text = congtac.QuanHe.QHTen;
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else if (this.Page.RouteData.Values["quanhe"] != null)
                        try
                        {
                            int quanheID = Convert.ToInt32(this.Page.RouteData.Values["quanhe"]);
                            Models.QuanHeEntity quanheEntity = new Models.QuanHeEntity();
                            Models.QuanHe quanhe = quanheEntity.Find(quanheID);
                            if (quanhe == null)
                                this.RedirectToIndex();
                            else if (quanhe.NVID != account.NVID)
                                this.RedirectToIndex();
                            else
                                lblNhanVien.Text = quanhe.QHTen;
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else
                        this.RedirectToIndex();
                else if (this.Page.RouteData.Values["quanhecongtac"] != null)
                    try
                    {
                        int congtacID = Convert.ToInt32(this.Page.RouteData.Values["quanhecongtac"]);
                        Models.QuanHeCongTacEntity congtacEntity = new Models.QuanHeCongTacEntity();
                        Models.QuanHeCongTac congtac = congtacEntity.Find(congtacID);
                        if (congtac == null)
                            this.RedirectToIndex();
                        else
                            lblNhanVien.Text = congtac.QuanHe.QHTen;
                    }
                    catch (Exception)
                    {
                        this.RedirectToIndex();
                    }
                else if (this.Page.RouteData.Values["quanhe"] != null)
                {
                    try
                    {
                        int quanheID = Convert.ToInt32(this.Page.RouteData.Values["quanhe"]);
                        Models.QuanHeEntity quanheEntity = new Models.QuanHeEntity();
                        Models.QuanHe quanhe = quanheEntity.Find(quanheID);
                        if (quanhe == null)
                            this.RedirectToIndex();
                        else
                            lblNhanVien.Text = quanhe.QHTen;
                    }
                    catch (Exception) { }
                }
                else
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