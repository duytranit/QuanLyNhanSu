using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class LamViecEntity
    {
        public LamViecEntity() { }
        private Models.DonViEntity _donviEntity = new DonViEntity();

        private DateTime ConvertDenNgay(Models.LamViec _lamviec)
        {
            return (_lamviec.LVDenNgay != null && _lamviec.LVDenNgay != DateTime.MinValue) ?
                Convert.ToDateTime(_lamviec.LVDenNgay) :
                _lamviec.LVTuNgay.AddYears(_lamviec.HeSoLuong.Ngach.NGNamTangLuong);
        }

        public Models.LamViec Find(int _lamviecID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.LamViecs.FirstOrDefault(x => x.LVID == _lamviecID);
        }

        public IEnumerable<Models.LamViec> FindByDenNgayYear(int _year)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.LamViecs.ToList().Where(x => this.ConvertDenNgay(x).Year >= _year).OrderBy(x => x.DVID);
        }

        public IEnumerable<Models.LamViec> FindByDonViAndDenNgayYear(int _donviID, int _year)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.LamViecs.ToList().Where(x => x.DVID == _donviID && this.ConvertDenNgay(x).Year >= _year).OrderBy(x => x.DVID);
        }

        public int SoLuong_ChamCong(Models.LamViec _lamviec, int _loaichamcongID, int _nam)
        {
            int flag = 0;
            flag += _lamviec.ChamCongs.Where(x => x.LCCID == _loaichamcongID && x.CCDATE.Year == _nam).Count();
            return flag;
        }

        public decimal SoNgayPhepConLai(Models.LamViec _lamviec, int _nam)
        {
            decimal flag = _lamviec.LVSoNgayPhep;
            IEnumerable<Models.ChamCong> chamcongnghipheps = _lamviec.ChamCongs.Where(x => x.LCCID != 1 && 
            x.LCCID != 4 && x.LCCID != 7 && x.LCCID != 8 && x.LCCID != 9 && x.LCCID != 12 && x.LCCID != 13 && x.CCDATE.Year == _nam);
            flag -= chamcongnghipheps.Count();
            IEnumerable<Models.ChamCong> chamcongnghiphepnuangay = _lamviec.ChamCongs.Where(x => x.LCCID == 7 && x.CCDATE.Year == _nam);
            flag -= (chamcongnghiphepnuangay.Count() / 2);
            return flag;
        }

        private double LuongPC(Models.LamViec _lamviec)
        {
            return Convert.ToDouble((_lamviec.HeSoLuong.HSLHeSo + _lamviec.LVPhuCapChucVu + _lamviec.LVPhuCapCongVu + _lamviec.LVPhuCapDocHai +
                _lamviec.LVPhuCapKiemNhiem + _lamviec.LVPhuCapNghe + _lamviec.LVPhuCapThamNienNghe + _lamviec.LVPhuCapVuotKhung) * _lamviec.LVLuongCoBan * (_lamviec.LVTyLe/100)); 
        }

        private double BHXH (Models.LamViec _lamviec)
        {
            return this.LuongPC(_lamviec) * 8 / 100;
        }

        private double BHYT (Models.LamViec _lamviec)
        {
            return this.LuongPC(_lamviec) / 100 * 1.5;
        }

        private double BHTN (Models.LamViec _lamviec)
        {
            return this.LuongPC(_lamviec) * 1 / 100;
        }

        private double LuongThucLanh(Models.LamViec _lamviec)
        {
            return this.LuongPC(_lamviec) - (this.BHXH(_lamviec) + this.BHYT(_lamviec) + this.BHTN(_lamviec));
        }

        // ATTRIBUTES

        public IEnumerable<object> LamViecDenNgay(DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.NhanVienEntity nvEntity = new NhanVienEntity();
            return db.LamViecs.AsEnumerable().Select(x => new
            {
                NVID = x.NVID,
                NVHinh = nvEntity.DefaultImage(x.NhanVien),
                NVTen = x.NhanVien.NVTen,
                NVGioiTinh = nvEntity.ConvertGioiTinh(x.NhanVien.NVGioiTinh),
                NVNgaySinh = x.NhanVien.NVNgaySinh,
                NVTuoi = (DateTime.Now - x.NhanVien.NVNgaySinh).Days / 365,
                NVLamViecTuNgay = nvEntity.LamViecTuNgay(x.NhanVien),
                LVDenNgay = this.ConvertDenNgay(x),
                NVQueQuan = x.NhanVien.NVQueQuan,
                CVTen = x.ChucVu.CVTen,
                DVTen = x.DonVi.DVTen,
            }).Where(x => x.LVDenNgay >= DateTime.Now && x.LVDenNgay <= _ngay).OrderBy(x => x.LVDenNgay).AsEnumerable().Select(x => new
            {
                NVID = x.NVID,
                NVHinh = x.NVHinh,
                NVTen = x.NVTen,
                NVGioiTinh = x.NVGioiTinh,
                NVNgaySinh = x.NVNgaySinh,
                NVTuoi = x.NVTuoi,
                NVLamViecTuNgay = x.NVLamViecTuNgay,
                LVDenNgay = x.LVDenNgay.ToString("dd/MM/yyyy"),
                NVQueQuan = x.NVQueQuan,
                CVTen = x.CVTen,
                DVTen = x.DVTen,
            });
        }

        public IEnumerable<object> LamViec_Of_NhanVien(int _nhanvienID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.LamViecs.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.LVTuNgay).AsEnumerable().Select(x => new
            {
                LVID = x.LVID,
                DVTen = x.DonVi.DVTen,
                CVTen = x.ChucVu.CVTen,
                LVTuNgay = x.LVTuNgay,
                LVDenNgay = this.ConvertDenNgay(x),
                NGTen = x.HeSoLuong.Ngach.NGTen,
                BLTen = x.HeSoLuong.BacLuong.BLTen,
                LVHeSoLuong = x.HeSoLuong.HSLHeSo,
                LVLuongCoBan = x.LVLuongCoBan,
                LVNhiemVu = x.LVNhiemVu,
                LVPhuCapChucVu = x.LVPhuCapChucVu,
                LVPhuCapCongVu = x.LVPhuCapCongVu,
                LVPhuCapKiemNhiem = x.LVPhuCapKiemNhiem,
                LVPhuCapNghe = x.LVPhuCapNghe,
                LVPhuCapThamNienNghe = x.LVPhuCapThamNienNghe,
                LVPhuCapVuotKhung = x.LVPhuCapVuotKhung,
                LVPhuCapDocHai = x.LVPhuCapDocHai,
                LVTyLe = x.LVTyLe,
                LVLuongPC = this.LuongPC(x),
                LVBHXH = this.BHXH(x),
                LVBHYT = this.BHYT(x),
                LVBHTN = this.BHTN(x),
                LVLuongThucLanh = this.LuongThucLanh(x)
            });
        }

        public bool IsLastLamViec(Models.LamViec _lamviec)
        {
            bool flag = false;

            foreach (Models.LamViec lamviec in _lamviec.NhanVien.LamViecs)
                if (_lamviec.LVTuNgay > lamviec.LVTuNgay)
                {
                    flag = true;
                    break;
                }

            return flag;
        }

        public void Insert(int _nhanvienID, int _donviID, int _chucvuID,
            DateTime _tungay, DateTime _denngay, int _hesoluong,
            decimal _luongcoban, string _nhiemvu, 
            decimal _phucapchucvu, decimal _phucapcongvu, decimal _phucapkiemnhiem,
            decimal _phucapnghe, decimal _phucapthamnien, decimal _phucapvuotkhung,
            decimal _phucapdochai, decimal _tyle, int _songayphep, string _sohopdong, DateTime _ngayhopdong)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.LamViec lamviec = new LamViec();
            lamviec.NVID = _nhanvienID;
            lamviec.DVID = _donviID;
            lamviec.CVID = _chucvuID;
            lamviec.LVTuNgay = _tungay;
            if (_denngay != DateTime.MinValue)
                lamviec.LVDenNgay = _denngay;
            lamviec.LVLuongCoBan = _luongcoban;
            lamviec.LVNhiemVu = _nhiemvu;
            lamviec.LVPhuCapChucVu = _phucapchucvu;
            lamviec.LVPhuCapCongVu = _phucapcongvu;
            lamviec.LVPhuCapKiemNhiem = _phucapkiemnhiem;
            lamviec.LVPhuCapNghe = _phucapnghe;
            lamviec.LVPhuCapThamNienNghe = _phucapthamnien;
            lamviec.LVPhuCapVuotKhung = _phucapvuotkhung;
            lamviec.LVPhuCapDocHai = _phucapdochai;
            lamviec.LVTyLe = _tyle;
            lamviec.HSLID = _hesoluong;
            lamviec.LVSoNgayPhep = _songayphep;
            lamviec.LVSoHopDong = _sohopdong;
            if (_ngayhopdong != DateTime.MinValue)
                lamviec.LVNgayHopDong = _ngayhopdong;
            db.LamViecs.Add(lamviec);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _lamviecID, int _donviID, int _chucvuID,
            DateTime _tungay, DateTime _denngay, int _hesoluong,
            decimal _luongcoban, string _nhiemvu,
            decimal _phucapchucvu, decimal _phucapcongvu, decimal _phucapkiemnhiem,
            decimal _phucapnghe, decimal _phucapthamnien, decimal _phucapvuotkhung,
            decimal _phucapdochai, decimal _tyle, int _songayphep, string _sohopdong, DateTime _ngayhopdong)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.LamViec lamviec = db.LamViecs.FirstOrDefault(x => x.LVID == _lamviecID);
            lamviec.DVID = _donviID;
            lamviec.CVID = _chucvuID;
            lamviec.LVTuNgay = _tungay;
            if (_denngay != DateTime.MinValue)
                lamviec.LVDenNgay = _denngay;
            else
                lamviec.LVDenNgay = null;
            lamviec.LVLuongCoBan = _luongcoban;
            lamviec.LVNhiemVu = _nhiemvu;
            lamviec.LVPhuCapChucVu = _phucapchucvu;
            lamviec.LVPhuCapCongVu = _phucapcongvu;
            lamviec.LVPhuCapKiemNhiem = _phucapkiemnhiem;
            lamviec.LVPhuCapNghe = _phucapnghe;
            lamviec.LVPhuCapThamNienNghe = _phucapthamnien;
            lamviec.LVPhuCapVuotKhung = _phucapvuotkhung;
            lamviec.LVPhuCapDocHai = _phucapdochai;
            lamviec.LVTyLe = _tyle;
            lamviec.HSLID = _hesoluong;
            lamviec.LVSoNgayPhep = _songayphep;
            lamviec.LVSoHopDong = _sohopdong;
            if (_ngayhopdong != DateTime.MinValue)
                lamviec.LVNgayHopDong = _ngayhopdong;
            else
                lamviec.LVNgayHopDong = null;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _lamviecID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.LamViec lamviec = db.LamViecs.FirstOrDefault(x => x.LVID == _lamviecID);
            db.LamViecs.Remove(lamviec);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATA SOURCE
        public void Load_AllLamViecOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.LamViec_Of_NhanVien(_nhanvienID).ToList();
        }

        public void Load_LamViecDenNgay_ToRadGrid(RadGrid _rg, DateTime _ngay)
        {
            _rg.DataSource = this.LamViecDenNgay(_ngay).ToList();
        }
    }
}