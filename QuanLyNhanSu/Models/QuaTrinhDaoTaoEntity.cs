using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class QuaTrinhDaoTaoEntity
    {
        public QuaTrinhDaoTaoEntity() { }

        public Models.QuaTrinhDaoTao Find(int _qtdtID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.QuaTrinhDaoTaos.FirstOrDefault(x => x.QTDTID == _qtdtID);
        }

        public void Insert(int _nhanvienID, string _truong, string _chuyennganh, DateTime _tungay, DateTime _denngay, string _hinhthuc, string _vanbang)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuaTrinhDaoTao qtdt = new Models.QuaTrinhDaoTao();
            qtdt.QTDTTruong = _truong;
            qtdt.NVID = _nhanvienID;
            qtdt.QTDTChuyenNganh = _chuyennganh;
            qtdt.QTDTTuNgay = _tungay;
            qtdt.QTDTDenNgay = _denngay;
            qtdt.QTDTHinhThuc = _hinhthuc;
            qtdt.QTDTVanBang = _vanbang;
            db.QuaTrinhDaoTaos.Add(qtdt);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _qtdtID, string _truong, string _chuyennganh, DateTime _tungay, DateTime _denngay, string _hinhthuc, string _vanbang)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuaTrinhDaoTao qtdt = db.QuaTrinhDaoTaos.FirstOrDefault(x => x.QTDTID == _qtdtID);
            qtdt.QTDTTruong = _truong;
            qtdt.QTDTChuyenNganh = _chuyennganh;
            qtdt.QTDTTuNgay = _tungay;
            qtdt.QTDTDenNgay = _denngay;
            qtdt.QTDTHinhThuc = _hinhthuc;
            qtdt.QTDTVanBang = _vanbang;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _qtdtID)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.QuaTrinhDaoTao qtdt = db.QuaTrinhDaoTaos.FirstOrDefault(x => x.QTDTID == _qtdtID);
            db.QuaTrinhDaoTaos.Remove(qtdt);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_RadGrid(RadGrid _radgrid, int _nhanvienID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.QuaTrinhDaoTao> qtdts = db.QuaTrinhDaoTaos.Where(x => x.NVID == _nhanvienID).OrderBy(x => x.QTDTTuNgay);
            _radgrid.DataSource = qtdts.ToList();
        }
    }
}