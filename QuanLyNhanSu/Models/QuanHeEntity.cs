using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class QuanHeEntity
    {
        public QuanHeEntity() { }

        private string ConvertGioiTinh(Models.QuanHe _quanhe)
        {
            if (_quanhe.QHGioiTinh)
                return "Nam";
            else
                return "Nữ";
        }

        public Models.QuanHe Find(int _quanheID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.QuanHes.FirstOrDefault(x => x.QHID == _quanheID);
        }

        public void Insert(int _nhanvienID, string _ten, DateTime _ngaysinh, string _noio, int _loaiquanheID, bool _benvo, string _hokhau, bool _gioitinh)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.QuanHe quanhe = new Models.QuanHe();
            quanhe.NVID = _nhanvienID;
            quanhe.QHTen = _ten;
            quanhe.QHNgaySinh = _ngaysinh;
            quanhe.QHNoiO = _noio;
            quanhe.LQHID = _loaiquanheID;
            quanhe.QHBenVo = _benvo;
            quanhe.QHHoKhau = _hokhau;
            quanhe.QHGioiTinh = _gioitinh;
            db.QuanHes.Add(quanhe);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _quanheID, string _ten, DateTime _ngaysinh, string _noio, int _loaiquanheID, bool _benvo, string _hokhau, bool _gioitinh)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.QuanHe quanhe = db.QuanHes.FirstOrDefault(x => x.QHID == _quanheID);
            quanhe.QHTen = _ten;
            quanhe.QHNgaySinh = _ngaysinh;
            quanhe.QHNoiO = _noio;
            quanhe.LQHID = _loaiquanheID;
            quanhe.QHBenVo = _benvo;
            quanhe.QHHoKhau = _hokhau;
            quanhe.QHGioiTinh = _gioitinh;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _quanheID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.QuanHe quanhe = db.QuanHes.FirstOrDefault(x => x.QHID == _quanheID);
            db.QuanHes.Remove(quanhe);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_RadGrid(RadGrid _radgrid, int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            IEnumerable<object> qhs = db.QuanHes.Where(x => x.NVID == _nhanvienID).AsEnumerable().Select(x => new
            {
                QHID = x.QHID,
                QHTen = x.QHTen,
                QHNgaySinh = x.QHNgaySinh,
                LQHTen = x.LoaiQuanHe.LQHTen,
                QHBenVo = x.QHBenVo,
                QHGioiTinh = this.ConvertGioiTinh(x),
                QHHoKhau = x.QHHoKhau,
                QHNoiO = x.QHNoiO
            });
            _radgrid.DataSource = qhs.ToList();
        }
    }
}