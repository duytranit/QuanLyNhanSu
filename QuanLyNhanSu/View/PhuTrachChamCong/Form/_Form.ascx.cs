using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.PhuTrachChamCong.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.PhuTrachChamCongEntity _ptccEntity = new Models.PhuTrachChamCongEntity();
        private Models.PhuTrachChamCong _phutrach;

        public Models.PhuTrachChamCong PhuTrachChamCong
        {
            set
            {
                _phutrach = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                accEntity.Load_AllAccount_ToRadComboBox(cbbAccount);

                Models.DonViEntity dvEntity = new Models.DonViEntity();
                dvEntity.Load_DataSource_RadDropDownTree(ddtDonVi);
            }
            
            if (_phutrach != null)
            {
                this.UpdateStatus();
                if (!this.Page.IsPostBack)
                {
                    cbbAccount.SelectedValue = _phutrach.ACCID.ToString();
                    ddtDonVi.SelectedValue = _phutrach.DVID.ToString();
                    rblTrangThai.SelectedValue = _phutrach.PCCCStatus.ToString();
                }                
            }else
            {
                this.CreateStatus();
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int accountID = Convert.ToInt32(cbbAccount.SelectedValue);
                int donviID = Convert.ToInt32(ddtDonVi.SelectedValue);
                bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                _ptccEntity.Insert(accountID, donviID, trangthai);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int accountID = Convert.ToInt32(cbbAccount.SelectedValue);
                int donviID = Convert.ToInt32(ddtDonVi.SelectedValue);
                bool trangthai = Convert.ToBoolean(rblTrangThai.SelectedValue);
                _ptccEntity.Update(_phutrach.PTCCID, accountID, donviID, trangthai);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _ptccEntity.Delete(_phutrach.PTCCID);
            this.RedirectToIndex();
        }

        private void CreateStatus()
        {
            btCreate.Visible = true;
            btUpdate.Visible = false;
            btDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            btCreate.Visible = false;
            btUpdate.Visible = true;
            btDelete.Visible = true;
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/PhuTrachChamCong");
        }
    }
}