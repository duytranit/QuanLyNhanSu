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
    
    public partial class PhongTangDanhHieu
    {
        public int PTDHID { get; set; }
        public int NVID { get; set; }
        public string PTDHTen { get; set; }
        public System.DateTime PTDHNgay { get; set; }
        public string PTDHHoiDong { get; set; }
    
        public virtual NhanVien NhanVien { get; set; }
    }
}
