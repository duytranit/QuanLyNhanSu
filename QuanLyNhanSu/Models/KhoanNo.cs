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
    
    public partial class KhoanNo
    {
        public int KNID { get; set; }
        public string KNTen { get; set; }
        public decimal KNSoLuong { get; set; }
        public decimal KNGiaTri { get; set; }
        public int KKID { get; set; }
    
        public virtual KeKhai KeKhai { get; set; }
    }
}
