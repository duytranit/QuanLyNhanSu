using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuanHe.Admin
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

                if (account == null)
                    this.RedirectToIndex();
                else if (account.ACCChucNang > 1)
                    if (!account.ACCUpLyLich)
                        this.RedirectToIndex();
                    else if (this.Page.RouteData.Values["quanhe"] != null)
                        try
                        {
                            int quanheID = Convert.ToInt32(this.Page.RouteData.Values["quanhe"]);
                            Models.QuanHeEntity qhEntity = new Models.QuanHeEntity();
                            Models.QuanHe quanhe = qhEntity.Find(quanheID);
                            if (quanhe == null)
                                this.RedirectToIndex();
                            else if (quanhe.NVID != account.NVID)
                                this.RedirectToIndex();
                            else
                                pnlExtraInformation.Visible = true;
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else if (this.Page.RouteData.Values["nhanvien"] != null)
                        try
                        {
                            int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                            if (nhanvienID != account.NVID)
                                this.RedirectToIndex();
                            else
                            {
                                Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                                Models.NhanVien nhanvien = nvEntity.Find_NhanVien(nhanvienID);
                                if (nhanvien == null)
                                    this.RedirectToIndex();
                            }
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else
                        this.RedirectToIndex();
                else if (this.Page.RouteData.Values["quanhe"] != null)
                    try
                    {
                        int quanheID = Convert.ToInt32(this.Page.RouteData.Values["quanhe"]);
                        Models.QuanHeEntity qhEntity = new Models.QuanHeEntity();
                        Models.QuanHe quanhe = qhEntity.Find(quanheID);
                        if (quanhe == null)
                            this.RedirectToIndex();
                        else
                            pnlExtraInformation.Visible = true;
                    }
                    catch
                    {
                        this.RedirectToIndex();
                    }
                else if (this.Page.RouteData.Values["nhanvien"] != null)
                    try
                    {
                        int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                        Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                        Models.NhanVien nhanvien = nvEntity.Find_NhanVien(nhanvienID);
                        if (nhanvien == null)
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
            {
                this.RedirectToIndex();
            }
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/");
        }

        protected void btCongTacNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/QuanHe/" + this.Page.RouteData.Values["quanhe"] + "/CongTac");
        }
    }
}