//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyNhanSu.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DanhGiaVienChuc
    {
        public int DGVCID { get; set; }
        public int DGVCNam { get; set; }
        public string DGVCChucDanh { get; set; }
        public string DGVCDonVi { get; set; }
        public string DGVCNgheNghiep { get; set; }
        public int DGVCBac { get; set; }
        public decimal DGVCHeSoLuong { get; set; }
        public string DGVCKetQua { get; set; }
        public string DGVCDaoDuc { get; set; }
        public string DGVCTrachNhiem { get; set; }
        public string DGVCNghiaVu { get; set; }
        public string DGVCUuDiem { get; set; }
        public string DGVCPhanLoai { get; set; }
        public string DGVCYKien { get; set; }
        public string DGVCThongNhat { get; set; }
        public System.DateTime DGVCNgay { get; set; }
        public int NVID { get; set; }
    
        public virtual NhanVien NhanVien { get; set; }
    }
}