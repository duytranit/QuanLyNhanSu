using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.TrinhDoNgoaiNgu.Admin
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
                    this.RedirectToIndex();
                else if (this.Page.RouteData.Values["trinhdongoaingu"] != null)
                    try
                    {
                        int ngoainguID = Convert.ToInt32(this.Page.RouteData.Values["trinhdongoaingu"]);
                        Models.TrinhDoNgoaiNguEntity nnEntity = new Models.TrinhDoNgoaiNguEntity();
                        Models.TrinhDoNgoaiNgu ngoaingu = nnEntity.Find(ngoainguID);
                        if (ngoaingu == null)
                            this.RedirectToIndex();
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
                this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/");
        }
    }
}