using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class KeKhaiEntity
    {
        public KeKhaiEntity() { }

        private IEnumerable<Models.KeKhai> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KeKhais.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.KKNam);
        }

        public Models.KeKhai Find(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KeKhais.FirstOrDefault(x => x.KKID == _kekhaiID);
        }

        public void Insert(int _nhanvienID, int _nam, DateTime _ngaykekhai, DateTime _ngaynhap, string _chucvu, string _coquan, string _hokhau, 
            string _choo, string _vochong, DateTime _vcDOB, string _vcChucVu, string _vcCoQuan, string _vcHoKhau, string _vcChoO)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhai kekhai = new KeKhai();
            kekhai.NVID = _nhanvienID;
            kekhai.KKNam = _nam;
            kekhai.KKNgayKeKhai = _ngaykekhai;
            kekhai.KKNgayNhap = _ngaynhap;
            kekhai.KKChucVu = _chucvu;
            kekhai.KKCoQuan = _coquan;
            kekhai.KKHoKhau = _hokhau;
            kekhai.KKChoO = _choo;
            kekhai.KKVoChong = _vochong;
            kekhai.KKVCDOB = _vcDOB;
            kekhai.KKVCChucVu = _vcChucVu;
            kekhai.KKVCCoQuan = _vcCoQuan;
            kekhai.KKVCHoKhau = _vcHoKhau;
            kekhai.KKVCChoO = _vcChoO;
            db.KeKhais.Add(kekhai);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _kekhaiID, int _nam, DateTime _ngaykekhai, DateTime _ngaynhap, string _chucvu, string _coquan, string _hokhau,
            string _choo, string _vochong, DateTime _vcDOB, string _vcChucVu, string _vcCoQuan, string _vcHoKhau, string _vcChoO)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhai kekhai = db.KeKhais.FirstOrDefault(x => x.KKID == _kekhaiID);
            kekhai.KKNam = _nam;
            kekhai.KKNgayKeKhai = _ngaykekhai;
            kekhai.KKNgayNhap = _ngaynhap;
            kekhai.KKChucVu = _chucvu;
            kekhai.KKCoQuan = _coquan;
            kekhai.KKHoKhau = _hokhau;
            kekhai.KKChoO = _choo;
            kekhai.KKVoChong = _vochong;
            kekhai.KKVCDOB = _vcDOB;
            kekhai.KKVCChucVu = _vcChucVu;
            kekhai.KKVCCoQuan = _vcCoQuan;
            kekhai.KKVCHoKhau = _vcHoKhau;
            kekhai.KKVCChoO = _vcChoO;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhai kekhai = db.KeKhais.FirstOrDefault(x => x.KKID == _kekhaiID);
            db.KeKhais.Remove(kekhai);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllKeKhaiOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvien)
        {
            _rg.DataSource = this.All(_nhanvien).ToList();
        }
    }
}