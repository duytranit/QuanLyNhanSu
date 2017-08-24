using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.HeSoLuong.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _hesoluongID;
        private Models.HeSoLuongEntity _hesoEntity = new Models.HeSoLuongEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Models.NgachEntity ngachEntity = new Models.NgachEntity();
                ngachEntity.Load_DataSource_DropDownList(DropDownListNgach);

                Models.BacLuongEntity bacluongEntity = new Models.BacLuongEntity();
                bacluongEntity.Load_DataSource_DropDownList(DropDownListBac);
            }

            if (this.Page.RouteData.Values["hesoluong"] != null)
            {
                this.UpdateStatus();
                _hesoluongID = Convert.ToInt32(Page.RouteData.Values["hesoluong"]);
                Models.HeSoLuong hesoluong = _hesoEntity.Find(_hesoluongID);

                if (!IsPostBack)
                {
                    DropDownListNgach.SelectedValue = hesoluong.NGID.ToString();
                    DropDownListBac.SelectedValue = hesoluong.BLID.ToString();
                    RadTextBoxHeSoLuong.Text = hesoluong.HSLHeSo.ToString();
                }
            }
            else
                this.CreateStatus();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int ngachID = Convert.ToInt32(DropDownListNgach.SelectedValue);
            int bacID = Convert.ToInt32(DropDownListBac.SelectedValue);
            decimal hsl = Convert.ToDecimal(RadTextBoxHeSoLuong.Text);
            _hesoEntity.Update(_hesoluongID, bacID, ngachID, hsl);
            Response.Redirect("~/HeSoLuong");
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _hesoEntity.Delete(_hesoluongID);
            Response.Redirect("~/HeSoLuong");
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            int ngachID = Convert.ToInt32(DropDownListNgach.SelectedValue);
            int bacID = Convert.ToInt32(DropDownListBac.SelectedValue);
            decimal hsl = Convert.ToDecimal(RadTextBoxHeSoLuong.Text);
            _hesoEntity.Insert(bacID, ngachID, hsl);
            Response.Redirect("~/HeSoLuong");
        }

        private void CreateStatus()
        {
            ButtonCreate.Visible = true;
            ButtonUpdate.Visible = false;
            ButtonDelete.Visible = false;
        }

        public void UpdateStatus()
        {
            ButtonCreate.Visible = false;
            ButtonUpdate.Visible = true;
            ButtonDelete.Visible = true;
        }
    }
}