using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DanhGiaLaoDongEntity
    {
        public DanhGiaLaoDongEntity() { }

        private IEnumerable<Models.DanhGiaLaoDong> All (int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaLaoDongs.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.DGLDNam);
        }

        public Models.DanhGiaLaoDong Find(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaLaoDongs.FirstOrDefault(x => x.DGLDID == _danhgiaID);
        }

        public void Insert(int _nhanvienID, int _namdanhgia, string _chucdanh, string _donvi, string _nghenghiep, 
            int _bac, decimal _hesoluong, string _ketquathuchiencongviec, string _daoducnghenghiep, 
            string _trachnhiem, string _nghiavu, string _uudiem, string _phanloai, string _ykiendonvi, 
            string _thongnhattapthe, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaLaoDong danhgia = new DanhGiaLaoDong();
            danhgia.NVID = _nhanvienID;
            danhgia.DGLDNam = _namdanhgia;
            danhgia.DGLDChucDanh = _chucdanh;
            danhgia.DGLDDonVi = _donvi;
            danhgia.DGLDNgheNghiep = _nghenghiep;
            danhgia.DGLDBac = _bac;
            danhgia.DGLDHeSoLuong = _hesoluong;
            danhgia.DGLDKetQua = _ketquathuchiencongviec;
            danhgia.DGLDDaoDuc = _daoducnghenghiep;
            danhgia.DGLDTrachNhiem = _trachnhiem;
            danhgia.DGLDNghiaVu = _nghiavu;
            danhgia.DGLDUuDiem = _uudiem;
            danhgia.DGLDPhanLoai = _phanloai;
            danhgia.DGLDYKien = _ykiendonvi;
            danhgia.DGLDThongNhat = _thongnhattapthe;
            danhgia.DGLDNgay = _ngaythang;
            db.DanhGiaLaoDongs.Add(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _danhgiaID, int _namdanhgia, string _chucdanh, string _donvi, string _nghenghiep,
            int _bac, decimal _hesoluong, string _ketquathuchiencongviec, string _daoducnghenghiep,
            string _trachnhiem, string _nghiavu, string _uudiem, string _phanloai, string _ykiendonvi,
            string _thongnhattapthe, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaLaoDong danhgia = db.DanhGiaLaoDongs.FirstOrDefault(x => x.DGLDID == _danhgiaID);
            danhgia.DGLDNam = _namdanhgia;
            danhgia.DGLDChucDanh = _chucdanh;
            danhgia.DGLDDonVi = _donvi;
            danhgia.DGLDNgheNghiep = _nghenghiep;
            danhgia.DGLDBac = _bac;
            danhgia.DGLDHeSoLuong = _hesoluong;
            danhgia.DGLDKetQua = _ketquathuchiencongviec;
            danhgia.DGLDDaoDuc = _daoducnghenghiep;
            danhgia.DGLDTrachNhiem = _trachnhiem;
            danhgia.DGLDNghiaVu = _nghiavu;
            danhgia.DGLDUuDiem = _uudiem;
            danhgia.DGLDPhanLoai = _phanloai;
            danhgia.DGLDYKien = _ykiendonvi;
            danhgia.DGLDThongNhat = _thongnhattapthe;
            danhgia.DGLDNgay = _ngaythang;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaLaoDong danhgia = db.DanhGiaLaoDongs.FirstOrDefault(x => x.DGLDID == _danhgiaID);
            db.DanhGiaLaoDongs.Remove(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDanhGiaOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}