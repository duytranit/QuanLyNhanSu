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
    
    public partial class LoaiGiaiTrinh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiGiaiTrinh()
        {
            this.GiaiTrinhs = new HashSet<GiaiTrinh>();
        }
    
        public int LGTID { get; set; }
        public string LGTTen { get; set; }
        public string LGTTenChung { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GiaiTrinh> GiaiTrinhs { get; set; }
    }
}
