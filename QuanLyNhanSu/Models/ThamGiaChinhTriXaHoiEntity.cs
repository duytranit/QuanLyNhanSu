using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ThamGiaChinhTriXaHoiEntity
    {
        public ThamGiaChinhTriXaHoiEntity() { }

        public Models.ThamGiaChinhTriXaHois Find (int _thamgiatochucID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgiaTC = db.ThamGiaChinhTriXaHois.FirstOrDefault(x => x.TGCTXHID == _thamgiatochucID);
            return thamgiaTC;
        }

        public void Insert(int _nhanvienID, int _tochucID, string _chucvu, DateTime _tungay, string _noidung, DateTime _denngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgia = new ThamGiaChinhTriXaHois();
            thamgia.NVID = _nhanvienID;
            thamgia.CTXHID = _tochucID;
            thamgia.TGCTXHChucVu = _chucvu;
            thamgia.TGCTXHTuNgay = _tungay;
            thamgia.TGCTXHDenNgay = _denngay;
            thamgia.TGCTXHNoiDung = _noidung;
            db.ThamGiaChinhTriXaHois.Add(thamgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Insert(int _nhanvienID, int _tochucID, string _chucvu, DateTime _tungay, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgia = new ThamGiaChinhTriXaHois();
            thamgia.NVID = _nhanvienID;
            thamgia.CTXHID = _tochucID;
            thamgia.TGCTXHChucVu = _chucvu;
            thamgia.TGCTXHTuNgay = _tungay;
            thamgia.TGCTXHNoiDung = _noidung;
            db.ThamGiaChinhTriXaHois.Add(thamgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _thamgiaID, int _tochucID, string _chucvu, DateTime _tungay, string _noidung, DateTime _denngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgia = db.ThamGiaChinhTriXaHois.FirstOrDefault(x => x.TGCTXHID == _thamgiaID);
            thamgia.CTXHID = _tochucID;
            thamgia.TGCTXHChucVu = _chucvu;
            thamgia.TGCTXHTuNgay = _tungay;
            thamgia.TGCTXHDenNgay = _denngay;
            thamgia.TGCTXHNoiDung = _noidung;
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _thamgiaID, int _tochucID, string _chucvu, DateTime _tungay, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgia = db.ThamGiaChinhTriXaHois.FirstOrDefault(x => x.TGCTXHID == _thamgiaID);
            thamgia.CTXHID = _tochucID;
            thamgia.TGCTXHChucVu = _chucvu;
            thamgia.TGCTXHTuNgay = _tungay;
            thamgia.TGCTXHNoiDung = _noidung;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _thamgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois thamgia = db.ThamGiaChinhTriXaHois.FirstOrDefault(x => x.TGCTXHID == _thamgiaID);
            db.ThamGiaChinhTriXaHois.Remove(thamgia);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_Of_NhanVien_RadGrid(RadGrid _radgrid, int _nhanvienID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<object> tgctxhs = db.ThamGiaChinhTriXaHois.Where(x => x.NVID == _nhanvienID).OrderBy(x => x.TGCTXHTuNgay).AsEnumerable().Select(x => new
            {
                TGCTXHID = x.TGCTXHID,
                TGCTXHTuNgay = x.TGCTXHTuNgay,
                TGCTXHDenNgay = x.TGCTXHDenNgay,
                TGCTXHChucVu = x.TGCTXHChucVu,
                TGCTXHTCTen = x.ChinhTriXaHois.CTXHTen,
                TGCTXHNoiDung = x.TGCTXHNoiDung
            });
            _radgrid.DataSource = tgctxhs.ToList();
        }

        public bool IsOfNhanVien(int _ctxhID, int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThamGiaChinhTriXaHois tgctxh = db.ThamGiaChinhTriXaHois.FirstOrDefault(x => x.CTXHID == _ctxhID && x.NVID == _nhanvienID);
            if (tgctxh == null)
                return false;
            else
                return true;
        }
    }
}