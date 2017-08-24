using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class NhaEntity
    {
        public NhaEntity() { }

        public string ConvertNha(Models.Nha _nha)
        {
            if (_nha.NHAIsNha)
                return "Nhà ở";
            else
                return "Công trình xây dựng khác";
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Nhas.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.NHAID).AsEnumerable().Select(x => new
            {
                NHAID = x.NHAID,
                NHADiaChi = x.NHADiaChi,
                NHALoai = x.NHALoai,
                NHACap = x.NHACap,
                NHADienTich = x.NHADienTich,
                NHAGiaTri = x.NHAGiaTri,
                NHAQuyenSoHuu = x.NHAQuyenSoHuu,
                NHAIsNha = this.ConvertNha(x)
            });
        }

        public Models.Nha Find(int _nhaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Nha nha = db.Nhas.FirstOrDefault(x => x.NHAID == _nhaID);
            return nha;
        }

        public void Insert(int _kekhaiID, string _diachi, string _loainha, string _cap, decimal _dientich, decimal _giatri, string _quyensohuu, string _ghichu, bool _nhao)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Nha nha = new Nha();
            nha.KKID = _kekhaiID;
            nha.NHADiaChi = _diachi;
            nha.NHALoai = _loainha;
            nha.NHACap = _cap;
            nha.NHADienTich = _dientich;
            nha.NHAGiaTri = _giatri;
            nha.NHAQuyenSoHuu = _quyensohuu;
            nha.NHAGhiChu = _ghichu;
            nha.NHAIsNha = _nhao;
            db.Nhas.Add(nha);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _nhaID, string _diachi, string _loainha, string _cap, decimal _dientich, decimal _giatri, string _quyensohuu, string _ghichu, bool _nhao)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Nha nha = db.Nhas.FirstOrDefault(x => x.NHAID == _nhaID);
            nha.NHADiaChi = _diachi;
            nha.NHALoai = _loainha;
            nha.NHACap = _cap;
            nha.NHADienTich = _dientich;
            nha.NHAGiaTri = _giatri;
            nha.NHAQuyenSoHuu = _quyensohuu;
            nha.NHAGhiChu = _ghichu;
            nha.NHAIsNha = _nhao;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _nhaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Nha nha = db.Nhas.FirstOrDefault(x => x.NHAID == _nhaID);
            db.Nhas.Remove(nha);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllNhaOfNhanVien_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}