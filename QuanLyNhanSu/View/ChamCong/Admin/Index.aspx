<%@ Page Title="ChamCong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Admin.Index" Debug="true" %>
<%@ Register TagPrefix="Partial" TagName="CCTable" Src="~/View/ChamCong/Form/_CCTable.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting>
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CCTable" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <table style="width: 100%;">
                <tr>
                    <td>
                        TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT BẾN TRE<br />
                        <b>
                            Mã đơn vị có quan hệ với ngân sách: 1123886
                        </b>
                    </td>
                    <td style="text-align: center; width: 50%;">
                        Mẫu số: C01a-HD<br/>
                        (<i>Ban hành kèm theo Thông tư số 185/2010/TT-BTC<br/>
                        ngày 15 tháng 11 năm 2010 của Bộ Tài Chính</i>)
                    </td>
                </tr>
            </table>            
            <h2>
                <img src="../../../Images/Attendance.png" height="70" /><br />
                BẢNG CHẤM CÔNG</h2>
            <hr />
            <div>
                <asp:LinkButton ID="btThongKe" runat="server" Text="Thống kê chấm công" CssClass="btn btn-default" PostBackUrl="~/ThongKeChamCong"></asp:LinkButton>
                <asp:LinkButton ID="btPhuTrachChamCong" runat="server" Text="Phụ trách chấm công" CssClass="btn btn-default" PostBackUrl="~/PhuTrachChamCong"></asp:LinkButton>
                <asp:LinkButton ID="btBaoCao" runat="server" Text="Xuất file báo cáo" CssClass="btn btn-default" OnClick="btBaoCao_Click"></asp:LinkButton>
            </div>
            <p>
                <Partial:CCTable ID="CCTable" runat="server" />       
            </p>            
        </div>
    </div>
    
</asp:Content>
