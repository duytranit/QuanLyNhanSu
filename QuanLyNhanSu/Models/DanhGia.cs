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
    
    public partial class DanhGia
    {
        public int DGID { get; set; }
        public string DGNoiDung { get; set; }
        public System.DateTime DGNgay { get; set; }
        public int NVID { get; set; }
    
        public virtual NhanVien NhanVien { get; set; }
    }
}
