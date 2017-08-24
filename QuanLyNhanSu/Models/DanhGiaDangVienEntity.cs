using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DanhGiaDangVienEntity
    {
        public DanhGiaDangVienEntity() { }

        private IEnumerable<Models.DanhGiaDangVien> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaDangViens.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.DGDVNam);
        }

        public Models.DanhGiaDangVien Find(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGiaDangViens.FirstOrDefault(x => x.DGDVID == _danhgiaID);
        }

        public void Insert(int _nhanvienID, string _chucvudang, string _chucvuchinhquyen, string _donvi,
            string _chibo, string _hangchucdanh, int _bac, decimal _hesoluong, string _uudiem,
            string _ketquakhacphuc, string _khuyetdiem, string _phuonghuong, string _danhgia, int _nam, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaDangVien danhgia = new DanhGiaDangVien();
            danhgia.NVID = _nhanvienID;
            danhgia.DGDVChucVuDang = _chucvudang;
            danhgia.DGDVChucVuChinhQuyen = _chucvuchinhquyen;
            danhgia.DGDVDonVi = _donvi;
            danhgia.DGDVChiBo = _chibo;
            danhgia.DGDVHangChucDanh = _hangchucdanh;
            danhgia.DGDVBac = _bac;
            danhgia.DGDVHeSoLuong = _hesoluong;
            danhgia.DGDVUuDiem = _uudiem;
            danhgia.DGDVKetQuaKhacPhuc = _ketquakhacphuc;
            danhgia.DGDVKhuyetDiem = _khuyetdiem;
            danhgia.DGDVPhuongHuong = _phuonghuong;
            danhgia.DGDVDanhGia = _danhgia;
            danhgia.DGDVNam = _nam;
            danhgia.DGDVNgayThang = _ngaythang;
            db.DanhGiaDangViens.Add(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _danhgiaID, string _chucvudang, string _chucvuchinhquyen, string _donvi,
            string _chibo, string _hangchucdanh, int _bac, decimal _hesoluong, string _uudiem,
            string _ketquakhacphuc, string _khuyetdiem, string _phuonghuong, string _danhgia, int _nam, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaDangVien danhgia = db.DanhGiaDangViens.FirstOrDefault(x => x.DGDVID == _danhgiaID);
            danhgia.DGDVChucVuDang = _chucvudang;
            danhgia.DGDVChucVuChinhQuyen = _chucvuchinhquyen;
            danhgia.DGDVDonVi = _donvi;
            danhgia.DGDVChiBo = _chibo;
            danhgia.DGDVHangChucDanh = _hangchucdanh;
            danhgia.DGDVBac = _bac;
            danhgia.DGDVHeSoLuong = _hesoluong;
            danhgia.DGDVUuDiem = _uudiem;
            danhgia.DGDVKetQuaKhacPhuc = _ketquakhacphuc;
            danhgia.DGDVKhuyetDiem = _khuyetdiem;
            danhgia.DGDVPhuongHuong = _phuonghuong;
            danhgia.DGDVDanhGia = _danhgia;
            danhgia.DGDVNam = _nam;
            danhgia.DGDVNgayThang = _ngaythang;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGiaDangVien danhgia = db.DanhGiaDangViens.FirstOrDefault(x => x.DGDVID == _danhgiaID);
            db.DanhGiaDangViens.Remove(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDanhGiaOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}