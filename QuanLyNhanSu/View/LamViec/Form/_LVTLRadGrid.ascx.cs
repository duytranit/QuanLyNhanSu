using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.View.LamViec.Form
{
    public partial class _LVTLRadGrid : System.Web.UI.UserControl
    {
        private Models.LamViecEntity _lvEntity = new Models.LamViecEntity();
        private DateTime _ngaycongtac = new DateTime();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dpkDenNgay.SelectedDate = DateTime.Now.AddMonths(1);
                _ngaycongtac = Convert.ToDateTime(dpkDenNgay.SelectedDate);
                _lvEntity.Load_LamViecDenNgay_ToRadGrid(RadGridNhanVien, _ngaycongtac);
            }
                
        }

        protected int startSlider
        {
            set
            {
                ViewState["strSl"] = value;
            }
            get
            {
                if (ViewState["strSl"] != null)
                    return (int)ViewState["strSl"];
                else
                    return 0;
            }
        }
        protected int endSlider
        {
            set
            {
                ViewState["endSl"] = value;
            }
            get
            {
                if (ViewState["endSl"] != null)
                    return (int)ViewState["endSl"];
                else
                    return 100;
            }
        }

        protected void RadGridNhanVien_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            Helper.PageHelper pageHelper = new Helper.PageHelper();
            pageHelper.SetSequenceNumberColumn(RadGridNhanVien, e, "LabelSTT");
        }

        protected void RadGridNhanVien_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            _lvEntity.Load_LamViecDenNgay_ToRadGrid(RadGridNhanVien, _ngaycongtac);
        }

        protected void RadGridNhanVien_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            _lvEntity.Load_LamViecDenNgay_ToRadGrid(RadGridNhanVien, _ngaycongtac);
        }

        protected void RadGridNhanVien_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            _lvEntity.Load_LamViecDenNgay_ToRadGrid(RadGridNhanVien, _ngaycongtac);
        }

        protected string GetFilterIcon()
        {
            return SkinRegistrar.GetWebResourceUrl(Page, typeof(RadGrid), "Telerik.Web.UI.Skins.Metro.Grid.Filter.gif");
        }

        protected void RadFilterNhanVien_ExpressionItemCreated(object sender, RadFilterExpressionItemCreatedEventArgs e)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            IEnumerable<Models.ChucVu> chuvus = db.ChucVus;
            IEnumerable<Models.ChinhTriXaHois> ctxhs = db.ChinhTriXaHois;

            RadFilterSingleExpressionItem singleItem = e.Item as RadFilterSingleExpressionItem;
            if (singleItem != null && singleItem.FieldName == "NVLamViecChucVu" && singleItem.IsSingleValue)
            {
                RadDropDownList dropDownList = singleItem.InputControl as RadDropDownList;
                dropDownList.DataSource = chuvus.ToList();
                dropDownList.DataBind();
            }
            if (singleItem != null && singleItem.FieldName == "NVTGCTXH" && singleItem.IsSingleValue)
            {
                RadDropDownList dropDownList = singleItem.InputControl as RadDropDownList;
                dropDownList.DataSource = ctxhs.ToList();
                dropDownList.DataBind();
            }
        }

        protected void RadGridNhanVien_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox 
                TextBox hotenFilter = filteringItem["NVTen"].Controls[0] as TextBox;
                hotenFilter.Attributes.Add("Placeholder", "Nhập họ và tên nhân viên");
                hotenFilter.ToolTip = "Nhập họ và tên nhân viên cần tìm";
                hotenFilter.Font.Italic = true;

                TextBox quequanFilter = filteringItem["NVQueQuan"].Controls[0] as TextBox;
                quequanFilter.Attributes.Add("Placeholder", "Nhập quê quán");
                quequanFilter.ToolTip = "Nhập quê quán nhân viên cần tìm";
                quequanFilter.Font.Italic = true;

                TextBox donviFilter = filteringItem["DVTen"].Controls[0] as TextBox;
                donviFilter.Attributes.Add("Placeholder", "Nhập tên đơn vị");
                donviFilter.ToolTip = "Nhập tên đơn vị cần tìm";
                donviFilter.Font.Italic = true;
            }
        }

        protected void dpkDenNgay_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            _ngaycongtac = Convert.ToDateTime(dpkDenNgay.SelectedDate);
            _lvEntity.Load_LamViecDenNgay_ToRadGrid(RadGridNhanVien, _ngaycongtac);
            RadGridNhanVien.Rebind();
        }
    }
}