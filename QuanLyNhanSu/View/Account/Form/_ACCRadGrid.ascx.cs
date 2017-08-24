using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.Account.Form
{
    public partial class _ACCRadGrid : System.Web.UI.UserControl
    {
        private Models.AccountEntity _accEntity = new Models.AccountEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
                _accEntity.Load_AllAccount_ToRadGrid(rgAccount);
        }

        protected void rgAccount_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem item = e.Item as GridFilteringItem;
                TextBox email = item["ACCEmail"].Controls[0] as TextBox;
                email.Attributes.Add("Placeholder", "Nhập email");
                email.ToolTip = "Nhập email cần tìm";

                TextBox hoten = item["NVTen"].Controls[0] as TextBox;
                hoten.Attributes.Add("Placeholder", "Nhập họ tên");
                hoten.ToolTip = "Nhập họ và tên cần tìm";
            }
        }

        protected void rgAccount_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(rgAccount, e, "lblSTT");
        }

        protected void rgAccount_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _accEntity.Load_AllAccount_ToRadGrid(rgAccount);
        }

        protected void rgAccount_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _accEntity.Load_AllAccount_ToRadGrid(rgAccount);
        }

        protected void rgAccount_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _accEntity.Load_AllAccount_ToRadGrid(rgAccount);
        }
    }
}