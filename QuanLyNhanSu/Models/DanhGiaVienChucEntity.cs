using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DanhGiaVienChucEntity
    {
        public DanhGiaVienChucEntity() { }

        private IEnumerable<Models.DanhGiaVienChuc> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaVienChucs.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.DGVCNam);
        }

        public Models.DanhGiaVienChuc Find(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaVienChucs.FirstOrDefault(x => x.DGVCID == _danhgiaID);
        }

        public void Insert(int _nhanvienID, int _namdanhgia, string _chucdanh, string _donvi, string _nghenghiep,
            int _bac, decimal _hesoluong, string _ketquathuchiencongviec, string _daoducnghenghiep,
            string _trachnhiem, string _nghiavu, string _uudiem, string _phanloai, string _ykiendonvi,
            string _thongnhattapthe, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaVienChuc danhgia = new DanhGiaVienChuc();
            danhgia.NVID = _nhanvienID;
            danhgia.DGVCNam = _namdanhgia;
            danhgia.DGVCChucDanh = _chucdanh;
            danhgia.DGVCDonVi = _donvi;
            danhgia.DGVCNgheNghiep = _nghenghiep;
            danhgia.DGVCBac = _bac;
            danhgia.DGVCHeSoLuong = _hesoluong;
            danhgia.DGVCKetQua = _ketquathuchiencongviec;
            danhgia.DGVCDaoDuc = _daoducnghenghiep;
            danhgia.DGVCTrachNhiem = _trachnhiem;
            danhgia.DGVCNghiaVu = _nghiavu;
            danhgia.DGVCUuDiem = _uudiem;
            danhgia.DGVCPhanLoai = _phanloai;
            danhgia.DGVCYKien = _ykiendonvi;
            danhgia.DGVCThongNhat = _thongnhattapthe;
            danhgia.DGVCNgay = _ngaythang;
            db.DanhGiaVienChucs.Add(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _danhgiaID, int _namdanhgia, string _chucdanh, string _donvi, string _nghenghiep,
            int _bac, decimal _hesoluong, string _ketquathuchiencongviec, string _daoducnghenghiep,
            string _trachnhiem, string _nghiavu, string _uudiem, string _phanloai, string _ykiendonvi,
            string _thongnhattapthe, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaVienChuc danhgia = db.DanhGiaVienChucs.FirstOrDefault(x => x.DGVCID == _danhgiaID);
            danhgia.DGVCNam = _namdanhgia;
            danhgia.DGVCChucDanh = _chucdanh;
            danhgia.DGVCDonVi = _donvi;
            danhgia.DGVCNgheNghiep = _nghenghiep;
            danhgia.DGVCBac = _bac;
            danhgia.DGVCHeSoLuong = _hesoluong;
            danhgia.DGVCKetQua = _ketquathuchiencongviec;
            danhgia.DGVCDaoDuc = _daoducnghenghiep;
            danhgia.DGVCTrachNhiem = _trachnhiem;
            danhgia.DGVCNghiaVu = _nghiavu;
            danhgia.DGVCUuDiem = _uudiem;
            danhgia.DGVCPhanLoai = _phanloai;
            danhgia.DGVCYKien = _ykiendonvi;
            danhgia.DGVCThongNhat = _thongnhattapthe;
            danhgia.DGVCNgay = _ngaythang;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaVienChuc danhgia = db.DanhGiaVienChucs.FirstOrDefault(x => x.DGVCID == _danhgiaID);
            db.DanhGiaVienChucs.Remove(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDanhGiaOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}