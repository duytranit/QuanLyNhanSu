using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class QuanHeCongTacEntity
    {
        public QuanHeCongTacEntity() { }

        public Models.QuanHeCongTac Find(int _congtacID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.QuanHeCongTacs.FirstOrDefault(x => x.QHCTID == _congtacID);
        }

        // ATTRIBUTES
        private IEnumerable<Models.QuanHeCongTac> QuanHeCongTac_Of_QuanHe(int _quanheID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.QuanHeCongTacs.Where(x => x.QHID == _quanheID).OrderBy(x => x.QHCTTuNgay);
        }

        public void Insert(int _quanheID, string _donvi, string _chucvu, string _nghenghiep, string _ghichu, DateTime _tungay, DateTime _denngay)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuanHeCongTac quanhect = new Models.QuanHeCongTac();
            quanhect.QHID = _quanheID;
            quanhect.QHCTDonVi = _donvi;
            quanhect.QHCTChucVu = _chucvu;
            quanhect.QHCTNgheNghiep = _nghenghiep;
            quanhect.QHCTNoiDung = _ghichu;
            quanhect.QHCTTuNgay = _tungay;
            if (_denngay != DateTime.MinValue)
                quanhect.QHCTDenNgay = _denngay;
            db.QuanHeCongTacs.Add(quanhect);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _congtacID, string _donvi, string _chucvu, string _nghenghiep, string _ghichu, DateTime _tungay, DateTime _denngay)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuanHeCongTac quanhect = db.QuanHeCongTacs.FirstOrDefault(x => x.QHCTID == _congtacID);
            quanhect.QHCTDonVi = _donvi;
            quanhect.QHCTChucVu = _chucvu;
            quanhect.QHCTNgheNghiep = _nghenghiep;
            quanhect.QHCTNoiDung = _ghichu;
            quanhect.QHCTTuNgay = _tungay;
            quanhect.QHCTDenNgay = _denngay;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _congtacID)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuanHeCongTac quanhect = db.QuanHeCongTacs.FirstOrDefault(x => x.QHCTID == _congtacID);
            db.QuanHeCongTacs.Remove(quanhect);
            db.SaveChanges();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_Of_QuanHe_RadGrid(RadGrid _radgrid, int _quanheID)
        {
            _radgrid.DataSource = this.QuanHeCongTac_Of_QuanHe(_quanheID).ToList();
        }
    }
}