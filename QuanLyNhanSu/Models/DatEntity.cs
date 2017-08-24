using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DatEntity
    {
        public DatEntity() { }

        public IEnumerable<object> Dat_OfNhanVien(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<object> dats = db.Dats.Where(x => x.KKID == _kekhaiID).AsEnumerable().Select(x => new
            {
                DATID = x.DATID,
                DATDiaChi = x.DATDiaChi,
                DATDienTich = x.DATDienTich,
                DATGiaTri = x.DATGiaTri,
                DATQuyenSoHuu = x.DATQuyenSoHuu,
                DATGhiChu = x.DATGhiChu
            });
            return dats;
        }

        public Models.Dat Find(int _datID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Dats.FirstOrDefault(x => x.DATID == _datID);
        }

        public void Insert(int _kekhaiID, string _diachi, float _dientich, long _giatri, string _sohuu, string _ghichu)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Dat dat = new Dat();
            dat.KKID = _kekhaiID;
            dat.DATDiaChi = _diachi;
            dat.DATDienTich = _dientich;
            dat.DATGiaTri = _giatri;
            dat.DATQuyenSoHuu = _sohuu;
            dat.DATGhiChu = _ghichu;
            db.Dats.Add(dat);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _datID, string _diachi, float _dientich, long _giatri, string _sohuu, string _ghichu)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Dat dat = db.Dats.FirstOrDefault(x => x.DATID == _datID);
            dat.DATDiaChi = _diachi;
            dat.DATDienTich = _dientich;
            dat.DATGiaTri = _giatri;
            dat.DATQuyenSoHuu = _sohuu;
            dat.DATGhiChu = _ghichu;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _datID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Dat dat = db.Dats.FirstOrDefault(x => x.DATID == _datID);
            db.Dats.Remove(dat);
            db.SaveChanges();
            db.Dispose();
        }

        //LOAD DATASOURCE
        public  void Load_DataSource_RadGrid(RadGrid _radgird, int _kekhaiID)
        {
            _radgird.DataSource = this.Dat_OfNhanVien(_kekhaiID).ToList();
        }
    }
}