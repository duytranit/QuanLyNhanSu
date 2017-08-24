using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DonViEntity
    {
        public DonViEntity() { }

        public IEnumerable<object> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
                IEnumerable<object> donvis = db.DonVis.OrderBy(x => x.DVTen).OrderBy(x => x.DVTrucThuocID).AsEnumerable().Select(x => new
                {
                    DVID = x.DVID,
                    DVTen = x.DVTen,
                    DVTrucThuoc = this.DonViTrucThuocTen(x),
                    DVTrucThuocID = x.DVTrucThuocID,
                    DVBienChe = x.DVBienChe,
                    DVTrangThai = this.ConvertTrangThai(x),
                    DVSDT = x.DVSDT,
                    DVDiaChi = x.DVDiaChi
                });
                return donvis;
            }
        }

        private string ConvertTrangThai(Models.DonVi _donvi)
        {
            if (_donvi.DVTrangThai)
                return "Kích hoạt";
            else
                return "Khóa";
        }

        private string DonViTrucThuocTen(Models.DonVi _donvi)
        {
            if (_donvi.DonVi1 != null)
                return _donvi.DonVi1.DVTen;
            else
                return "";
        }

        public Models.DonVi Find_DonVi(int _donviID)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.DonVi donvi = db.DonVis.FirstOrDefault(x => x.DVID == _donviID);
            return donvi;
        }

        public IEnumerable<Models.NhanVien> Find_NhanVien_Of_DonVi(int _donviID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<NhanVien> nhanviens = (from nv in db.NhanViens
                                               join lv in db.LamViecs
                                               on nv.NVID equals lv.NVID
                                               where nv.LamViecs.OrderByDescending(x => x.LVTuNgay).FirstOrDefault().DVID == _donviID
                                               select nv).GroupBy(x => x.NVID).Select(x => x.FirstOrDefault());
            return nhanviens;
        }

        public void Insert(string _ten, string _noidung, int _bienche, bool _trangthai, int _donvitructhuocID, string _sdt, string _diachi)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DonVi donvi = new Models.DonVi();
            donvi.DVTen = _ten;
            donvi.DVNoiDung = _noidung;
            donvi.DVBienChe = _bienche;
            if (_donvitructhuocID != 0)
                donvi.DVTrucThuocID = _donvitructhuocID;
            donvi.DVTrangThai = _trangthai;
            donvi.DVSDT = _sdt;
            donvi.DVDiaChi = _diachi;
            db.DonVis.Add(donvi);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _donviID, string _ten, string _noidung, int _bienche, bool _trangthai, int _tructhuocID, string _sdt, string _diachi)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DonVi donvi = db.DonVis.FirstOrDefault(x => x.DVID == _donviID);
            donvi.DVTen = _ten;
            donvi.DVNoiDung = _noidung;
            donvi.DVBienChe = _bienche;
            donvi.DVTrangThai = _trangthai;
            if (_tructhuocID != 0)
                donvi.DVTrucThuocID = _tructhuocID;
            donvi.DVSDT = _sdt;
            donvi.DVDiaChi = _diachi;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _donviID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DonVi donvi = db.DonVis.FirstOrDefault(x => x.DVID == _donviID);
            db.DonVis.Remove(donvi);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {           
            _radgrid.DataSource = this.All.ToList();
        }

        public void Load_DataSource_RadDropDownTree(RadDropDownTree _radDropDownTree)
        {
            _radDropDownTree.DataFieldID = "DVID";
            _radDropDownTree.DataFieldParentID = "DVTrucThuocID";
            _radDropDownTree.DataValueField = "DVID";
            _radDropDownTree.DataTextField = "DVTen";
            _radDropDownTree.DataSource = this.All.ToList();
            _radDropDownTree.DataBind();
        }
    }
}