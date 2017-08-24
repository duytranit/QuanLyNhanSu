using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Dat.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.DatEntity _datEntity = new Models.DatEntity();
        private int _datID;
        private int _kekhaiID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["dat"] != null)
            {
                this.UpdateStatus();
                _datID = Convert.ToInt32(Page.RouteData.Values["dat"]);
                Models.Dat dat = _datEntity.Find(_datID);
                _kekhaiID = dat.KKID;
                if (!IsPostBack)
                {
                    RadTextBoxDiaChi.Text = dat.DATDiaChi;
                    RadTextBoxDienTich.Text = dat.DATDienTich.ToString();
                    RadTextBoxGiaTri.Text = dat.DATGiaTri.ToString();
                    RadTextBoxGiayChungNhan.Text = dat.DATQuyenSoHuu.ToString();
                    RadTextBoxThongTinKhac.Text = dat.DATGhiChu;
                }
            }
            else
            {
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                this.CreateStatus();
            }                
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string diachi = RadTextBoxDiaChi.Text;
                float dientich = float.Parse(RadTextBoxDienTich.Text);
                long giatri = Convert.ToInt64(RadTextBoxGiaTri.Text);
                string sohuu = RadTextBoxGiayChungNhan.Text;
                string ghichu = RadTextBoxThongTinKhac.Text;

                _datEntity.Update(_datID, diachi, dientich, giatri, sohuu, ghichu);
                this.RedirectToIndex();
            }
            
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _datEntity.Delete(_datID);
            this.RedirectToIndex();
        }


        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string diachi = RadTextBoxDiaChi.Text;
                float dientich = float.Parse(RadTextBoxDienTich.Text);
                long giatri = Convert.ToInt64(RadTextBoxGiaTri.Text);
                string sohuu = RadTextBoxGiayChungNhan.Text;
                string ghichu = RadTextBoxThongTinKhac.Text;

                _datEntity.Insert(_kekhaiID, diachi, dientich, giatri, sohuu, ghichu);

                this.RedirectToIndex();
            }            
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID);
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