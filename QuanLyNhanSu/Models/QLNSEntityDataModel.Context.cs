﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EmployeeManagementEntities : DbContext
    {
        public EmployeeManagementEntities()
            : base("name=EmployeeManagementEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BacLuong> BacLuongs { get; set; }
        public virtual DbSet<ChinhSach> ChinhSaches { get; set; }
        public virtual DbSet<ChinhTriXaHois> ChinhTriXaHois { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<ChuyenMon> ChuyenMons { get; set; }
        public virtual DbSet<DanhGia> DanhGias { get; set; }
        public virtual DbSet<DanToc> DanTocs { get; set; }
        public virtual DbSet<DonVi> DonVis { get; set; }
        public virtual DbSet<GiaoDucPhoThong> GiaoDucPhoThongs { get; set; }
        public virtual DbSet<KeKhai> KeKhais { get; set; }
        public virtual DbSet<KhenThuong> KhenThuongs { get; set; }
        public virtual DbSet<KyLuat> KyLuats { get; set; }
        public virtual DbSet<LoaiGiaiTrinh> LoaiGiaiTrinhs { get; set; }
        public virtual DbSet<LoaiQuanHe> LoaiQuanHes { get; set; }
        public virtual DbSet<LyLuanChinhTri> LyLuanChinhTris { get; set; }
        public virtual DbSet<Nha> Nhas { get; set; }
        public virtual DbSet<NhomMau> NhomMaus { get; set; }
        public virtual DbSet<PhongTangDanhHieu> PhongTangDanhHieux { get; set; }
        public virtual DbSet<QuanHeCongTac> QuanHeCongTacs { get; set; }
        public virtual DbSet<QuanHe> QuanHes { get; set; }
        public virtual DbSet<QuanLyNhaNuoc> QuanLyNhaNuocs { get; set; }
        public virtual DbSet<QuaTrinhDaoTao> QuaTrinhDaoTaos { get; set; }
        public virtual DbSet<ThamGiaChinhTriXaHois> ThamGiaChinhTriXaHois { get; set; }
        public virtual DbSet<TonGiao> TonGiaos { get; set; }
        public virtual DbSet<TrinhDoNgoaiNgu> TrinhDoNgoaiNgus { get; set; }
        public virtual DbSet<TrinhDoTinHoc> TrinhDoTinHocs { get; set; }
        public virtual DbSet<KeKhaiCon> KeKhaiCons { get; set; }
        public virtual DbSet<Dat> Dats { get; set; }
        public virtual DbSet<Tien> Tiens { get; set; }
        public virtual DbSet<DongSan> DongSans { get; set; }
        public virtual DbSet<DaQui> DaQuis { get; set; }
        public virtual DbSet<TaiSanKhac> TaiSanKhacs { get; set; }
        public virtual DbSet<KhoanNo> KhoanNos { get; set; }
        public virtual DbSet<TaiSanNuocNgoai> TaiSanNuocNgoais { get; set; }
        public virtual DbSet<ThuNhap> ThuNhaps { get; set; }
        public virtual DbSet<GiaiTrinh> GiaiTrinhs { get; set; }
        public virtual DbSet<HeSoLuong> HeSoLuongs { get; set; }
        public virtual DbSet<DanhGiaLaoDong> DanhGiaLaoDongs { get; set; }
        public virtual DbSet<DanhGiaVienChuc> DanhGiaVienChucs { get; set; }
        public virtual DbSet<DanhGiaDangVien> DanhGiaDangViens { get; set; }
        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<LoaiChamCong> LoaiChamCongs { get; set; }
        public virtual DbSet<PhuTrachChamCong> PhuTrachChamCongs { get; set; }
        public virtual DbSet<ChamCong> ChamCongs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<Ngach> Ngaches { get; set; }
        public virtual DbSet<LamViec> LamViecs { get; set; }
    }
}