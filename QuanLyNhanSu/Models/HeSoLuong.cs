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
    
    public partial class HeSoLuong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HeSoLuong()
        {
            this.LamViecs = new HashSet<LamViec>();
        }
    
        public int HSLID { get; set; }
        public int BLID { get; set; }
        public int NGID { get; set; }
        public decimal HSLHeSo { get; set; }
    
        public virtual BacLuong BacLuong { get; set; }
        public virtual Ngach Ngach { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LamViec> LamViecs { get; set; }
    }
}