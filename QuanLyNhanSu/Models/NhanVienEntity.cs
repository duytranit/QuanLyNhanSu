using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class NhanVienEntity
    {
        public NhanVienEntity() { }

        public Models.NhanVien LastNhanVien
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.NhanViens.OrderByDescending(x => x.NVID).FirstOrDefault();
            }
        }

        public IEnumerable<Models.NhanVien> AllNhanVienModels
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.NhanViens.OrderBy(x => x.NVTen);
            }
        }

        public IEnumerable<object> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.NhanViens.OrderBy(x => x.NVTen).AsEnumerable().Select(x => new
                {
                    NVID = x.NVID,
                    NVFullName = x.NVTen + " - CMND:" + x.NVCMND,
                });
            }
        }

        private Models.DonVi DonVi(Models.NhanVien _nhanvien)
        {
            return _nhanvien.LamViecs.OrderByDescending(x => x.LVTuNgay).FirstOrDefault().DonVi;
        }

        public string DefaultImage(Models.NhanVien _nhanvien)
        {
            string image = "DefaultUser.png";
            if (_nhanvien.NVHinh != null)
                image = _nhanvien.NVHinh;
            return image;
        }

        public string ConvertGioiTinh(bool _gioitinh)
        {
            if (_gioitinh)
                return "Nam";
            else
                return "Nữ";
        }

        private string DonViTen(Models.NhanVien _nhanvien)
        {
            Models.LamViec lamviec = this.Last_LamViec_Of_NhanVien(_nhanvien);
            if (lamviec == null)
                return "";
            else
                return lamviec.DonVi.DVTen;
        }

        private string ChucVuTen(Models.NhanVien _nhanvien)
        {
            Models.LamViec lamviec = this.Last_LamViec_Of_NhanVien(_nhanvien);
            if (lamviec == null)
                return "";
            else
                return lamviec.ChucVu.CVTen;
        }

        public string LamViecTuNgay(Models.NhanVien _nhanvien)
        {
            Models.LamViec lamviec = this.Last_LamViec_Of_NhanVien(_nhanvien);
            if (lamviec == null || lamviec.LVTuNgay == DateTime.MinValue)
                return "";
            else
                return lamviec.LVTuNgay.ToString("dd/MM/yyyy");
        }

        public Models.LamViec Last_LamViec_Of_NhanVien(Models.NhanVien _nhanvien)
        {
            Models.LamViec lamviec = _nhanvien.LamViecs.OrderByDescending(x => x.LVTuNgay).FirstOrDefault();
            return lamviec;
        }

        public string TCCTXH_DangThamGia(Models.NhanVien _nhanvien)
        {
            string ten = "";
            foreach (Models.ThamGiaChinhTriXaHois tg in _nhanvien.ThamGiaChinhTriXaHois)
                if (tg.TGCTXHDenNgay == null || tg.TGCTXHDenNgay > DateTime.Now)
                    ten += (tg.ChinhTriXaHois.CTXHTen + ";");
            return ten;
        }

        public Models.LamViec Last_LamViec_Of_NhanVien_At_DonVi(int _nhanvienID, int _donviID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.LamViec lamviec = db.LamViecs.OrderByDescending(x => x.LVTuNgay).Where(x => x.NVID == _nhanvienID && x.DVID == _donviID).FirstOrDefault();
            return lamviec;
        }

        public Models.NhanVien Find_NhanVien(int _nhanvienID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.NhanViens.FirstOrDefault(x => x.NVID == _nhanvienID);
        }        

        public void Insert(string _ten, string _tenkhac, DateTime _ngaysinh, bool _gioitinh, int _dantocID, int _tongiaoID, string _hokhau, string _noio, int _gdptID, int _chuyenmonID, int _llctID, 
            int _qlnnID, string _ttsk, decimal _chieucao, decimal _cannang, int _nhommauID, string _cmnd, DateTime _cmndNgay, string _noisinh, string _quequan, string _chuyennganh, FileUpload _fileUploadImage, string _bhxh)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.NhanVien nhanvien = new Models.NhanVien();
            nhanvien.NVTen = _ten;
            nhanvien.NVTenKhac = _tenkhac;
            nhanvien.NVNgaySinh = _ngaysinh;
            nhanvien.NVGioiTinh = _gioitinh;
            nhanvien.DTID = _dantocID;
            nhanvien.TGID = _tongiaoID;
            nhanvien.NVHoKhau = _hokhau;
            nhanvien.NVNoiO = _noio;
            nhanvien.NVBHXH = _bhxh;
            nhanvien.GDPTID = _gdptID;
            nhanvien.CMID = _chuyenmonID;
            nhanvien.LLCTID = _llctID;
            nhanvien.QLNNID = _qlnnID;
            nhanvien.NVTinhTrangSucKhoe = _ttsk;
            if (_chieucao > 0)
                nhanvien.NVChieuCao = _chieucao;
            if (_cannang > 0)
                nhanvien.NVCanNang = _cannang;
            nhanvien.NMID = _nhommauID;
            nhanvien.NVCMND = _cmnd;
            if (_cmndNgay != null && _cmndNgay != DateTime.MinValue)
                nhanvien.NVNgayCapCMND = _cmndNgay;
            nhanvien.NVNoiSinh = _noisinh;
            nhanvien.NVQueQuan = _quequan;
            nhanvien.NVNganh = _chuyennganh;

            if (_fileUploadImage.HasFile)
            {
                Helper.FileHelper _fileHelper = new Helper.FileHelper();
                string extension = System.IO.Path.GetExtension(_fileUploadImage.PostedFile.FileName);
                string imageName = _fileHelper.SetFileUploadedName(extension);
                nhanvien.NVHinh = imageName;
                _fileHelper.SaveFile(_fileUploadImage, "Images\\NhanVien\\", imageName);
            }
            else
            {
                nhanvien.NVHinh = "DefaultUser.png";
            }

            db.NhanViens.Add(nhanvien);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _nhanvienID, string _ten, string _tenkhac, DateTime _ngaysinh, bool _gioitinh, int _dantocID, int _tongiaoID, string _hokhau, string _noio, int _gdptID,
            int _chuyenmonID, int _llctID, int _qlnnID, string _ttsk, decimal _chieucao, decimal _cannang, int _nhommauID,string _cmnd, DateTime _cmndNgay, string _noisinh, string _quequan, string _nganh, 
            FileUpload _fileuploadImage, bool _useDefaultImage, string _bhxh)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.NhanVien nhanvien = db.NhanViens.FirstOrDefault(x => x.NVID == _nhanvienID);

            nhanvien.NVTen = _ten;
            nhanvien.NVTenKhac = _tenkhac;
            nhanvien.NVNgaySinh = _ngaysinh;
            nhanvien.NVGioiTinh = _gioitinh;
            nhanvien.DTID = _dantocID;
            nhanvien.TGID = _tongiaoID;
            nhanvien.NVHoKhau = _hokhau;
            nhanvien.NVNoiO = _noio;
            nhanvien.NVBHXH = _bhxh;
            nhanvien.GDPTID = _gdptID;
            nhanvien.CMID = _chuyenmonID;
            nhanvien.LLCTID = _llctID;
            nhanvien.QLNNID = _qlnnID;
            nhanvien.NVTinhTrangSucKhoe = _ttsk;
            if (_chieucao > 0)
                nhanvien.NVChieuCao = _chieucao;
            else
                nhanvien.NVChieuCao = null;
            if (_cannang > 0)
                nhanvien.NVCanNang = _cannang;
            else
                nhanvien.NVCanNang = null;
            nhanvien.NMID = _nhommauID;
            nhanvien.NVCMND = _cmnd;
            if (_cmndNgay != null && _cmndNgay != DateTime.MinValue)
                nhanvien.NVNgayCapCMND = _cmndNgay;
            else
                nhanvien.NVNgayCapCMND = null;
            nhanvien.NVQueQuan = _quequan;
            nhanvien.NVNganh = _nganh;            

            if (_useDefaultImage)
            {
                Helper.FileHelper fileHelper = new Helper.FileHelper();
                if ((nhanvien.NVHinh != null) && (!nhanvien.NVHinh.Equals("DefaultUser.png")))
                    fileHelper.DeleteFile("Images\\NhanVien\\" + nhanvien.NVHinh);
                nhanvien.NVHinh = null;
            }
            else if (_fileuploadImage.HasFile)
            {
                Helper.FileHelper fileHelper = new Helper.FileHelper();
                if ((nhanvien.NVHinh != null) && (!nhanvien.NVHinh.Equals("DefaultUser.png")))
                    fileHelper.DeleteFile("Images\\NhanVien\\" + nhanvien.NVHinh);

                Helper.FileHelper _fileHelper = new Helper.FileHelper();
                string extension = System.IO.Path.GetExtension(_fileuploadImage.PostedFile.FileName);
                string imageName = _fileHelper.SetFileUploadedName(extension);
                nhanvien.NVHinh = imageName;
                _fileHelper.SaveFile(_fileuploadImage, "Images\\NhanVien\\", imageName);
            }

            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _nhanvienID)
        {
            Helper.FileHelper fileHelper = new Helper.FileHelper();
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.NhanVien nhanvien = db.NhanViens.FirstOrDefault(x => x.NVID == _nhanvienID);
            if ((nhanvien.NVHinh != null) && (!nhanvien.NVHinh.Equals("DefaultUser.png")))
                fileHelper.DeleteFile("Images\\NhanVien\\" + nhanvien.NVHinh);
            db.NhanViens.Remove(nhanvien);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<object> nhanviens = db.NhanViens.AsEnumerable().Select(x => new
            {
                NVID = x.NVID,
                NVHinh = this.DefaultImage(x),
                NVTen = x.NVTen,
                NVGioiTinh = this.ConvertGioiTinh(x.NVGioiTinh),
                NVNgaySinh = x.NVNgaySinh,
                NVTuoi = (DateTime.Now - x.NVNgaySinh).Days / 365,
                NVLamViecTuNgay = this.LamViecTuNgay(x),
                NVQueQuan = x.NVQueQuan,
                CVTen = this.ChucVuTen(x),
                DVTen = this.DonViTen(x),
            });
            _radgrid.DataSource = nhanviens.ToList();
        }

        public void Load_DataSource_Of_DonVi_RadGrid(RadGrid _radgrid, int _donviID)
        {
            Models.DonViEntity donviEntity = new DonViEntity();
            IEnumerable<object> nhanviens = donviEntity.Find_NhanVien_Of_DonVi(_donviID).AsEnumerable().Select(x => new
            {
                NVID = x.NVID,
                NVHinh = this.DefaultImage(x),
                NVTen = x.NVTen,
                NVGioiTinh = this.ConvertGioiTinh(x.NVGioiTinh),
                NVNgaySinh = x.NVNgaySinh,
                NVTuoi = (DateTime.Now - x.NVNgaySinh).Days / 365,
                NVLamViecTuNgay = this.Last_LamViec_Of_NhanVien_At_DonVi(x.NVID, _donviID).LVTuNgay,
                NVLamViecNgheNghiep = this.Last_LamViec_Of_NhanVien_At_DonVi(x.NVID, _donviID).LVNhiemVu,
                //NVLamViecChucVu = this.Last_LamViec_Of_NhanVien_At_DonVi(x.NVID, _donviID).ChucVu.CVTen,
                CVTen = this.Last_LamViec_Of_NhanVien_At_DonVi(x.NVID, _donviID).ChucVu.CVTen,
                NVTGCTXH = this.TCCTXH_DangThamGia(x)
            });
            _radgrid.DataSource = nhanviens.ToList();
        }

        public void Load_AllNhanVien_ToRadComboBox(RadComboBox _cbb)
        {
            _cbb.DataSource = this.All.ToList();
            _cbb.DataTextField = "NVFullName";
            _cbb.DataValueField = "NVID";
            _cbb.DataBind();
        }

        public void Load_AllNhanVienDonVi_ToRadDropDownTree(RadDropDownTree _ddt)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.DonVi> donvis = db.DonVis;

            List<object> list = new List<object>();

            foreach(Models.DonVi dv in donvis)
            {
                var item = new
                {
                    ID = dv.DVID,
                    Ten = dv.DVTen,
                    Value = "",
                    Thuoc = dv.DVTrucThuocID
                };
                list.Add(item);
            }

            IEnumerable<Models.NhanVien> nhanviens = db.NhanViens.Where(x => x.LamViecs.Count > 0);
            foreach(Models.NhanVien nv in nhanviens)
            {
                var item = new
                {
                    ID = "",
                    Ten = nv.NVTen,
                    Value = nv.NVID,
                    Thuoc = this.DonVi(nv).DVID,
                };
                list.Add(item);
            }

            _ddt.DataSource = list;
            _ddt.DataTextField = "Ten";
            _ddt.DataValueField = "Value";
            _ddt.DataFieldParentID = "Thuoc";
            _ddt.DataFieldID = "ID";
            _ddt.DataBind();

        }
    }
}