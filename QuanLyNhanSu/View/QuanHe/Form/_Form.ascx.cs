using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuanHe.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.QuanHeEntity _quanheEntity = new Models.QuanHeEntity();
        private int _nhanvienID;
        private int _quanheID;
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.LoaiQuanHeEntity loaiquanheEntity = new Models.LoaiQuanHeEntity();
            if (!IsPostBack)
            {
                RadDatePickerNgaySinh.SelectedDate = DateTime.Now.AddYears(-18);
                loaiquanheEntity.Load_AllLoaiQuanHe_ToRadComboBox(cbbQuanHe);
            }

            if (this.Page.RouteData.Values["quanhe"] != null)
            {
                this.UpdateStatus();
                _quanheID = Convert.ToInt32(Page.RouteData.Values["quanhe"]);
                Models.QuanHe quanhe = _quanheEntity.Find(_quanheID);
                _nhanvienID = quanhe.NVID;
                if (!IsPostBack)
                {
                    RadioButtonListBenVo.SelectedValue = quanhe.QHBenVo.ToString();
                    RadTextBoxTen.Text = quanhe.QHTen;
                    RadDatePickerNgaySinh.SelectedDate = Convert.ToDateTime(quanhe.QHNgaySinh);
                    RadTextBoxHoKhau.Text = quanhe.QHHoKhau;
                    RadTextBoxNoiO.Text = quanhe.QHNoiO;
                    cbbQuanHe.SelectedValue = quanhe.LQHID.ToString();
                    RadioButtonListGioiTinh.SelectedValue = quanhe.QHGioiTinh.ToString();
                }
            }
            else
            {
                this.CreateStatus();
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
            }

            
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            int nhanvienID = Convert.ToInt32(Page.RouteData.Values["nhanvien"]);
            string ten = RadTextBoxTen.Text;
            DateTime ngaysinh = Convert.ToDateTime(RadDatePickerNgaySinh.SelectedDate);
            string noio = RadTextBoxNoiO.Text;
            int loaiquanheID = Convert.ToInt32(cbbQuanHe.SelectedValue);
            bool benvo = Convert.ToBoolean(RadioButtonListBenVo.SelectedValue);
            string hokhau = RadTextBoxHoKhau.Text;
            bool gioitinh = Convert.ToBoolean(RadioButtonListGioiTinh.SelectedValue);
            _quanheEntity.Insert(_nhanvienID, ten, ngaysinh, noio, loaiquanheID, benvo, hokhau, gioitinh);
            this.RedirectToIndex();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            string ten = RadTextBoxTen.Text;
            DateTime ngaysinh = Convert.ToDateTime(RadDatePickerNgaySinh.SelectedDate);
            string noio = RadTextBoxNoiO.Text;
            int loaiquanheID = Convert.ToInt32(cbbQuanHe.SelectedValue);
            bool benvo = Convert.ToBoolean(RadioButtonListBenVo.SelectedValue);
            string hokhau = RadTextBoxHoKhau.Text;
            bool gioitinh = Convert.ToBoolean(RadioButtonListGioiTinh.SelectedValue);
            _quanheEntity.Update(_quanheID, ten, ngaysinh, noio, loaiquanheID, benvo, hokhau, gioitinh);
            this.RedirectToIndex();           
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _quanheEntity.Delete(_quanheID);
            this.RedirectToIndex();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID);
        }

        private void CreateStatus()
        {
            ButtonCreate.Visible = true;
            ButtonUpdate.Visible = false;
            ButtonDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            ButtonCreate.Visible = false;
            ButtonUpdate.Visible = true;
            ButtonDelete.Visible = true;
        }
    }
}