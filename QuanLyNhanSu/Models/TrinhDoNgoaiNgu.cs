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
    
    public partial class TrinhDoNgoaiNgu
    {
        public int TDNNID { get; set; }
        public string TDNNTen { get; set; }
        public bool TDNNChungChi { get; set; }
        public bool TDNNTiengDanToc { get; set; }
        public int NVID { get; set; }
    
        public virtual NhanVien NhanVien { get; set; }
    }
}