using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.HeSoLuong.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["hesoluong"] != null)
                try
                {
                    int hesoID = Convert.ToInt32(this.Page.RouteData.Values["hesoluong"]);
                    Models.HeSoLuongEntity hsEntity = new Models.HeSoLuongEntity();
                    Models.HeSoLuong heso = hsEntity.Find(hesoID);
                    if (heso == null)
                        Response.Redirect("~/HeSoLuong");
                }
                catch (Exception)
                {
                    Response.Redirect("~/HeSoLuong");
                }
        }
    }
}