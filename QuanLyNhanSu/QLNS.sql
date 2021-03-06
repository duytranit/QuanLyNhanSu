USE [EmployeeManagement]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[ACCID] [int] IDENTITY(1,1) NOT NULL,
	[ACCEmail] [varchar](50) NOT NULL,
	[ACCPassword] [varchar](max) NOT NULL,
	[ACCChucNang] [int] NOT NULL DEFAULT ((2)),
	[ACCStatus] [bit] NOT NULL DEFAULT ((0)),
	[ACCUpThongTinCaNhan] [bit] NOT NULL DEFAULT ((0)),
	[ACCUpLyLich] [bit] NOT NULL DEFAULT ((0)),
	[ACCInLyLich] [bit] NOT NULL DEFAULT ((0)),
	[ACCInKeKhai] [bit] NOT NULL DEFAULT ((0)),
	[ACCUpKeKhai] [bit] NOT NULL DEFAULT ((0)),
	[ACCInDanhGia] [bit] NOT NULL DEFAULT ((0)),
	[ACCUpDanhGia] [bit] NOT NULL DEFAULT ((0)),
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ACCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BacLuongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacLuongs](
	[BLID] [int] IDENTITY(1,1) NOT NULL,
	[BLTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BacLuongs] PRIMARY KEY CLUSTERED 
(
	[BLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChamCongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongs](
	[CCID] [int] IDENTITY(1,1) NOT NULL,
	[LVID] [int] NOT NULL,
	[CCDATE] [date] NOT NULL,
	[LCCID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChinhSaches]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChinhSaches](
	[CSID] [int] IDENTITY(1,1) NOT NULL,
	[CSTen] [nvarchar](max) NOT NULL,
	[CSNgay] [date] NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_ChinhSaches] PRIMARY KEY CLUSTERED 
(
	[CSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChinhTriXaHois]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChinhTriXaHois](
	[CTXHID] [int] IDENTITY(1,1) NOT NULL,
	[CTXHTen] [nvarchar](50) NOT NULL,
	[CTXHDiaChi] [nvarchar](max) NULL,
	[CTXHDienThoai] [varchar](50) NULL,
	[CTXHFax] [varchar](50) NULL,
	[CTXHEmail] [varchar](50) NULL,
	[CTXHWebsite] [varchar](max) NULL,
	[CTXHGioiThieu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChinhTriXaHois] PRIMARY KEY CLUSTERED 
(
	[CTXHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVus]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVus](
	[CVID] [int] IDENTITY(1,1) NOT NULL,
	[CVTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChucVus] PRIMARY KEY CLUSTERED 
(
	[CVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuyenMons]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMons](
	[CMID] [int] IDENTITY(1,1) NOT NULL,
	[CMTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuyenMons] PRIMARY KEY CLUSTERED 
(
	[CMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanTocs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanTocs](
	[DTID] [int] IDENTITY(1,1) NOT NULL,
	[DTTen] [nvarchar](50) NOT NULL,
	[DTThieuSo] [bit] NOT NULL,
 CONSTRAINT [PK_DanTocs] PRIMARY KEY CLUSTERED 
(
	[DTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGiaDangViens]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaDangViens](
	[DGDVID] [int] IDENTITY(1,1) NOT NULL,
	[DGDVChucVuDang] [nvarchar](max) NOT NULL,
	[DGDVChucVuChinhQuyen] [nvarchar](max) NOT NULL,
	[DGDVDonVi] [nvarchar](max) NOT NULL,
	[DGDVChiBo] [nvarchar](max) NOT NULL,
	[DGDVHangChucDanh] [nvarchar](max) NOT NULL,
	[DGDVBac] [int] NOT NULL,
	[DGDVHeSoLuong] [decimal](18, 2) NOT NULL,
	[DGDVUuDiem] [ntext] NOT NULL,
	[DGDVKetQuaKhacPhuc] [ntext] NOT NULL,
	[DGDVKhuyetDiem] [ntext] NOT NULL,
	[DGDVPhuongHuong] [ntext] NOT NULL,
	[DGDVDanhGia] [nvarchar](max) NOT NULL,
	[DGDVNam] [int] NOT NULL,
	[DGDVNgayThang] [date] NOT NULL,
	[NVID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DGDVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGiaLaoDongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaLaoDongs](
	[DGLDID] [int] IDENTITY(1,1) NOT NULL,
	[DGLDNam] [int] NOT NULL,
	[DGLDChucDanh] [nvarchar](max) NOT NULL,
	[DGLDDonVi] [nvarchar](max) NOT NULL,
	[DGLDNgheNghiep] [nvarchar](max) NOT NULL,
	[DGLDBac] [int] NOT NULL,
	[DGLDHeSoLuong] [decimal](18, 2) NOT NULL,
	[DGLDKetQua] [ntext] NOT NULL,
	[DGLDDaoDuc] [ntext] NOT NULL,
	[DGLDTrachNhiem] [ntext] NOT NULL,
	[DGLDNghiaVu] [ntext] NOT NULL,
	[DGLDUuDiem] [ntext] NOT NULL,
	[DGLDPhanLoai] [nvarchar](max) NOT NULL,
	[DGLDYKien] [ntext] NULL,
	[DGLDThongNhat] [nvarchar](max) NULL,
	[DGLDNgay] [date] NOT NULL,
	[NVID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DGLDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGias]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGias](
	[DGID] [int] IDENTITY(1,1) NOT NULL,
	[DGNoiDung] [nvarchar](max) NOT NULL,
	[DGNgay] [date] NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_DanhGias] PRIMARY KEY CLUSTERED 
(
	[DGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGiaVienChucs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaVienChucs](
	[DGVCID] [int] IDENTITY(1,1) NOT NULL,
	[DGVCNam] [int] NOT NULL,
	[DGVCChucDanh] [nvarchar](max) NOT NULL,
	[DGVCDonVi] [nvarchar](max) NOT NULL,
	[DGVCNgheNghiep] [nvarchar](max) NOT NULL,
	[DGVCBac] [int] NOT NULL,
	[DGVCHeSoLuong] [decimal](18, 2) NOT NULL,
	[DGVCKetQua] [ntext] NOT NULL,
	[DGVCDaoDuc] [ntext] NOT NULL,
	[DGVCTrachNhiem] [ntext] NOT NULL,
	[DGVCNghiaVu] [ntext] NOT NULL,
	[DGVCUuDiem] [ntext] NOT NULL,
	[DGVCPhanLoai] [nvarchar](max) NOT NULL,
	[DGVCYKien] [ntext] NULL,
	[DGVCThongNhat] [nvarchar](max) NULL,
	[DGVCNgay] [date] NOT NULL,
	[NVID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DGVCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DaQuis]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaQuis](
	[DQID] [int] IDENTITY(1,1) NOT NULL,
	[DQTen] [nvarchar](max) NOT NULL,
	[DQSoLuong] [decimal](18, 2) NOT NULL,
	[DQGiaTri] [money] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DQID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dats]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dats](
	[DATID] [int] IDENTITY(1,1) NOT NULL,
	[DATDiaChi] [nvarchar](max) NOT NULL,
	[DATDienTich] [float] NOT NULL,
	[DATGiaTri] [bigint] NOT NULL,
	[DATQuyenSoHuu] [nvarchar](max) NOT NULL,
	[DATGhiChu] [nvarchar](max) NULL,
	[KKID] [int] NOT NULL,
 CONSTRAINT [PK_Dats] PRIMARY KEY CLUSTERED 
(
	[DATID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonVis]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonVis](
	[DVID] [int] IDENTITY(1,1) NOT NULL,
	[DVTen] [nvarchar](50) NOT NULL,
	[DVTrucThuocID] [int] NULL,
	[DVTrangThai] [bit] NOT NULL,
	[DVNoiDung] [nvarchar](max) NULL,
	[DVBienChe] [int] NULL,
	[DVSDT] [varchar](50) NULL,
	[DVDiaChi] [nvarchar](max) NULL,
 CONSTRAINT [PK_DonVis] PRIMARY KEY CLUSTERED 
(
	[DVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DongSans]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongSans](
	[DSID] [int] IDENTITY(1,1) NOT NULL,
	[KKID] [int] NOT NULL,
	[DSTen] [nvarchar](max) NOT NULL,
	[DSSoLuong] [decimal](18, 2) NOT NULL,
	[DSGiaTri] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaiTrinhs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaiTrinhs](
	[GTID] [int] IDENTITY(1,1) NOT NULL,
	[GTSoLuong] [decimal](18, 2) NOT NULL,
	[GTIsTang] [bit] NOT NULL,
	[GTNoiDung] [nvarchar](max) NULL,
	[KKID] [int] NOT NULL,
	[LGTID] [int] NOT NULL,
 CONSTRAINT [PK_GiaiTrinhs] PRIMARY KEY CLUSTERED 
(
	[GTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoDucPhoThongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDucPhoThongs](
	[GDPTID] [int] IDENTITY(1,1) NOT NULL,
	[GDPTTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GiaoDucPhoThongs] PRIMARY KEY CLUSTERED 
(
	[GDPTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeSoLuongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeSoLuongs](
	[HSLID] [int] IDENTITY(1,1) NOT NULL,
	[BLID] [int] NOT NULL,
	[NGID] [int] NOT NULL,
	[HSLHeSo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_HeSoLuongs] PRIMARY KEY CLUSTERED 
(
	[HSLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeKhaiCons]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeKhaiCons](
	[KKCID] [int] IDENTITY(1,1) NOT NULL,
	[KKID] [int] NOT NULL,
	[KKCTen] [nvarchar](max) NOT NULL,
	[KKCDOB] [date] NOT NULL,
	[KKCHoKhau] [nvarchar](max) NOT NULL,
	[KKCChoO] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KKCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeKhais]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeKhais](
	[KKID] [int] IDENTITY(1,1) NOT NULL,
	[KKNam] [int] NOT NULL,
	[KKNgayKeKhai] [date] NULL,
	[KKNgayNhap] [date] NULL,
	[NVID] [int] NOT NULL,
	[KKChucVu] [nvarchar](max) NOT NULL,
	[KKCoQuan] [nvarchar](max) NOT NULL,
	[KKHoKhau] [nvarchar](max) NOT NULL,
	[KKChoO] [nvarchar](max) NOT NULL,
	[KKVoChong] [nvarchar](max) NULL,
	[KKVCDOB] [date] NULL,
	[KKVCChucVu] [nvarchar](max) NULL,
	[KKVCCoQuan] [nvarchar](max) NULL,
	[KKVCHoKhau] [nvarchar](max) NULL,
	[KKVCChoO] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[KKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyLuats]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyLuats](
	[KLID] [int] IDENTITY(1,1) NOT NULL,
	[KLNgay] [datetime] NOT NULL,
	[KLNoiDung] [nvarchar](max) NOT NULL,
	[KLCap] [nvarchar](50) NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_KyLuats] PRIMARY KEY CLUSTERED 
(
	[KLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhenThuongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuongs](
	[KTID] [int] IDENTITY(1,1) NOT NULL,
	[KTNgay] [datetime] NOT NULL,
	[KTNoiDung] [nvarchar](max) NOT NULL,
	[KTCapQuyetDinh] [nvarchar](max) NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_KhenThuongs] PRIMARY KEY CLUSTERED 
(
	[KTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoanNos]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoanNos](
	[KNID] [int] IDENTITY(1,1) NOT NULL,
	[KNTen] [nvarchar](max) NOT NULL,
	[KNSoLuong] [decimal](18, 2) NOT NULL,
	[KNGiaTri] [money] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LamViecs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LamViecs](
	[LVID] [int] IDENTITY(1,1) NOT NULL,
	[DVID] [int] NOT NULL,
	[NVID] [int] NOT NULL,
	[LVTuNgay] [date] NOT NULL,
	[LVDenNgay] [date] NULL,
	[CVID] [int] NOT NULL,
	[LVNhiemVu] [nvarchar](max) NULL,
	[LVPhuCapChucVu] [decimal](18, 2) NOT NULL,
	[LVPhuCapCongVu] [decimal](18, 2) NOT NULL,
	[LVPhuCapKiemNhiem] [decimal](18, 2) NOT NULL,
	[LVPhuCapNghe] [decimal](18, 2) NOT NULL,
	[LVPhuCapThamNienNghe] [decimal](18, 2) NOT NULL,
	[LVPhuCapVuotKhung] [decimal](18, 2) NOT NULL,
	[LVPhuCapDocHai] [decimal](18, 2) NOT NULL,
	[LVLuongCoBan] [decimal](18, 0) NOT NULL,
	[LVTyLe] [decimal](18, 2) NOT NULL DEFAULT ((100)),
	[LVThuoc] [int] NULL,
	[LVSoNgayPhep] [int] NOT NULL DEFAULT ((12)),
	[LVSoHopDong] [nvarchar](50) NULL,
	[LVNgayHopDong] [date] NULL,
	[HSLID] [int] NOT NULL,
 CONSTRAINT [PK_LamViecs] PRIMARY KEY CLUSTERED 
(
	[LVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiChamCong]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiChamCong](
	[LCCID] [int] IDENTITY(1,1) NOT NULL,
	[LCCTen] [nvarchar](max) NOT NULL,
	[LCCKyHieu] [nvarchar](50) NOT NULL,
	[LCCGhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[LCCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiGiaiTrinhs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGiaiTrinhs](
	[LGTID] [int] IDENTITY(1,1) NOT NULL,
	[LGTTen] [nvarchar](max) NOT NULL,
	[LGTTenChung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LoaiGiaiTrinhs] PRIMARY KEY CLUSTERED 
(
	[LGTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiQuanHes]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuanHes](
	[LQHID] [int] IDENTITY(1,1) NOT NULL,
	[LQHTen] [nvarchar](max) NOT NULL,
	[LQHDuyNhat] [bit] NOT NULL,
 CONSTRAINT [PK_LoaiQuanHes] PRIMARY KEY CLUSTERED 
(
	[LQHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LyLuanChinhTris]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LyLuanChinhTris](
	[LLCTID] [int] IDENTITY(1,1) NOT NULL,
	[LLCTTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LyLuanChinhTris] PRIMARY KEY CLUSTERED 
(
	[LLCTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ngaches]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ngaches](
	[NGID] [int] IDENTITY(1,1) NOT NULL,
	[NGTen] [nvarchar](max) NOT NULL,
	[NGNoiDung] [nvarchar](max) NULL,
	[NGNamTangLuong] [int] NOT NULL,
	[NGMa] [nvarchar](7) NULL,
 CONSTRAINT [PK_Ngaches] PRIMARY KEY CLUSTERED 
(
	[NGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanViens]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanViens](
	[NVID] [int] IDENTITY(1,1) NOT NULL,
	[NVTen] [nvarchar](50) NOT NULL,
	[NVTenKhac] [nvarchar](50) NULL,
	[NVNgaySinh] [datetime] NOT NULL,
	[DTID] [int] NOT NULL,
	[TGID] [int] NOT NULL,
	[NVHoKhau] [nvarchar](max) NOT NULL,
	[NVNoiO] [nvarchar](max) NOT NULL,
	[GDPTID] [int] NOT NULL,
	[CMID] [int] NOT NULL,
	[LLCTID] [int] NOT NULL,
	[QLNNID] [int] NOT NULL,
	[NVSoTruong] [nvarchar](max) NULL,
	[NVTinhTrangSucKhoe] [nvarchar](50) NULL,
	[NVChieuCao] [decimal](18, 2) NULL,
	[NVCanNang] [decimal](18, 2) NULL,
	[NMID] [int] NOT NULL,
	[NVCMND] [varchar](50) NULL,
	[NVNgayCapCMND] [datetime] NULL,
	[NVHinh] [varchar](max) NULL,
	[NVGioiTinh] [bit] NOT NULL,
	[NVQueQuan] [nvarchar](max) NULL,
	[NVNoiSinh] [nvarchar](max) NULL,
	[NVNganh] [nvarchar](max) NULL,
	[NVBHXH] [varchar](10) NULL,
 CONSTRAINT [PK_NhanViens] PRIMARY KEY CLUSTERED 
(
	[NVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhas]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhas](
	[NHAID] [int] IDENTITY(1,1) NOT NULL,
	[NHADiaChi] [nvarchar](max) NOT NULL,
	[NHALoai] [nvarchar](50) NOT NULL,
	[NHACap] [nvarchar](50) NOT NULL,
	[NHADienTich] [decimal](18, 2) NOT NULL,
	[NHAGiaTri] [money] NOT NULL,
	[NHAQuyenSoHuu] [nvarchar](max) NOT NULL,
	[NHAGhiChu] [nvarchar](max) NULL,
	[KKID] [int] NOT NULL,
	[NHAIsNha] [bit] NOT NULL,
 CONSTRAINT [PK_Nhas] PRIMARY KEY CLUSTERED 
(
	[NHAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomMaus]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMaus](
	[NMID] [int] IDENTITY(1,1) NOT NULL,
	[NMTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhomMaus] PRIMARY KEY CLUSTERED 
(
	[NMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongTangDanhHieux]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTangDanhHieux](
	[PTDHID] [int] IDENTITY(1,1) NOT NULL,
	[NVID] [int] NOT NULL,
	[PTDHTen] [nvarchar](max) NOT NULL,
	[PTDHNgay] [datetime] NOT NULL,
	[PTDHHoiDong] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PhongTangDanhHieux] PRIMARY KEY CLUSTERED 
(
	[PTDHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhuTrachChamCongs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuTrachChamCongs](
	[PTCCID] [int] IDENTITY(1,1) NOT NULL,
	[ACCID] [int] NOT NULL,
	[DVID] [int] NOT NULL,
	[PCCCStatus] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PTCCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanHeCongTacs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHeCongTacs](
	[QHCTID] [int] IDENTITY(1,1) NOT NULL,
	[QHCTTuNgay] [datetime] NULL,
	[QHCTDenNgay] [datetime] NULL,
	[QHCTDonVi] [nvarchar](50) NULL,
	[QHCTChucVu] [nvarchar](50) NULL,
	[QHCTNgheNghiep] [nvarchar](50) NULL,
	[QHCTNoiDung] [nvarchar](max) NULL,
	[QHID] [int] NOT NULL,
 CONSTRAINT [PK_QuanHeCongTacs] PRIMARY KEY CLUSTERED 
(
	[QHCTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanHes]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHes](
	[QHID] [int] IDENTITY(1,1) NOT NULL,
	[QHBenVo] [bit] NOT NULL,
	[QHTen] [nvarchar](50) NOT NULL,
	[QHNgaySinh] [datetime] NOT NULL,
	[QHGioiTinh] [bit] NOT NULL,
	[QHHoKhau] [nvarchar](max) NULL,
	[QHNoiO] [nvarchar](max) NOT NULL,
	[NVID] [int] NOT NULL,
	[LQHID] [int] NOT NULL,
 CONSTRAINT [PK_QuanHes] PRIMARY KEY CLUSTERED 
(
	[QHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanLyNhaNuocs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyNhaNuocs](
	[QLNNID] [int] IDENTITY(1,1) NOT NULL,
	[QLNNTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuanLyNhaNuocs] PRIMARY KEY CLUSTERED 
(
	[QLNNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuaTrinhDaoTaos]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuaTrinhDaoTaos](
	[QTDTID] [int] IDENTITY(1,1) NOT NULL,
	[QTDTTruong] [nvarchar](max) NOT NULL,
	[QTDTChuyenNganh] [nvarchar](max) NOT NULL,
	[QTDTTuNgay] [datetime] NOT NULL,
	[QTDTDenNgay] [datetime] NOT NULL,
	[QTDTHinhThuc] [nvarchar](max) NOT NULL,
	[QTDTVanBang] [nvarchar](max) NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_QuaTrinhDaoTaos] PRIMARY KEY CLUSTERED 
(
	[QTDTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiSanKhacs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSanKhacs](
	[TSKID] [int] IDENTITY(1,1) NOT NULL,
	[TSKTen] [nvarchar](max) NOT NULL,
	[TSKSoLuong] [decimal](18, 2) NOT NULL,
	[TSKGiaTri] [money] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TSKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiSanNuocNgoais]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSanNuocNgoais](
	[TSNNID] [int] IDENTITY(1,1) NOT NULL,
	[TSNNTen] [nvarchar](max) NOT NULL,
	[TSNNSoLuong] [decimal](18, 2) NOT NULL,
	[TSNNGiaTri] [money] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TSNNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tiens]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiens](
	[TIEID] [int] IDENTITY(1,1) NOT NULL,
	[TIESoLuong] [money] NOT NULL,
	[TIETienTe] [nvarchar](50) NOT NULL,
	[TIENoiDung] [ntext] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TIEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TonGiaos]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonGiaos](
	[TGID] [int] IDENTITY(1,1) NOT NULL,
	[TGTen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TonGiaos] PRIMARY KEY CLUSTERED 
(
	[TGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThamGiaChinhTriXaHois]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamGiaChinhTriXaHois](
	[TGCTXHID] [int] IDENTITY(1,1) NOT NULL,
	[NVID] [int] NOT NULL,
	[CTXHID] [int] NOT NULL,
	[TGCTXHTuNgay] [datetime] NOT NULL,
	[TGCTXHDenNgay] [datetime] NULL,
	[TGCTXHChucVu] [nvarchar](50) NULL,
	[TGCTXHNoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThamGiaChinhTriXaHois] PRIMARY KEY CLUSTERED 
(
	[TGCTXHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuNhaps]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuNhaps](
	[TNID] [int] IDENTITY(1,1) NOT NULL,
	[TNTen] [nvarchar](max) NOT NULL,
	[TNTien] [money] NOT NULL,
	[KKID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrinhDoNgoaiNgus]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDoNgoaiNgus](
	[TDNNID] [int] IDENTITY(1,1) NOT NULL,
	[TDNNTen] [nvarchar](max) NOT NULL,
	[TDNNChungChi] [bit] NOT NULL,
	[TDNNTiengDanToc] [bit] NOT NULL,
	[NVID] [int] NOT NULL,
 CONSTRAINT [PK_TrinhDoNgoaiNgus] PRIMARY KEY CLUSTERED 
(
	[TDNNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrinhDoTinHocs]    Script Date: 23/08/2017 3:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDoTinHocs](
	[TDTHID] [int] IDENTITY(1,1) NOT NULL,
	[NVID] [int] NOT NULL,
	[TDTHTen] [nvarchar](max) NOT NULL,
	[TDChungChi] [bit] NOT NULL,
 CONSTRAINT [PK_TrinhDoTinHocs] PRIMARY KEY CLUSTERED 
(
	[TDTHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([ACCID], [ACCEmail], [ACCPassword], [ACCChucNang], [ACCStatus], [ACCUpThongTinCaNhan], [ACCUpLyLich], [ACCInLyLich], [ACCInKeKhai], [ACCUpKeKhai], [ACCInDanhGia], [ACCUpDanhGia], [NVID]) VALUES (9, N'admin@gmail.com', N'123', 0, 1, 1, 1, 1, 1, 1, 1, 1, 8)
INSERT [dbo].[Accounts] ([ACCID], [ACCEmail], [ACCPassword], [ACCChucNang], [ACCStatus], [ACCUpThongTinCaNhan], [ACCUpLyLich], [ACCInLyLich], [ACCInKeKhai], [ACCUpKeKhai], [ACCInDanhGia], [ACCUpDanhGia], [NVID]) VALUES (10, N'dqhan@gmail.com', N'123', 2, 1, 1, 0, 0, 0, 0, 0, 0, 12)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[BacLuongs] ON 

INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (1, N'Bậc 1')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (2, N'Bậc 2')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (3, N'Bậc 3')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (4, N'Bậc 4')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (5, N'Bậc 5')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (6, N'Bậc 6')
INSERT [dbo].[BacLuongs] ([BLID], [BLTen]) VALUES (7, N'Bậc 7')
SET IDENTITY_INSERT [dbo].[BacLuongs] OFF
SET IDENTITY_INSERT [dbo].[ChamCongs] ON 

INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (1, 19, CAST(N'2017-08-01' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (2, 19, CAST(N'2017-08-02' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (3, 19, CAST(N'2017-08-03' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (4, 19, CAST(N'2017-08-04' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (5, 19, CAST(N'2017-08-07' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (6, 19, CAST(N'2017-08-08' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (7, 19, CAST(N'2017-08-09' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (8, 19, CAST(N'2017-08-10' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (9, 19, CAST(N'2017-08-11' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (10, 19, CAST(N'2017-08-14' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (11, 19, CAST(N'2017-08-15' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (12, 19, CAST(N'2017-08-16' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (13, 19, CAST(N'2017-08-17' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (14, 19, CAST(N'2017-08-18' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (15, 19, CAST(N'2017-08-21' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (16, 19, CAST(N'2017-08-22' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (17, 19, CAST(N'2017-08-23' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (18, 23, CAST(N'2017-08-01' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (19, 23, CAST(N'2017-08-02' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (20, 23, CAST(N'2017-08-03' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (21, 23, CAST(N'2017-08-04' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (22, 23, CAST(N'2017-08-07' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (23, 23, CAST(N'2017-08-08' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (24, 23, CAST(N'2017-08-09' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (25, 23, CAST(N'2017-08-10' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (26, 23, CAST(N'2017-08-11' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (27, 23, CAST(N'2017-08-14' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (28, 23, CAST(N'2017-08-15' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (29, 23, CAST(N'2017-08-16' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (30, 23, CAST(N'2017-08-17' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (31, 23, CAST(N'2017-08-18' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (32, 23, CAST(N'2017-08-21' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (33, 23, CAST(N'2017-08-22' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (34, 23, CAST(N'2017-08-23' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (35, 20, CAST(N'2017-08-09' AS Date), 6)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (36, 22, CAST(N'2017-08-03' AS Date), 6)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (37, 22, CAST(N'2017-08-04' AS Date), 6)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (38, 20, CAST(N'2017-08-01' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (39, 20, CAST(N'2017-08-02' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (40, 20, CAST(N'2017-08-03' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (41, 20, CAST(N'2017-08-04' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (42, 20, CAST(N'2017-08-07' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (43, 20, CAST(N'2017-08-08' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (44, 20, CAST(N'2017-08-10' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (45, 20, CAST(N'2017-08-11' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (46, 20, CAST(N'2017-08-14' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (47, 20, CAST(N'2017-08-15' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (48, 20, CAST(N'2017-08-16' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (49, 20, CAST(N'2017-08-17' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (50, 20, CAST(N'2017-08-18' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (51, 20, CAST(N'2017-08-21' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (53, 20, CAST(N'2017-08-22' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (54, 20, CAST(N'2017-08-23' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (55, 21, CAST(N'2017-08-01' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (56, 21, CAST(N'2017-08-02' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (57, 21, CAST(N'2017-08-03' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (58, 21, CAST(N'2017-08-04' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (59, 21, CAST(N'2017-08-07' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (60, 21, CAST(N'2017-08-08' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (61, 21, CAST(N'2017-08-09' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (62, 21, CAST(N'2017-08-10' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (63, 21, CAST(N'2017-08-11' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (64, 21, CAST(N'2017-08-14' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (65, 21, CAST(N'2017-08-15' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (66, 21, CAST(N'2017-08-16' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (67, 21, CAST(N'2017-08-17' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (68, 21, CAST(N'2017-08-18' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (69, 21, CAST(N'2017-08-21' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (70, 21, CAST(N'2017-08-22' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (71, 21, CAST(N'2017-08-23' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (72, 22, CAST(N'2017-08-01' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (73, 22, CAST(N'2017-08-02' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (74, 22, CAST(N'2017-08-07' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (75, 22, CAST(N'2017-08-08' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (76, 22, CAST(N'2017-08-09' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (77, 22, CAST(N'2017-08-10' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (78, 22, CAST(N'2017-08-11' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (79, 22, CAST(N'2017-08-14' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (80, 22, CAST(N'2017-08-15' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (81, 22, CAST(N'2017-08-16' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (82, 22, CAST(N'2017-08-17' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (83, 22, CAST(N'2017-08-18' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (84, 22, CAST(N'2017-08-21' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (85, 22, CAST(N'2017-08-22' AS Date), 1)
INSERT [dbo].[ChamCongs] ([CCID], [LVID], [CCDATE], [LCCID]) VALUES (86, 22, CAST(N'2017-08-23' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ChamCongs] OFF
SET IDENTITY_INSERT [dbo].[ChinhTriXaHois] ON 

INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (1, N'Ủy ban Mặt trận Tổ quốc', N'Nhà B, Khu nhà Liên cơ quan, quảng trường 3/2, TP. Bắc Giang, tỉnh Bắc Giang', N'02403854517', N'02403555044', N'mttq@bacgiang.gov.vn', NULL, NULL)
INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (2, N'Hội Liên hiệp Phụ nữ tỉnh', N'Nhà B, Khu nhà Liên cơ quan, quảng trường 3/2, TP. Bắc Giang, tỉnh Bắc Giang', N'02403854702', NULL, N'hoi_phunu_vt@bacgiang.gov.vn', NULL, NULL)
INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (3, N'Đoàn TNCS Hồ Chí Minh tỉnh Bắc Giang (Tỉnh đoàn)', N'Nhà B, Khu nhà Liên cơ quan, quảng trường 3/2, TP. Bắc Giang, tỉnh Bắc Giang', N'02403851079', N'02403554610', N'vp_td@bacgiang.gov.vn', NULL, NULL)
INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (4, N'Liên đoàn Lao động tỉnh', N'Số 39, đường Nguyễn Khắc Nhu, P.Trần Nguyên Hãn, TP. Bắc Giang, tỉnh Bắc Giang', N'02403854281', NULL, NULL, NULL, NULL)
INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (5, N'Hội Nông dân', N'Nhà B, Khu nhà Liên cơ quan, quảng trường 3/2, TP. Bắc Giang, tỉnh Bắc Giang', N'02403555373', N'02403854532 ', N'vanphong@hoinongdanbacgiang.org.vn', N'http://www.hoinongdanbacgiang.org.vn', NULL)
INSERT [dbo].[ChinhTriXaHois] ([CTXHID], [CTXHTen], [CTXHDiaChi], [CTXHDienThoai], [CTXHFax], [CTXHEmail], [CTXHWebsite], [CTXHGioiThieu]) VALUES (6, N'Hội Cựu chiến binh', N'Nhà B, Khu nhà Liên cơ quan, quảng trường 3/2, TP. Bắc Giang, tỉnh Bắc Giang', N'02403554593', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChinhTriXaHois] OFF
SET IDENTITY_INSERT [dbo].[ChucVus] ON 

INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (1, N'Giám đốc')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (2, N'Phó giám đốc')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (3, N'Trưởng phòng')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (4, N'Phó phòng')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (5, N'Kế toán')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (6, N'Thủ quĩ')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (7, N'Nhân viên')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (8, N'Bảo vệ')
INSERT [dbo].[ChucVus] ([CVID], [CVTen]) VALUES (9, N'Tạp vụ')
SET IDENTITY_INSERT [dbo].[ChucVus] OFF
SET IDENTITY_INSERT [dbo].[ChuyenMons] ON 

INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (1, N'Sơ cấp')
INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (2, N'Trung cấp')
INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (3, N'Cao đẳng')
INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (4, N'Kỹ sư/Cử nhân')
INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (5, N'Thạc sĩ')
INSERT [dbo].[ChuyenMons] ([CMID], [CMTen]) VALUES (6, N'Tiến sĩ')
SET IDENTITY_INSERT [dbo].[ChuyenMons] OFF
SET IDENTITY_INSERT [dbo].[DanTocs] ON 

INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (1, N'Kinh', 0)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (3, N'Chứt', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (4, N'Mường', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (5, N'Thổ', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (7, N'Bố Y', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (8, N'Giáy', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (9, N'Lào', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (10, N'Lự', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (11, N'Nùng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (12, N'Sáng Chay', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (13, N'Tày', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (14, N'Thái', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (15, N'Cờ Lao', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (16, N'La Chí', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (17, N'La Ha', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (18, N'Pu Péo', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (19, N'Ba Na', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (20, N'Brâu', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (21, N'Bru-Vân Kiều', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (22, N'Chơ Ro', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (23, N'Co', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (24, N'Cơ Ho', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (25, N'Cơ Tu', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (26, N'Giẻ Riêng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (27, N'Hrê', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (28, N'Kháng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (29, N'Khmer', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (30, N'Khmu', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (31, N'Mạ', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (33, N'Mảng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (34, N'Mnong', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (35, N'Ơ Đu', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (36, N'Rơ Măm', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (37, N'Tà Ôi', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (38, N'Xinh Mun', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (39, N'Xơ Đăng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (40, N'Stieng', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (41, N'Dao', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (42, N'H''mong', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (43, N'Pà Thẻn', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (44, N'Chăm', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (45, N'Chu Ru', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (46, N'Rhade', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (47, N'Gia Rai', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (48, N'Ra Glai', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (50, N'Hoa', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (51, N'Ngái', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (52, N'Sán Dìu', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (53, N'Cống', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (55, N'Hà Nhì', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (56, N'La Hủ', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (57, N'Lô Lô', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (58, N'Phù Lá', 1)
INSERT [dbo].[DanTocs] ([DTID], [DTTen], [DTThieuSo]) VALUES (59, N'Si La', 1)
SET IDENTITY_INSERT [dbo].[DanTocs] OFF
SET IDENTITY_INSERT [dbo].[DonVis] ON 

INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (10, N'Sở Tài Nguyên và Môi Trường tỉnh Bến Tre', NULL, 1, NULL, 100, NULL, NULL)
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (15, N'Trung Tâm Phát Triển Quỹ Đất', 10, 1, N'', 80, N'0753545392', N'Phường 2, Thành phố Bến Tre')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (16, N'Ban Giám Đốc Trung Tâm', 15, 1, N'', 3, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (17, N'Phòng Hành Chính Tổng Hợp', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (18, N'Phòng Bồi Thường Giải Phóng Mặt Bằng', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (19, N'Phòng Phát Triển Quỹ Đất', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (20, N'Chi Nhánh Thành Phố Bến Tre', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (21, N'Chi Nhánh Châu Thành', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (22, N'Chi Nhánh Chợ Lách', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (23, N'Chi Nhánh Bình Đại', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (24, N'Chi Nhánh Ba Tri', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (25, N'Chi Nhánh Mỏ Cày Nam', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (26, N'Chi Nhánh Mỏ Cày Bắc', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (27, N'Chi Nhánh Giồng Trôm', 15, 1, N'', 5, N'', N'')
INSERT [dbo].[DonVis] ([DVID], [DVTen], [DVTrucThuocID], [DVTrangThai], [DVNoiDung], [DVBienChe], [DVSDT], [DVDiaChi]) VALUES (28, N'Chi Nhánh Thạnh Phú', 15, 1, N'', 5, N'', N'')
SET IDENTITY_INSERT [dbo].[DonVis] OFF
SET IDENTITY_INSERT [dbo].[GiaoDucPhoThongs] ON 

INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (1, N'Lớp 1/1')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (2, N'Lớp 2/2')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (3, N'Lớp 3/3')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (4, N'Lớp 4/4')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (5, N'Lớp 5/5')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (6, N'Lớp 6/6')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (7, N'Lớp 7/7')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (8, N'Lớp 8/8')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (9, N'Lớp 9/9')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (10, N'Lớp 10/10')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (11, N'Lớp 11/11')
INSERT [dbo].[GiaoDucPhoThongs] ([GDPTID], [GDPTTen]) VALUES (12, N'Lớp 12/12')
SET IDENTITY_INSERT [dbo].[GiaoDucPhoThongs] OFF
SET IDENTITY_INSERT [dbo].[HeSoLuongs] ON 

INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (1, 6, 2, CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (2, 4, 2, CAST(3.33 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (3, 7, 1, CAST(6.44 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (4, 2, 2, CAST(2.67 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (5, 1, 2, CAST(2.34 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (6, 3, 2, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (7, 1, 3, CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (8, 1, 4, CAST(1.86 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (10, 5, 2, CAST(3.66 AS Decimal(18, 2)))
INSERT [dbo].[HeSoLuongs] ([HSLID], [BLID], [NGID], [HSLHeSo]) VALUES (11, 4, 4, CAST(2.46 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[HeSoLuongs] OFF
SET IDENTITY_INSERT [dbo].[LamViecs] ON 

INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (6, 16, 9, CAST(N'2015-01-01' AS Date), NULL, 1, N'Giám đốc', CAST(0.70 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 1)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (7, 16, 10, CAST(N'2016-08-01' AS Date), NULL, 2, N'Phó Giám đốc trung tâm', CAST(0.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 2)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (8, 17, 11, CAST(N'2015-10-01' AS Date), NULL, 7, N'Nhân viên hành chính', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 3)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (9, 17, 12, CAST(N'2016-01-01' AS Date), NULL, 3, N'Trưởng phòng Hành chính Tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 2)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (10, 17, 13, CAST(N'2015-07-01' AS Date), NULL, 5, N'Kế toán Trung tâm', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 4)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (11, 17, 14, CAST(N'2015-06-01' AS Date), NULL, 7, N'Nhân viên', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, NULL, NULL, 4)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (12, 17, 15, CAST(N'2017-05-01' AS Date), NULL, 6, N'Nhân viên hợp đồng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'02/2016/HĐLĐ', CAST(N'2016-05-12' AS Date), 5)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (13, 17, 16, CAST(N'2016-12-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'22/2016/HĐLĐ', CAST(N'2016-10-03' AS Date), 5)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (14, 17, 17, CAST(N'2016-01-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'13/2019/HĐLĐ', CAST(N'2016-05-12' AS Date), 6)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (15, 17, 18, CAST(N'2017-01-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 7)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (16, 17, 19, CAST(N'2010-01-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'17/2016/HĐLĐ', CAST(N'2016-12-05' AS Date), 8)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (17, 17, 20, CAST(N'2017-04-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'09/2017/HĐLĐ', CAST(N'2017-05-31' AS Date), 5)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (18, 17, 23, CAST(N'2017-04-01' AS Date), NULL, 7, N'Nhân viên phòng Hành chính tổng hợp', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'7/2017/HĐLĐ', CAST(N'2017-05-01' AS Date), 8)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (19, 18, 24, CAST(N'2015-09-01' AS Date), NULL, 3, N'Trưởng phòng Bồi thường giải phóng mặt bằng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 10)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (20, 18, 25, CAST(N'2014-10-01' AS Date), NULL, 7, N'Nhân viên phòng Bồi thường giải phóng mặt bằng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 6)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (21, 18, 26, CAST(N'2016-01-01' AS Date), NULL, 8, N'Nhân viên phòng Bồi thường giải phóng mặt bằng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'18/2017/HĐLĐ', NULL, 11)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (22, 18, 27, CAST(N'2016-05-01' AS Date), NULL, 7, N'Nhân viên phòng Bồi thường giải phóng mặt bằng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'21/2016/HĐLĐ', NULL, 5)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (23, 18, 8, CAST(N'2017-04-01' AS Date), NULL, 7, N'Nhân viên phòng Bồi thường giải phóng mặt bằng', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 5)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (24, 19, 28, CAST(N'2014-12-01' AS Date), NULL, 3, N'Trưởng phòng phòng Phát triển quỹ đất', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 10)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (25, 19, 29, CAST(N'2013-05-01' AS Date), NULL, 7, N'Nhân viên phòng Phát triển quỹ đất', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 6)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (26, 19, 30, CAST(N'2014-04-01' AS Date), NULL, 7, N'Nhân viên phòng Phát triển quỹ đất', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 4)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (27, 19, 31, CAST(N'2015-01-01' AS Date), NULL, 4, N'Phó phòng Phát triển quỹ đất', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 6)
INSERT [dbo].[LamViecs] ([LVID], [DVID], [NVID], [LVTuNgay], [LVDenNgay], [CVID], [LVNhiemVu], [LVPhuCapChucVu], [LVPhuCapCongVu], [LVPhuCapKiemNhiem], [LVPhuCapNghe], [LVPhuCapThamNienNghe], [LVPhuCapVuotKhung], [LVPhuCapDocHai], [LVLuongCoBan], [LVTyLe], [LVThuoc], [LVSoNgayPhep], [LVSoHopDong], [LVNgayHopDong], [HSLID]) VALUES (28, 19, 32, CAST(N'2013-05-01' AS Date), NULL, 7, N'Nhân viên phòng Phát triển quỹ đất', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1300000 AS Decimal(18, 0)), CAST(100.00 AS Decimal(18, 2)), NULL, 12, N'', NULL, 4)
SET IDENTITY_INSERT [dbo].[LamViecs] OFF
SET IDENTITY_INSERT [dbo].[LoaiChamCong] ON 

INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (1, N'Lương thời gian', N'+', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (2, N'Ốm, điều dưỡng', N'Ô', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (3, N'Con ốm', N'Cô', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (4, N'Thai sản', N'Ts', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (5, N'Tai nạn', N'T', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (6, N'Nghỉ phép', N'P', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (7, N'Nghỉ phép (1/2 ngày)', N'-', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (8, N'Học tập, hội nghị', N'H', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (9, N'Nghỉ bù', N'Nb', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (10, N'Nghỉ không lương', N'No', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (11, N'Ngưng việc', N'N', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (12, N'Lao động, nghĩa vụ', N'Lđ', NULL)
INSERT [dbo].[LoaiChamCong] ([LCCID], [LCCTen], [LCCKyHieu], [LCCGhiChu]) VALUES (13, N'Nghĩ lễ', N'L', NULL)
SET IDENTITY_INSERT [dbo].[LoaiChamCong] OFF
SET IDENTITY_INSERT [dbo].[LoaiGiaiTrinhs] ON 

INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (1, N'Nhà ở, công trình xây dựng', N'Nhà ở, công trình xây dựng:
a) Nhà ở:
b) Công trình xây dựng khác:
')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (2, N'Quyền sử dụng đất', N'Quyền sử dụng đất (tăng, giảm về số lượng, diện tích, thay đổi loại đất so với kỳ kê khai trước đó):
a) Đất ở:
b) Các loại đất khác
')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (3, N'Tiền (tiền Việt Nam, ngoại tệ) ', N'Tiền (tiền Việt Nam, ngoại tệ) gồm tiền mặt, tiền cho vay, tiền gửi cá nhân, tổ chức trong nước, tổ chức nước ngoài tại Việt Nam mà tổng giá trị quy đổi từ 50 triệu đồng trở lên')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (4, N'Các loại động sản', N'Các loại động sản:
- Ô tô
- Mô tô
- Xe gắn máy
- Xe máy (máy ủi, máy xúc, các loại xe máy khác)
- Tàu thủy
- Tàu bay
- Thuyền
- Những động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng ký sử dụng và được cấp giấy đăng ký)
')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (5, N'Các loại tài sản', N'Các loại tài sản:
- Kim loại quý
- Đá quý
- Cổ phiếu
- Vốn góp vào các cơ sở kinh doanh
- Các loại giấy tờ có giá trị chuyển nhượng khác có tổng giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên
')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (6, N'Các loại tài sản khác', N'Các loại tài sản khác (như cây cảnh, bộ bàn ghế, tranh, ảnh, đồ ,mỹ nghệ và các loại tài sản khác) mà giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (7, N'Tài sản, tài khoản ở nước ngoài', N'Tài sản, tài khoản ở nước ngoài gồm tất cả tài sản quy định từ Khoản 1 đến Khoản 6 nói trên nằm ngoài lãnh thổ Việt Nam.')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (8, N'Các khoản nợ', N'Các khoản nợ gồm: các khoản phải trả, giá trị các tài sản quản lý hộ, giữ hộ có tổng giá trị quy đổi từ 50 triệu đồng trở lên.')
INSERT [dbo].[LoaiGiaiTrinhs] ([LGTID], [LGTTen], [LGTTenChung]) VALUES (9, N'Tổng thu nhập trong năm', N'Tổng thu nhập trong năm quy đổi thành tiền Việt Nam')
SET IDENTITY_INSERT [dbo].[LoaiGiaiTrinhs] OFF
SET IDENTITY_INSERT [dbo].[LoaiQuanHes] ON 

INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (1, N'Anh chị em', 0)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (2, N'Cô cậu', 0)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (3, N'Vợ', 1)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (4, N'Chồng', 1)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (5, N'Con', 0)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (6, N'Cha', 1)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (7, N'Mẹ', 1)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (8, N'Cha vợ/chồng', 1)
INSERT [dbo].[LoaiQuanHes] ([LQHID], [LQHTen], [LQHDuyNhat]) VALUES (9, N'Mẹ vợ/chồng', 1)
SET IDENTITY_INSERT [dbo].[LoaiQuanHes] OFF
SET IDENTITY_INSERT [dbo].[LyLuanChinhTris] ON 

INSERT [dbo].[LyLuanChinhTris] ([LLCTID], [LLCTTen]) VALUES (1, N'Sơ cấp')
INSERT [dbo].[LyLuanChinhTris] ([LLCTID], [LLCTTen]) VALUES (2, N'Trung cấp')
INSERT [dbo].[LyLuanChinhTris] ([LLCTID], [LLCTTen]) VALUES (3, N'Cao cấp')
INSERT [dbo].[LyLuanChinhTris] ([LLCTID], [LLCTTen]) VALUES (4, N'Không')
SET IDENTITY_INSERT [dbo].[LyLuanChinhTris] OFF
SET IDENTITY_INSERT [dbo].[Ngaches] ON 

INSERT [dbo].[Ngaches] ([NGID], [NGTen], [NGNoiDung], [NGNamTangLuong], [NGMa]) VALUES (1, N'Chuyên viên chính', N'', 3, N'01.002')
INSERT [dbo].[Ngaches] ([NGID], [NGTen], [NGNoiDung], [NGNamTangLuong], [NGMa]) VALUES (2, N'Chuyên viên', N'', 3, N'01.003')
INSERT [dbo].[Ngaches] ([NGID], [NGTen], [NGNoiDung], [NGNamTangLuong], [NGMa]) VALUES (3, N'Cao đẳng', N'', 2, N'01a.003')
INSERT [dbo].[Ngaches] ([NGID], [NGTen], [NGNoiDung], [NGNamTangLuong], [NGMa]) VALUES (4, N'Cán sự', N'', 2, N'1.004')
SET IDENTITY_INSERT [dbo].[Ngaches] OFF
SET IDENTITY_INSERT [dbo].[NhanViens] ON 

INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (8, N'Trần Lê Duy', N'Robin Tran', CAST(N'1987-05-11 00:00:00.000' AS DateTime), 1, 14, N'196C, đường Phan Đình Phùng, phường Phú Khương, thành phố Bến Tre, tỉnh Bến Tre', N'196C, đường Phan Đình Phùng, phường Phú Khương, thành phố Bến Tre, tỉnh Bến Tre', 12, 4, 1, 1, N'Công nghệ thông tin', N'Tốt', CAST(1.73 AS Decimal(18, 2)), CAST(75.00 AS Decimal(18, 2)), 1, N'321270945', CAST(N'2010-10-20 00:00:00.000' AS DateTime), NULL, 1, N'Xã Bình Thới, huyện Bình Đại, tỉnh Bến Tre', N'Thị xã Bến Tre, tỉnh Bến Tre', N'Công nghệ thông tin', NULL)
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (9, N'Nguyễn Văn Nhơn', N'', CAST(N'1976-12-10 00:00:00.000' AS DateTime), 1, 14, N'01 Trần Quốc Tuấn, Phường 2 thành phố Bến Tre, Bến Tre', N'01 Trần Quốc Tuấn, Phường 2 thành phố Bến Tre, Bến Tre', 12, 4, 3, 2, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'320928115', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'Xã Mỹ Chánh, Ba Tri, Bến Tre', N'Xã Mỹ Chánh, Ba Tri, Bến Tre', N'Quản lý đất đai,CN KT', N'5504000182')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (10, N'Hồ Vĩnh Chương', N'', CAST(N'1977-11-19 00:00:00.000' AS DateTime), 1, 14, N'108b, Đoàn Hoàng Minh, Phường 5, Tp. Bến Tre  ', N'108b, Đoàn Hoàng Minh, Phường 5, Tp. Bến Tre  ', 12, 4, 3, 2, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'320997341', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'xã Tiên Thủy, huyện Châu Thành, tỉnh Bến Tre', N'xã Tiên Thủy, huyện Châu Thành, tỉnh Bến Tre', N'Trắc địa', N'5502002286')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (11, N'Trần Tấn Hiệp', N'', CAST(N'1957-09-16 00:00:00.000' AS DateTime), 1, 14, N'196C Phan Đình Phùng, thành phố Bến Tre', N'196C Phan Đình Phùng, thành phố Bến Tre', 12, 1, 3, 2, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321213184', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'Lộc Thuận, Bình Đại, Bến Tre', N'Lộc Thuận, Bình Đại, Bến Tre', N'Kỹ thuật', N'55960186')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (12, N'Đỗ Quốc Hân', N'', CAST(N'1983-07-03 00:00:00.000' AS DateTime), 1, 14, N'119 ấp Phú Hội, xã Phú Đức, huyện Châu Thành, tỉnh Bến Tre', N'119 ấp Phú Hội, xã Phú Đức, huyện Châu Thành, tỉnh Bến Tre', 12, 4, 4, 1, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321091992', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'huyện Châu Thành, tỉnh Bến Tre', N'huyện Châu Thành, tỉnh Bến Tre', N'Quản lý đất đai', N'321091992')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (13, N'Lê Thị Kim Hồng', N'', CAST(N'1981-10-21 00:00:00.000' AS DateTime), 1, 14, N'334A ấp Phú Chánh, Phú Hưng, thành phố Bến Tre, Bến Tre', N'334A ấp Phú Chánh, Phú Hưng, thành phố Bến Tre, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321068588', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 0, N'334A ấp Phú Chánh, Phú Hưng, thành phố Bến Tre, Bến Tre', N'334A ấp Phú Chánh, Phú Hưng, thành phố Bến Tre, Bến Tre', N'Kinh tế', N'203236328')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (14, N'Nguyễn Thanh Nhã', N'', CAST(N'1983-08-16 00:00:00.000' AS DateTime), 1, 14, N'Khu phố 2, thị trấn Châu Thành, Châu Thành, Bến Tre', N'Khu phố 2, thị trấn Châu Thành, Châu Thành, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321094293', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'Khu phố 2, thị trấn Châu Thành, Châu Thành, Bến Tre', N'Khu phố 2, thị trấn Châu Thành, Châu Thành, Bến Tre', N'Luật', N'8311002400')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (15, N'Nguyễn Thị Ân', N'', CAST(N'1999-08-21 00:00:00.000' AS DateTime), 1, 14, N'Châu Bình, Giồng Trôm, Bến Tre', N'Châu Bình, Giồng Trôm, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321119393', CAST(N'2017-08-21 00:00:00.000' AS DateTime), N'DefaultUser.png', 0, N'Châu Bình, Giồng Trôm, Bến Tre', N'Châu Bình, Giồng Trôm, Bến Tre', N'Luật', N'321119393')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (16, N'Lê Khánh Nhân', N'', CAST(N'1994-04-30 00:00:00.000' AS DateTime), 1, 14, N'436A, Ấp 1, Nhơn Thạnh, Tp. Bến Tre', N'436A, Ấp 1, Nhơn Thạnh, Tp. Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321518358', CAST(N'2017-08-22 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'436A, Ấp 1, Nhơn Thạnh, Tp. Bến Tre', N'436A, Ấp 1, Nhơn Thạnh, Tp. Bến Tre', N'Quản lý đất đai', N'8316012683')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (17, N'Trần Xuân Yến', N'', CAST(N'1982-12-27 00:00:00.000' AS DateTime), 1, 14, N'Bình Hòa, Giồng Trôm, Bến Tre', N'Bình Hòa, Giồng Trôm, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321054159', CAST(N'2017-08-22 00:00:00.000' AS DateTime), N'DefaultUser.png', 0, N'Bình Hòa, Giồng Trôm, Bến Tre', N'Bình Hòa, Giồng Trôm, Bến Tre', N'Kinh tế', N'8311002402')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (18, N'Hồ Thị Nhanh', N'', CAST(N'1989-10-15 00:00:00.000' AS DateTime), 1, 14, N'xã Tân Bình, Mỏ Cày Bắc, Bến Tre', N'xã Tân Bình, Mỏ Cày Bắc, Bến Tre', 12, 3, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321295836', CAST(N'2017-08-22 00:00:00.000' AS DateTime), N'DefaultUser.png', 0, N'xã Tân Bình, Mỏ Cày Bắc, Bến Tre', N'xã Tân Bình, Mỏ Cày Bắc, Bến Tre', N'Quản lý đất đai', N'8313006818')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (19, N'Nguyễn Quốc Nam', N'', CAST(N'1982-10-15 00:00:00.000' AS DateTime), 1, 14, N'Tân Thạch, Châu Thành, Bến Tre', N'Tân Thạch, Châu Thành, Bến Tre', 12, 1, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321029361', CAST(N'2017-08-22 00:00:00.000' AS DateTime), N'DefaultUser.png', 1, N'Tân Thạch, Châu Thành, Bến Tre', N'Tân Thạch, Châu Thành, Bến Tre', N'Xây dựng', N'8311002409')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (20, N'Nguyễn Thị Bảo Ngân', N'', CAST(N'1987-07-05 00:00:00.000' AS DateTime), 1, 14, N'Long Thới, Chợ Lách, Bến Tre', N'Long Thới, Chợ Lách, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', CAST(1.70 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), 1, N'321264742', CAST(N'2017-08-23 00:00:00.000' AS DateTime), N'DefaultUser.png', 0, N'Long Thới, Chợ Lách, Bến Tre', N'Long Thới, Chợ Lách, Bến Tre', N'Tài chính', N'8311011642')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (23, N'Phạm Thị Khánh An', N'', CAST(N'1993-08-11 00:00:00.000' AS DateTime), 1, 14, N'53/2, ấp An Điền, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', N'53/2, ấp An Điền, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', 12, 2, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321478653', NULL, N'DefaultUser.png', 0, N'53/2, ấp An Điền, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', N'53/2, ấp An Điền, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', N'Kế toán', N'8014023081')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (24, N'Trần Vĩnh Tâm', N'', CAST(N'1975-05-10 00:00:00.000' AS DateTime), 1, 14, N'Phong Mỹ, Giồng Trôm, Bến Tre', N'Phong Mỹ, Giồng Trôm, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'320858908', NULL, N'DefaultUser.png', 1, N'Phong Mỹ, Giồng Trôm, Bến Tre', N'Phong Mỹ, Giồng Trôm, Bến Tre', N'Xây dựng', N'5597021617')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (25, N'Phạm Thị Phi Vân', N'', CAST(N'1984-09-01 00:00:00.000' AS DateTime), 1, 14, N'64 ấp 5, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', N'64 ấp 5, xã An Thuận, huyện Thạnh Phú, tỉnh Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321141065', NULL, N'DefaultUser.png', 0, N'Thạnh Phú, tỉnh Bến Tre', N'Thạnh Phú, tỉnh Bến Tre', N'Xây dựng', N'8308006894')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (26, N'Huỳnh Văn Trung', N'', CAST(N'1987-10-06 00:00:00.000' AS DateTime), 1, 14, N'Ấp 1, Sơn Đông, TP. Bến Tre', N'Ấp 1, Sơn Đông, TP. Bến Tre', 12, 2, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321290845', NULL, N'DefaultUser.png', 1, N'Bình Thành, Giồng Trôm, Bến Tre', N'Bình Thành, Giồng Trôm, Bến Tre', N'Xây dựng', N'8311002408')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (27, N'Nguyễn Thị Ngọc Chi', N'', CAST(N'1985-01-15 00:00:00.000' AS DateTime), 1, 14, N'Phú Khương, Tp. Bến Tre, Bến Tre', N'Phú Khương, Tp. Bến Tre, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321193231', NULL, N'DefaultUser.png', 0, N'Lương Hòa, Giồng Trôm, Bến Tre', N'Lương Hòa, Giồng Trôm, Bến Tre', N'Kinh tế', N'8310002414')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (28, N'Phạm Trung Đoàn', N'', CAST(N'1978-01-09 00:00:00.000' AS DateTime), 1, 14, N'Số 35, Trương Định, phường An Cư, Tỉnh Cần Thơ', N'Số 35, Trương Định, phường An Cư, Tỉnh Cần Thơ', 12, 5, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'361741362', NULL, N'DefaultUser.png', 1, N'Huyện Lạng Giang, tỉnh Hà Bắc', N'Huyện Lạng Giang, tỉnh Hà Bắc', N'Khoa học', N'5502002287')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (29, N'Nguyễn Thanh Nhớ', N'', CAST(N'1980-07-22 00:00:00.000' AS DateTime), 1, 14, N'Ấp Phước Trung, xã Phước Mỹ Trung, huyện Mỏ Cày, tỉnh Bến Tre', N'Ấp Phước Trung, xã Phước Mỹ Trung, huyện Mỏ Cày, tỉnh Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321038925', NULL, N'DefaultUser.png', 1, N'xã Phước Mỹ Trung, Mỏ Cày, Bến Tre', N'xã Phước Mỹ Trung, Mỏ Cày, Bến Tre', N'Công nghệ Thông tin', N'5503002460')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (30, N'Đỗ Thị Linl', N'', CAST(N'1980-12-08 00:00:00.000' AS DateTime), 1, 14, N'15.B Bình Thành I, xã Bình Phú, Thị xã Bến Tre', N'15.B Bình Thành I, xã Bình Phú, Thị xã Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321145909', NULL, N'DefaultUser.png', 0, N'Thị xã Bến Tre, tỉnh Bến Tre', N'Thị xã Bến Tre, tỉnh Bến Tre', N'Công nghệ Thông tin', N'5505000951')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (31, N'Lê Thị Tâm', N'', CAST(N'1978-12-25 00:00:00.000' AS DateTime), 1, 14, N'ấp Phước Tân, xã Bình Khánh Đông, huyện Mỏ Cày Nam, tỉnh Bến Tre', N'ấp Phước Tân, xã Bình Khánh Đông, huyện Mỏ Cày Nam, tỉnh Bến Tre', 12, 4, 1, 1, NULL, N'Tốt', NULL, NULL, 1, N'321003469', NULL, N'DefaultUser.png', 0, N'Bình Khánh Đông, Mỏ Cày Bến Tre', N'Bình Khánh Đông, Mỏ Cày Bến Tre', N'Kinh tế', N'5505000428')
INSERT [dbo].[NhanViens] ([NVID], [NVTen], [NVTenKhac], [NVNgaySinh], [DTID], [TGID], [NVHoKhau], [NVNoiO], [GDPTID], [CMID], [LLCTID], [QLNNID], [NVSoTruong], [NVTinhTrangSucKhoe], [NVChieuCao], [NVCanNang], [NMID], [NVCMND], [NVNgayCapCMND], [NVHinh], [NVGioiTinh], [NVQueQuan], [NVNoiSinh], [NVNganh], [NVBHXH]) VALUES (32, N'Cao Thị Hương Trang', N'', CAST(N'1984-03-23 00:00:00.000' AS DateTime), 1, 14, N'Phú Khương, Tp. Bến Tre, Bến Tre', N'Phú Khương, Tp. Bến Tre, Bến Tre', 12, 4, 4, 5, NULL, N'Tốt', NULL, NULL, 1, N'321153252', NULL, N'DefaultUser.png', 1, N'Phú Khương, Tp. Bến Tre, Bến Tre', N'Phú Khương, Tp. Bến Tre, Bến Tre', N'QLTT BĐS', N'8310002136')
SET IDENTITY_INSERT [dbo].[NhanViens] OFF
SET IDENTITY_INSERT [dbo].[NhomMaus] ON 

INSERT [dbo].[NhomMaus] ([NMID], [NMTen]) VALUES (1, N'Nhóm máu O')
INSERT [dbo].[NhomMaus] ([NMID], [NMTen]) VALUES (2, N'Nhóm máu A')
INSERT [dbo].[NhomMaus] ([NMID], [NMTen]) VALUES (3, N'Nhóm máu B')
INSERT [dbo].[NhomMaus] ([NMID], [NMTen]) VALUES (4, N'Nhóm máu AB')
SET IDENTITY_INSERT [dbo].[NhomMaus] OFF
SET IDENTITY_INSERT [dbo].[PhuTrachChamCongs] ON 

INSERT [dbo].[PhuTrachChamCongs] ([PTCCID], [ACCID], [DVID], [PCCCStatus]) VALUES (1, 10, 17, 1)
SET IDENTITY_INSERT [dbo].[PhuTrachChamCongs] OFF
SET IDENTITY_INSERT [dbo].[QuanLyNhaNuocs] ON 

INSERT [dbo].[QuanLyNhaNuocs] ([QLNNID], [QLNNTen]) VALUES (1, N'Quản lý nhà nước ngạch chuyên viên')
INSERT [dbo].[QuanLyNhaNuocs] ([QLNNID], [QLNNTen]) VALUES (2, N'Quản lý nhà nước ngạch chuyên viên chính')
INSERT [dbo].[QuanLyNhaNuocs] ([QLNNID], [QLNNTen]) VALUES (5, N'Không')
SET IDENTITY_INSERT [dbo].[QuanLyNhaNuocs] OFF
SET IDENTITY_INSERT [dbo].[TonGiaos] ON 

INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (1, N'Kitô giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (2, N'Hồi giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (3, N'Ấn Độ giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (4, N'Đạo giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (5, N'Phật giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (6, N'Nho giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (7, N'Thần đạo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (8, N'Sikh giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (9, N'Do Thái giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (10, N'Bahá''í giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (11, N'Nhân Chứng Giê-hô-va')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (12, N'Đạo Cao Đài')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (13, N'Jaina Giáo')
INSERT [dbo].[TonGiaos] ([TGID], [TGTen]) VALUES (14, N'Không')
SET IDENTITY_INSERT [dbo].[TonGiaos] OFF
ALTER TABLE [dbo].[DaQuis] ADD  DEFAULT ((1)) FOR [DQSoLuong]
GO
ALTER TABLE [dbo].[DongSans] ADD  DEFAULT ((1)) FOR [DSSoLuong]
GO
ALTER TABLE [dbo].[KhoanNos] ADD  DEFAULT ((1)) FOR [KNSoLuong]
GO
ALTER TABLE [dbo].[TaiSanKhacs] ADD  DEFAULT ((1)) FOR [TSKSoLuong]
GO
ALTER TABLE [dbo].[TaiSanNuocNgoais] ADD  DEFAULT ((1)) FOR [TSNNSoLuong]
GO
ALTER TABLE [dbo].[TrinhDoNgoaiNgus] ADD  DEFAULT ((1)) FOR [TDNNChungChi]
GO
ALTER TABLE [dbo].[TrinhDoNgoaiNgus] ADD  DEFAULT ((0)) FOR [TDNNTiengDanToc]
GO
ALTER TABLE [dbo].[TrinhDoTinHocs] ADD  DEFAULT ((1)) FOR [TDChungChi]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_NhanVien]
GO
ALTER TABLE [dbo].[ChamCongs]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_LamViec] FOREIGN KEY([LVID])
REFERENCES [dbo].[LamViecs] ([LVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChamCongs] CHECK CONSTRAINT [FK_ChamCong_LamViec]
GO
ALTER TABLE [dbo].[ChamCongs]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_LoaiChamCong] FOREIGN KEY([LCCID])
REFERENCES [dbo].[LoaiChamCong] ([LCCID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChamCongs] CHECK CONSTRAINT [FK_ChamCong_LoaiChamCong]
GO
ALTER TABLE [dbo].[ChinhSaches]  WITH CHECK ADD  CONSTRAINT [FK_ChinhSach_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChinhSaches] CHECK CONSTRAINT [FK_ChinhSach_NhanVien]
GO
ALTER TABLE [dbo].[DanhGiaDangViens]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaDangVien_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaDangViens] CHECK CONSTRAINT [FK_DanhGiaDangVien_NhanVien]
GO
ALTER TABLE [dbo].[DanhGiaLaoDongs]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaLaoDong_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaLaoDongs] CHECK CONSTRAINT [FK_DanhGiaLaoDong_NhanVien]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGia_NhanVien]
GO
ALTER TABLE [dbo].[DanhGiaVienChucs]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaVienChuc_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaVienChucs] CHECK CONSTRAINT [FK_DanhGiaVienChuc_NhanVien]
GO
ALTER TABLE [dbo].[DaQuis]  WITH CHECK ADD  CONSTRAINT [FK_DaQui_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DaQuis] CHECK CONSTRAINT [FK_DaQui_KeKhai]
GO
ALTER TABLE [dbo].[Dats]  WITH CHECK ADD  CONSTRAINT [FK_Dat_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dats] CHECK CONSTRAINT [FK_Dat_KeKhai]
GO
ALTER TABLE [dbo].[DonVis]  WITH CHECK ADD  CONSTRAINT [FK_DonVi_TrucThuoc] FOREIGN KEY([DVTrucThuocID])
REFERENCES [dbo].[DonVis] ([DVID])
GO
ALTER TABLE [dbo].[DonVis] CHECK CONSTRAINT [FK_DonVi_TrucThuoc]
GO
ALTER TABLE [dbo].[DongSans]  WITH CHECK ADD  CONSTRAINT [FK_DongSans_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DongSans] CHECK CONSTRAINT [FK_DongSans_KeKhai]
GO
ALTER TABLE [dbo].[GiaiTrinhs]  WITH CHECK ADD  CONSTRAINT [FK_GiaiTrinh_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiaiTrinhs] CHECK CONSTRAINT [FK_GiaiTrinh_KeKhai]
GO
ALTER TABLE [dbo].[GiaiTrinhs]  WITH CHECK ADD  CONSTRAINT [FK_GiaiTrinh_LoaiGiaiTrinh] FOREIGN KEY([LGTID])
REFERENCES [dbo].[LoaiGiaiTrinhs] ([LGTID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiaiTrinhs] CHECK CONSTRAINT [FK_GiaiTrinh_LoaiGiaiTrinh]
GO
ALTER TABLE [dbo].[HeSoLuongs]  WITH CHECK ADD  CONSTRAINT [FK_HeSoLuong_BacLuong] FOREIGN KEY([BLID])
REFERENCES [dbo].[BacLuongs] ([BLID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HeSoLuongs] CHECK CONSTRAINT [FK_HeSoLuong_BacLuong]
GO
ALTER TABLE [dbo].[HeSoLuongs]  WITH CHECK ADD  CONSTRAINT [FK_HeSoLuong_Ngach] FOREIGN KEY([NGID])
REFERENCES [dbo].[Ngaches] ([NGID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HeSoLuongs] CHECK CONSTRAINT [FK_HeSoLuong_Ngach]
GO
ALTER TABLE [dbo].[KeKhaiCons]  WITH CHECK ADD  CONSTRAINT [FK_KeKhaiCon_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KeKhaiCons] CHECK CONSTRAINT [FK_KeKhaiCon_KeKhai]
GO
ALTER TABLE [dbo].[KeKhais]  WITH CHECK ADD  CONSTRAINT [FK_KeKhai_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KeKhais] CHECK CONSTRAINT [FK_KeKhai_NhanVien]
GO
ALTER TABLE [dbo].[KyLuats]  WITH CHECK ADD  CONSTRAINT [FK_KyLuat_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KyLuats] CHECK CONSTRAINT [FK_KyLuat_NhanVien]
GO
ALTER TABLE [dbo].[KhenThuongs]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuong_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhenThuongs] CHECK CONSTRAINT [FK_KhenThuong_NhanVien]
GO
ALTER TABLE [dbo].[KhoanNos]  WITH CHECK ADD  CONSTRAINT [FK_KhoanNo_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhoanNos] CHECK CONSTRAINT [FK_KhoanNo_KeKhai]
GO
ALTER TABLE [dbo].[LamViecs]  WITH CHECK ADD  CONSTRAINT [FK_LamViec_ChucVu] FOREIGN KEY([CVID])
REFERENCES [dbo].[ChucVus] ([CVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LamViecs] CHECK CONSTRAINT [FK_LamViec_ChucVu]
GO
ALTER TABLE [dbo].[LamViecs]  WITH CHECK ADD  CONSTRAINT [FK_LamViec_DonVi] FOREIGN KEY([DVID])
REFERENCES [dbo].[DonVis] ([DVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LamViecs] CHECK CONSTRAINT [FK_LamViec_DonVi]
GO
ALTER TABLE [dbo].[LamViecs]  WITH CHECK ADD  CONSTRAINT [FK_LamViec_HeSoLuong] FOREIGN KEY([HSLID])
REFERENCES [dbo].[HeSoLuongs] ([HSLID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LamViecs] CHECK CONSTRAINT [FK_LamViec_HeSoLuong]
GO
ALTER TABLE [dbo].[LamViecs]  WITH CHECK ADD  CONSTRAINT [FK_LamViec_LamViec] FOREIGN KEY([LVThuoc])
REFERENCES [dbo].[LamViecs] ([LVID])
GO
ALTER TABLE [dbo].[LamViecs] CHECK CONSTRAINT [FK_LamViec_LamViec]
GO
ALTER TABLE [dbo].[LamViecs]  WITH CHECK ADD  CONSTRAINT [FK_LamViec_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LamViecs] CHECK CONSTRAINT [FK_LamViec_NhanVien]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChuyenMon] FOREIGN KEY([CMID])
REFERENCES [dbo].[ChuyenMons] ([CMID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_ChuyenMon]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_DanToc] FOREIGN KEY([DTID])
REFERENCES [dbo].[DanTocs] ([DTID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_DanToc]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_GiaoDucPhoThong] FOREIGN KEY([GDPTID])
REFERENCES [dbo].[GiaoDucPhoThongs] ([GDPTID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_GiaoDucPhoThong]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_LyLuanChinhTri] FOREIGN KEY([LLCTID])
REFERENCES [dbo].[LyLuanChinhTris] ([LLCTID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_LyLuanChinhTri]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhomMau] FOREIGN KEY([NMID])
REFERENCES [dbo].[NhomMaus] ([NMID])
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_NhomMau]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_QuanLyNhaNuoc] FOREIGN KEY([QLNNID])
REFERENCES [dbo].[QuanLyNhaNuocs] ([QLNNID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_QuanLyNhaNuoc]
GO
ALTER TABLE [dbo].[NhanViens]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TonGiao] FOREIGN KEY([TGID])
REFERENCES [dbo].[TonGiaos] ([TGID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanViens] CHECK CONSTRAINT [FK_NhanVien_TonGiao]
GO
ALTER TABLE [dbo].[Nhas]  WITH CHECK ADD  CONSTRAINT [FK_Nha_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nhas] CHECK CONSTRAINT [FK_Nha_KeKhai]
GO
ALTER TABLE [dbo].[PhongTangDanhHieux]  WITH CHECK ADD  CONSTRAINT [FK_PhongTangDanhHieu_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhongTangDanhHieux] CHECK CONSTRAINT [FK_PhongTangDanhHieu_NhanVien]
GO
ALTER TABLE [dbo].[PhuTrachChamCongs]  WITH CHECK ADD  CONSTRAINT [FK_PhuTrachChamCong_Account] FOREIGN KEY([ACCID])
REFERENCES [dbo].[Accounts] ([ACCID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhuTrachChamCongs] CHECK CONSTRAINT [FK_PhuTrachChamCong_Account]
GO
ALTER TABLE [dbo].[PhuTrachChamCongs]  WITH CHECK ADD  CONSTRAINT [FK_PhuTrachChamCong_DonVi] FOREIGN KEY([DVID])
REFERENCES [dbo].[DonVis] ([DVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhuTrachChamCongs] CHECK CONSTRAINT [FK_PhuTrachChamCong_DonVi]
GO
ALTER TABLE [dbo].[QuanHeCongTacs]  WITH CHECK ADD  CONSTRAINT [FK_QuanHeCongTac_QuanHe] FOREIGN KEY([QHID])
REFERENCES [dbo].[QuanHes] ([QHID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuanHeCongTacs] CHECK CONSTRAINT [FK_QuanHeCongTac_QuanHe]
GO
ALTER TABLE [dbo].[QuanHes]  WITH CHECK ADD  CONSTRAINT [FK_QuanHe_LoaiQuanHe] FOREIGN KEY([LQHID])
REFERENCES [dbo].[LoaiQuanHes] ([LQHID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuanHes] CHECK CONSTRAINT [FK_QuanHe_LoaiQuanHe]
GO
ALTER TABLE [dbo].[QuanHes]  WITH CHECK ADD  CONSTRAINT [FK_QuanHe_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuanHes] CHECK CONSTRAINT [FK_QuanHe_NhanVien]
GO
ALTER TABLE [dbo].[QuaTrinhDaoTaos]  WITH CHECK ADD  CONSTRAINT [FK_QuaTrinhDaoTao_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuaTrinhDaoTaos] CHECK CONSTRAINT [FK_QuaTrinhDaoTao_NhanVien]
GO
ALTER TABLE [dbo].[TaiSanKhacs]  WITH CHECK ADD  CONSTRAINT [FK_TaiSanKhac_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiSanKhacs] CHECK CONSTRAINT [FK_TaiSanKhac_KeKhai]
GO
ALTER TABLE [dbo].[TaiSanNuocNgoais]  WITH CHECK ADD  CONSTRAINT [FK_TaiSanNuocNgoai_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiSanNuocNgoais] CHECK CONSTRAINT [FK_TaiSanNuocNgoai_KeKhai]
GO
ALTER TABLE [dbo].[Tiens]  WITH CHECK ADD  CONSTRAINT [FK_Tien_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tiens] CHECK CONSTRAINT [FK_Tien_KeKhai]
GO
ALTER TABLE [dbo].[ThamGiaChinhTriXaHois]  WITH CHECK ADD  CONSTRAINT [FK_ThamGiaChinhTriXaHoi_ChinhTriXaHoi] FOREIGN KEY([CTXHID])
REFERENCES [dbo].[ChinhTriXaHois] ([CTXHID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThamGiaChinhTriXaHois] CHECK CONSTRAINT [FK_ThamGiaChinhTriXaHoi_ChinhTriXaHoi]
GO
ALTER TABLE [dbo].[ThamGiaChinhTriXaHois]  WITH CHECK ADD  CONSTRAINT [FK_ThamGiaChinhTriXaHoi_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThamGiaChinhTriXaHois] CHECK CONSTRAINT [FK_ThamGiaChinhTriXaHoi_NhanVien]
GO
ALTER TABLE [dbo].[ThuNhaps]  WITH CHECK ADD  CONSTRAINT [FK_ThuNhap_KeKhai] FOREIGN KEY([KKID])
REFERENCES [dbo].[KeKhais] ([KKID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThuNhaps] CHECK CONSTRAINT [FK_ThuNhap_KeKhai]
GO
ALTER TABLE [dbo].[TrinhDoNgoaiNgus]  WITH CHECK ADD  CONSTRAINT [FK_TrinhDoNgoaiNgu_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrinhDoNgoaiNgus] CHECK CONSTRAINT [FK_TrinhDoNgoaiNgu_NhanVien]
GO
ALTER TABLE [dbo].[TrinhDoTinHocs]  WITH CHECK ADD  CONSTRAINT [FK_TrinhDoTinHoc_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanViens] ([NVID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrinhDoTinHocs] CHECK CONSTRAINT [FK_TrinhDoTinHoc_NhanVien]
GO
