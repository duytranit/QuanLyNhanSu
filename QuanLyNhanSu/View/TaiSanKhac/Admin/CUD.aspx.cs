using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.TaiSanKhac.Admin
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
                    if (!account.ACCUpKeKhai)
                        this.RedirectToIndex();
                    else if (this.Page.RouteData.Values["taisan"] != null)
                        try
                        {
                            int taisanID = Convert.ToInt32(this.Page.RouteData.Values["taisan"]);
                            Models.TaiSanKhacEntity tsEntity = new Models.TaiSanKhacEntity();
                            Models.TaiSanKhac taisan = tsEntity.Find(taisanID);
                            if (taisan == null)
                                this.RedirectToIndex();
                            else if (taisan.KeKhai.NVID != account.NVID)
                                this.RedirectToIndex();
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else if (this.Page.RouteData.Values["kekhai"] != null)
                        try
                        {
                            int kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                            Models.KeKhaiEntity kkEntity = new Models.KeKhaiEntity();
                            Models.KeKhai kekhai = kkEntity.Find(kekhaiID);
                            if (kekhai == null)
                                this.RedirectToIndex();
                            else if (kekhai.NVID != account.NVID)
                                this.RedirectToIndex();
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else
                        this.RedirectToIndex();
                else if (this.Page.RouteData.Values["taisan"] != null)
                    try
                    {
                        int taisanID = Convert.ToInt32(this.Page.RouteData.Values["taisan"]);
                        Models.TaiSanKhacEntity tsEntity = new Models.TaiSanKhacEntity();
                        Models.TaiSanKhac taisan = tsEntity.Find(taisanID);
                        if (taisan == null)
                            this.RedirectToIndex();
                    }
                    catch
                    {
                        this.RedirectToIndex();
                    }
                else if (this.Page.RouteData.Values["kekhai"] != null)
                    try
                    {
                        int kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                        Models.KeKhaiEntity kkEntity = new Models.KeKhaiEntity();
                        Models.KeKhai kekhai = kkEntity.Find(kekhaiID);
                        if (kekhai == null)
                            this.RedirectToIndex();
                    }
                    catch
                    {
                        this.RedirectToIndex();
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