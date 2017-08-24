using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChucVu.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["chucvu"] != null)
            {
                try
                {
                    int chucvuID = Convert.ToInt32(this.Page.RouteData.Values["chucvu"]);
                    Models.ChucVuEntity chucvuEntity = new Models.ChucVuEntity();
                    Models.ChucVu chucvu = chucvuEntity.Find(chucvuID);
                    if (chucvu == null)
                        Response.Redirect("~/ChucVu");
                }
                catch (Exception)
                {
                    Response.Redirect("~/ChucVu");
                }
            }
        }
    }
}