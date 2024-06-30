USE [CAKESHOP]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](50) NULL,
	[DonGia] [float] NOT NULL,
	[Hinh] [nvarchar](50) NOT NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietHoaDon]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vChiTietHoaDon]
AS 
	SELECT cthd.*, TenHH
	FROM ChiTietHD cthd JOIN HangHoa hh 
		ON hh.MaHH = cthd.MaHH


GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [nvarchar](50) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhanhSP]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhanhSP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[HinhAnhPhu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](20) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](60) NOT NULL,
	[DienThoai] [nvarchar](24) NOT NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NOT NULL,
	[TraLoi] [nvarchar](50) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](50) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaPB] [varchar](7) NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 6/30/2024 10:54:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[MaKH] [nvarchar](20) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (2, 4, 10011, 485000, 3, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (3, 4, 10033, 1500000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (4, 5, 10037, 48000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (5, 7, 10031, 4100000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (6, 7, 10014, 650000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (7, 7, 10026, 46000, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (8, 8, 10026, 46000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (9, 8, 10014, 650000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (10, 9, 10029, 370000, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (11, 9, 10024, 35000, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1002, N'Flan Gato Strawberry – Flan Gato Dâu', N'banh-kem-dau.png', 1000, N'24 cm', 735000, N'banh-kem-dau.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hương vị: Hương thơm và mùi vị: Ngọt dịu – Béo nhẹ – Thơm – Đắng nhẹ

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Bánh flan vị truyền thống

+ Bông lan sô-cô-la

Phần trang trí: jelly caramel, dâu tươi, kem tươi

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (1009, N'Flan Gato Berry Mix', N' flan-gato-berry-mix', 1000, N'16 cm x 20 cm', 415000, N'khong-logo-2x3_5.png', CAST(N'2023-07-30T07:00:00.000' AS DateTime), 0, 1, N'Hương vị: Phần thân bánh gồm các lớp chính:

+ Bánh flan vị truyền thống

+ Bông lan sô-cô-la

Phần trang trí: jelly caramel, dâu tươi, việt quất

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10010, N'Flan Gato Fruit & Pins – Flan Gato Trái Cây', N'flan-gato-fruit-pins', 1000, N'20 cm', 515000, N'Flan-ghim-800x1132.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hương vị: Ngọt dịu – Béo nhẹ – Đắng nhẹ

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Bánh flan vị truyền thống

+ Bông lan sô-cô-la

Phần trang trí: jelly caramel, vụn bánh gato, dâu tươi, đào, việt quất, kem tươi

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)

Phân loại: Bánh Flan Gato', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10011, N'Tropical Vibes Mousse – Mousse Ổi hồng & Chanh dây', N'mousse-oi-hong-chanh-day', 1001, N'16cm x 20cm x 24cm', 485000, N'TAI5791-800x1200.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1378, N'Hương vị: Chua thanh – Ngọt tự nhiên – Thơm nhẹ

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Mousse ổi xá lị, phúc bồn tử, sô-cô-la

+ Nhân ổi xá lị

+ Bông lan vị vani

+ Nhân chanh dây

Phần trang trí: Dâu tươi, jelly, búp kem, sô-cô-la

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)

Phân loại: Bánh mousse', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10012, N'Chéri Lady – Entremet Cherry', N'cheri-lady-entremet-cherry', 1000, N'16cm x 20cm', 595000, N'Cherry-1-800x1201.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Hương vị: Ngọt dịu – Chua thanh – Thơm tự nhiên – Béo nhẹ

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Mousse cherry

+ Nhân cherry và rượu cherry

+ Nhân sô-cô-la tươi vị matcha

+ Bông lan vị vani

Phần trang trí: Quả mâm xôi, jelly, sô-cô-la trắng phun xù, tráng gương.

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10013, N'Happy Sunrise – Entremet Thanh Trà', N'happy-sunrise-entremet-thanh-tra', 1000, N'28cm', 595000, N'ThanhTra-2-800x1200.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 100000, 50, N'Hương vị: Chua ngọt dịu nhẹ – Hương thơm đặc trưng – Thanh mát

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Mousse thanh trà tươi

+ Nhân xoài Hoà Lộc, cam Bergamot, vani

+ Nhân hạt điều, chà là, dừa sấy

+ Bông lan vị matcha

Phần trang trí: sô-cô-la trắng tạo hình, tráng gương bóng, hoa cúc tươi.

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:

+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10014, N'My Muse – Entremet Ôlong Vải Hoa Hồng', N'my-muse-entremet-olong-vai-hoa-hong', 1000, N'28cm', 650000, N'MY-MUSE-1-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Hương thơm và mùi vị: Chua ngọt nhẹ –  hương thơm tự nhiên

Cấu trúc bánh:

Phần thân bánh gồm các lớp chính:

+ Mousse trà ôlong

+ Nhân vải hoa hồng

+ Bông lan vị trà ôlong

Phần trang trí: Lớp tráng gương bóng bảy, tạo hình hoa trà, vòng tròn sô-cô-la bao quanh.

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:
+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10015, N'Vani kem tươi socola', N'vani-kem-tuoi-socola', 1000, N'16cm x 20cm', 270000, N'vani-kemtuoi-socola.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 50, N'Hương vị: Cốt mứt mâm xôi, bông lan truyền thống và kem tươi vani.

Các size bánh: Size 18 cao ~7cm (5 – 7 người ăn); Size 22 cao ~7cm (9 – 11 người ăn); Size 25 cao ~ 7cm ( 12-15 người ăn)

Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!

Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.

Phụ kiện tặng kèm:
+ 1 dao cắt bánh

+ 1 bộ dĩa và muỗng

+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10016, N'Bánh Kem Dâu và Vani', N'fresh-strawberry-vanilla-charlotte', 1000, N'20cm', 595000, N'CHARLOTTEBD_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 1080, N'Hương vị: Mousse dâu, kem bavaroise vani, mứt dâu, bánh lady fingers, các loại dâu tươi.
Cấu trúc bánh:
Có chứa Gluten, sữa, trứng, gelatin.
Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10017, N'Classic Tiramisu Coffee Bean', N'classic-tiramisu-coffee-bean', 1000, N'16cm x 20cm', 495000, N'CLASSICTIRA01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 900, N'Hương vị: Bánh lady fingers thấm espresso & rượu rum, kem tiramisu cùng lớp vỏ sô cô la.
Cấu trúc bánh:
Có chứa Gluten, sữa, trứng, gelatin.
Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10018, N'Classic Tiramisu Trà Xanh ', N'classic-matcha-tiramisu', 1000, N'20cm x 24cm', 510000, N'MATCHATIRA01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 900, N'Hương vị: BBánh quy mềm ngâm mâm xôi & hương thảo, kem tiramisu mềm, phủ kem phô mai matcha.
Cấu trúc bánh:
Có chứa Gluten, sữa, trứng, gelatin.
Hoa ăn được hữu cơ từ Đà Lạt.
Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10019, N'Su Kem Hạt Phỉ', N'hazelnut-chou', 1001, N'20cm', 105000, N'HAZELNUTCHOCOCHOU_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Hương vị: Croissant Pháp, praline Hạt Phỉ, kem hạt phỉ, và kem tươi
Cấu trúc bánh:
Có chứa Gluten, sữa, trứng, gelatin.
Hoa ăn được hữu cơ từ Đà Lạt.
Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10020, N'Bánh Kem Dâu và Vani', N'fresh-strawberry-vanilla-charlotte', 1001, N'16cm', 101000, N'CHARLOTTEPG_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 240, N'Hương vị: Mousse dâu, kem bavaroise vani, mứt dâu, bánh lady finger, dâu tươi từ Đà Lạt và hạt vani.
Cấu trúc bánh:
Với bánh đặt theo yêu cầu Quý khách vui lòng đặt trước 24h – 48h để Origato phục vụ Quý khách chu đáo nhất!
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10021, N'Bánh Ốp La Cheesecake', N'fresh-cake-op-la', 1001, N'28cm', 85000, N'OPLA1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Hương vị: Bánh cheesecake không nướng với kem phô mai & đậu nành, sốt trứng muối, sốt chanh, bánh mirliton không gluten. Được yêu thích tại Bakes!
Ít đường
Không hương liệu nhân tạo
Không chứa gluten
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10022, N'Bánh Kem Chuối và Dừa', N'banana-coconut-mousse', 1001, N'24cm', 95000, N'BANANACOCOMOUSSEPG_01.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Hương vị: Mứt chuối, mousse dừa, praliné hạt điều, bánh génoise, kem tươi chuối.
Không chứa gluten
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10023, N'Bánh Tiramisu Lava', N'tiramisu-lava', 1001, N'20cm', 110000, N'TIRAMISU1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Hương vị: Bánh lady fingers thấm espresso & rượu rum, kem tiramisu cùng lớp kem phô mai Baileys chảy.
Không màu thực phẩm
Không hương liệu nhân tạo
Ít đường
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10024, N'Bánh sừng bò truyền thống (Croissant plain)', N'banh-croissant', 1002, N'Cái', 35000, N'banh-sung-bo-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Hương vị: bột mì, bơ và các nguyên liệu chất lượng cao khiến chiếc bánh có kết cấu xốp, giòn và rất thơm mùi bơ.
Bánh sừng bò là một nét đặc trưng của văn hóa ẩm thực Pháp và rất phổ biến trên toàn châu Âu. 
Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10025, N'Bánh sừng bò hạnh nhân (Croissant amandes)', N'banh-sung-bo-hanh-nhan', 1002, N'Cái', 68000, N'banh-sung-bo-hanh-nhan-1.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 10, N'Hương vị: Bột mì, bơ, hạnh nhân thái lát và các nguyên liệu chất lượng cao. Chiếc bánh có kết cấu xốp, giòn, rất thơm mùi bơ, hòa quyện cùng vị thơm bùi và giòn tan của hạnh nhân mang đến cảm giác thích thú. 
Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10026, N'Bánh sừng bò sô cô la (Croissant au)', N'banh-sung-bo-so-co-la', 1002, N'Cái', 46000, N'croissant-chocolate_2.png', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 11, N'Hương vị: Bột mì, bơ và các nguyên liệu chất lượng cao, đặc biệt là  Sô cô la Pháp thượng hạng. Chiếc bánh có kết cấu xốp, giòn và rất thơm mùi bơ, hòa quyện cùng vị ngọt đắng đầy quyến rũ của sô cô la Pháp. 
Bánh thường được dùng để ăn sáng kèm bơ, mứt cùng trà hoặc café.
Bảo quản: Bánh nên được dùng trong ngày và ngon hơn khi bảo quản lạnh trước khi thưởng thức.
Phụ kiện tặng kèm:
+ 1 dao cắt bánh
+ 1 bộ dĩa và muỗng
+ 10 nến nhỏ (hoặc nến số nếu bạn yêu cầu)', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10027, N'Ban Mai', N'bo-hoa-1', 1003, N'Bó', 610000, N'ban-mai-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 200, N'Tình yêu luôn là một tình cảm đầy diệu kì mà tinh khiết. Chỉ cần tình yêu, thế giới xung quanh bạn có thể trở thành một màu hồng đầy tươi sáng. 
Bó hoa được lấy cảm hứng từ vẻ đẹp của tình yêu đó, được tạo nên từ những cánh hồng với tông màu pastel cùng cát tường trắng và các loại hoa tươi nhất.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10028, N'Nụ Hoa Hé Mở (Mẫu Đơn)', N'bo-hoa-2', 1003, N'Bó', 2990000, N'mau-don-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 200, N'Những bông mẫu đơn hồng tượng trưng cho tình yêu dịu dàng, lãng mạn. Bó hoa cúc mẫu đơn nụ cười dịu dàng sẽ là lựa chọn hoàn hỏa để gửi đến một nửa của bạn trong dịp sinh nhật hay bất cứ ngày đặc biệt nào.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10029, N'Little Tana', N'little-tana', 1003, N'Bó', 370000, N'bo-hoa-cuc-tana-little-tana.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 250, N'Bó hoa Little Tana nhỏ xinh được thiết kế từ hoa cúc tana theo phong cách đơn giản, mộc mạc phù hợp để làm hoa tặng tốt nghiệp hay hoa sinh nhật người thân, bạn bè.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10030, N'Angel Babya', N'Bo-hoa-Angel-Baby', 1003, N'Bó', 1130000, N'Angel_Baby.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Bó hoa Little Tana nhỏ xinh được thiết kế từ hoa cúc tana theo phong cách đơn giản, mộc mạc phù hợp để làm hoa tặng tốt nghiệp hay hoa sinh nhật người thân, bạn bè.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10031, N'Kệ Hoa Chúc Mừng - 01', N'hoa-chuc-mung-01', 1003, N'Bó', 4100000, N'hoa-chuc-mung-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 123, N'Sản phẩm bao gồm:
+ Hồng Ecuador Free Spirit: 25 Cành
+ Hoa Hồng Tỉ Muội cam: 3 Bó
+ Baby: 1 Bó
+ Lá bạc: 2 Bó
+ Hoa Green Wicky: 2 Bó
+ Chuỗi Ngọc xanh: 1 Bó
+ Lá: 2 Bó
+ Kệ: 1 Cái', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10032, N'Bánh sừng bò trứng muối', N'banh-sung-bo-trung-muoi', 1002, N'Cái', 50000, N'banh-sung-bo-trung-muoi-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Sự kết hợp hoàn hảo giữa bánh croissant và sốt trứng muối.
Để tăng độ hấp dẫn cho món ăn, BBang đã thêm một loại sốt chấm mới cho bánh croissant. Đó chính là bánh croissant chấm sốt trứng muối. Một chiếc bánh croissant tưởng chừng đơn giản nhưng khi chấm sốt trứng muối lại hòa hợp vô cùng.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10033, N'Kệ Hoa Chúc Mừng - 02', N'ke-hoa-chuc-mung-02', 1003, N'Bó', 1500000, N'ke-hoa-chuc-mung2-1.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 300, N'Sản phẩm bao gồm:
+ Rose Red Naomi PRE: 3 Bó
+ Cây Sen Đá: 5 cây (hình dáng ngẫu nhiên)
+ Hoa Cúc Santini/ Calimero/ Rossi: 3 Bó
+ Lá: 3 Bó
+ Lá Bạc: 1 Bó
+ Kệ Sắt + Giấy/Nơ/Ribbon: 1 Cái', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10037, N'Bánh Mì Hoa Cúc', N'banh-mi-hoa-cuc', 1002, N'Cái', 48000, N'banhmihoacuc.jpg', CAST(N'2023-07-31T07:00:00.000' AS DateTime), 0, 250, N'Bánh croissant (hay còn được gọi là bánh sừng bò) - Một loại bánh yêu thích của bao tín đồ “hảo ngọt”. Không chỉ ghi điểm ở phần bánh ngàn lớp thơm mềm mịn, giòn tan, lôi cuốn mà còn bởi sốt chấm đặc biệt.', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10053, N'Bánh Tiramisu Xoài và Chanh Dây', N'mango-passionfruit-tiramisu', 1000, N'15cm', 475000, N'MANGOPASSIONFRUITTIRA_01.jpg', CAST(N'2024-06-10T21:36:00.000' AS DateTime), 0, 48, N'Kem tiramisu, mứt xoài và chanh dây, bánh lady fingers thấm xoài và chanh dây, thạch xoài và chanh dây, kem tươi.  🥜 Có Gluten, sữa, trứng, gelatin.  📏 15cm', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10054, N'Bánh Kem Trà Xanh Dâu Latte', N'strawberry-matcha-latte-mousse', 1000, N'18cm', 585000, N'STRAWBERRYMATCHALATTEBD_01.jpg', CAST(N'2024-05-18T21:45:00.000' AS DateTime), 49999, 37, N'Kem matcha, ganache matcha, kem ganache matcha, mousse dâu, bánh lady fingers thấm latte Trà Xanh.  🥜 Có chứa Gluten, sữa, trứng, gelatin 📏 18cm', N'NL')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10055, N'Bánh Trá Xanh Dâu Latte Croissant', N'strawberry-matcha-latte-croissant', 1002, N'Cái', 64000, N'STRAWBERRYMATCHALATTE_01.jpg', CAST(N'2024-01-09T22:05:00.000' AS DateTime), 0, 12, N'Bánh croissant Sazanka matcha, mứt dâu, kem sữa matcha, ganache matcha', N'NL')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HinhanhSP] ON 

INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (1, 1002, N'banh-kem-dau1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (2, 1002, N'banh-kem-dau2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (3, 1009, N'khong-logo-2x3_2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (4, 1009, N'khong-logo-2x3_5.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (5, 10010, N'Flan-ghim-800x1132.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (6, 10010, N'khong-logo-2x3_8.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (7, 10010, N'khong-logo-2x3_1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (8, 10011, N'TAI5791-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (9, 10011, N'TAI5954-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (10, 10011, N'TAI5896-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (11, 10011, N'TAI5909-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (12, 10012, N'Cherry-focus-1-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (13, 10012, N'Cherry-Slice-1-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (14, 10012, N'Cherry-Slice-800x1198.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (15, 10013, N'ThanhTra-2-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (16, 10013, N'ThanhTra-topdown-800x1200.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (17, 10013, N'ThanhTra-slice-1-800x1196.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (18, 10014, N'MY-MUSE-1-1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (19, 10014, N'MY-MUSE-4.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (20, 10014, N'1x1-MY-MUSE-4-800x800.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (21, 10015, N'vani-kemtuoi-socola.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (22, 10016, N'CHARLOTTEBD_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (23, 10016, N'CHARLOTTEBD_03_1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (24, 10016, N'CHARLOTTEBD_04_4.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (25, 10017, N'CLASSICTIRA01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (26, 10017, N'CLASSICTIRA05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (27, 10017, N'CLASSICTIRA02_1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (28, 10018, N'MATCHATIRA01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (29, 10018, N'MATCHATIRA05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (30, 10018, N'MATCHATIRA02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (31, 10019, N'HAZELNUTCHOCOCHOU_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (32, 10019, N'HAZELNUTCHOCOCHOU_05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (33, 10019, N'HAZELNUTCHOCOCHOU_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (34, 10020, N'CHARLOTTEPG_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (35, 10020, N'CHARLOTTEPG_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (36, 10020, N'CHARLOTTEPG_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (37, 10021, N'OPLA1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (38, 10021, N'OPLA3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (39, 10021, N'OPLA2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (40, 10022, N'BANANACOCOMOUSSEPG_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (41, 10022, N'BANANACOCOMOUSSEPG_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (43, 10022, N'BANANACOCOMOUSSEPG_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (44, 10023, N'TIRAMISU1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (45, 10023, N'TIRAMISU2.jpg.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (46, 10024, N'banh-sung-bo-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (47, 10024, N'banh-sung-bo-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (48, 10025, N'banh-sung-bo-hanh-nhan-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (49, 10025, N'banh-sung-bo-hanh-nhan-1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (50, 10026, N'croissant-chocolate_1.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (51, 10026, N'croissant-chocolate_2.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (52, 10027, N'ban-mai-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (53, 10027, N'ban-mai-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (54, 10028, N'mau-don-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (55, 10028, N'mau-don-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (56, 10029, N'bo-hoa-cuc-tana-little-tana.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (57, 10029, N'bo-hoa-cuc-tana-little-tana2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (58, 10030, N'Angel_Baby.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (59, 10030, N'Angel_Baby1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (60, 10031, N'hoa-chuc-mung-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (61, 10031, N'hoa-chuc-mung-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (62, 10032, N'banh-sung-bo-trung-muoi-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (63, 10032, N'banh-sung-bo-trung-muoi-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (64, 10031, N'hoa-chuc-mung-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (65, 10032, N'banh-sung-bo-trung-muoi-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (66, 10033, N'ke-hoa-chuc-mung2-1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (67, 10033, N'ke-hoa-chuc-mung2-2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (68, 10033, N'ke-hoa-chuc-mung2-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (69, 10037, N'banhmihoacuc.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (70, 10037, N'banhmihoacuc1.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (71, 10037, N'banhmihoacuc2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (72, 10028, N'mau-don-3.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (74, 10015, N'vani-kemtuoi-socola2.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (78, 1002, N'banh-kem-dau.png')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (79, 10053, N'MANGOPASSIONFRUITTIRA_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (80, 10053, N'MANGOPASSIONFRUITTIRA_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (81, 10053, N'MANGOPASSIONFRUITTIRA_05.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (82, 10054, N'STRAWBERRYMATCHALATTEBD_04.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (83, 10054, N'STRAWBERRYMATCHALATTEBD_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (84, 10054, N'STRAWBERRYMATCHALATTEBD_01.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (85, 10055, N'STRAWBERRYMATCHALATTE_02.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (86, 10055, N'STRAWBERRYMATCHALATTE_03.jpg')
INSERT [dbo].[HinhanhSP] ([Id], [MaHH], [HinhAnhPhu]) VALUES (87, 1002, N'STRAWBERRYMATCHALATTE_01.jpg')
SET IDENTITY_INSERT [dbo].[HinhanhSP] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (4, N'phamtuyen121314', CAST(N'2024-06-21T09:52:39.770' AS DateTime), CAST(N'2024-06-21T09:52:39.873' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (5, N'phamtuyen121314', CAST(N'2024-06-21T09:56:05.917' AS DateTime), CAST(N'2024-06-21T09:56:06.020' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, N'Giao liền cho anh')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (6, N'phamtuyen121314', CAST(N'2024-06-29T10:30:21.303' AS DateTime), CAST(N'2024-06-29T10:30:21.507' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Quận 4', N'0901002220', N'COD', N'Viettel Post', 0, 0, NULL, N'Giao trong ngày nhé')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (7, N'phamtuyen121314', CAST(N'2024-06-29T10:31:06.487' AS DateTime), CAST(N'2024-06-29T10:31:06.500' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (8, N'phamtuyen121314', CAST(N'2024-06-29T10:31:23.897' AS DateTime), CAST(N'2024-06-29T10:31:23.907' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (9, N'phamtuyen121314', CAST(N'2024-06-29T10:32:05.657' AS DateTime), CAST(N'2024-06-29T10:32:05.657' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Nguyễn Phạm Tuyên', N'Xã Bông Trang', N'0943948068', N'COD', N'Viettel Post', 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ALFKI', N'iloveyou', N'Maria Anders', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Obere Str. 57', N'030-0074321', N'alfki@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ANATR', N'iloveyou', N'Ana Trujillo', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Avda. de la Constitución 2222', N'(5) 555-4729', N'anatr@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ANTON', N'iloveyou', N'Antonio Moreno', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Mataderos  2312', N'(5) 555-3932', N'anton@abc.com', N'User.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'AROUT', N'iloveyou', N'Thomas Hardy', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'120 Hanover Sq.', N'(171) 555-7788', N'arout@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BERGS', N'iloveyou', N'Christina Berglund', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berguvsvägen  8', N'0921-12 34 65', N'bergs@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BLAUS', N'iloveyou', N'Hanna Moos', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Forsterstr. 57', N'0621-08460', N'blaus@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BLONP', N'iloveyou', N'Frédérique Citeaux', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'24, place Kléber', N'88.60.15.31', N'blonp@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BOLID', N'iloveyou', N'Martín Sommer', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Araquil, 67', N'(91) 555 22 82', N'bolid@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BONAP', N'iloveyou', N'Laurence Lebihan', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'12, rue des Bouchers', N'91.24.45.40', N'bonap@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BOTTM', N'iloveyou', N'Elizabeth Lincoln', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'23 Tsawassen Blvd.', N'(604) 555-4729', N'bottm@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'BSBEV', N'iloveyou', N'Victoria Ashworth', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Fauntleroy Circus', N'(171) 555-1212', N'bsbev@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CACTU', N'iloveyou', N'Patricio Simpson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Cerrito 333', N'(1) 135-5555', N'cactu@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CENTC', N'iloveyou', N'Francisco Chang', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Sierras de Granada 9993', N'(5) 555-3392', N'centc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CHOPS', N'iloveyou', N'Yang Wang', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Hauptstr. 29', N'0452-076545', N'chops@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'COMMI', N'iloveyou', N'Pedro Afonso', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. dos Lusíadas, 23', N'(11) 555-7647', N'commi@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'CONSH', N'iloveyou', N'Elizabeth Brown', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berkeley Gardens 12  Brewery', N'(171) 555-2282', N'consh@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'DRACD', N'iloveyou', N'Sven Ottlieb', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Walserweg 21', N'0241-039123', N'dracd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'DUMON', N'iloveyou', N'Janine Labrune', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'67, rue des Cinquante Otages', N'40.67.88.88', N'dumon@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'EASTC', N'iloveyou', N'Ann Devon', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'35 King George', N'(171) 555-0297', N'eastc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ERNSH', N'iloveyou', N'Roland Mendel', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Kirchgasse 6', N'7675-3425', N'ernsh@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FAMIA', N'iloveyou', N'Aria Cruz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua Orós, 92', N'(11) 555-9857', N'famia@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FISSA', N'iloveyou', N'Diego Roel', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Moralzarzal, 86', N'(91) 555 94 44', N'fissa@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FOLIG', N'iloveyou', N'Martine Rancé', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'184, chaussée de Tournai', N'20.16.10.16', N'folig@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FOLKO', N'iloveyou', N'Maria Larsson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Åkergatan 24', N'0695-34 67 21', N'folko@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANK', N'iloveyou', N'Peter Franken', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Berliner Platz 43', N'089-0877310', N'frank@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANR', N'iloveyou', N'Carine Schmitt', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'54, rue Royale', N'40.32.21.21', N'franr@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FRANS', N'iloveyou', N'Paolo Accorti', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Via Monte Bianco 34', N'011-4988260', N'frans@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'FURIB', N'iloveyou', N'Lino Rodriguez', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Jardim das rosas n. 32', N'(1) 354-2534', N'furib@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GALED', N'iloveyou', N'Eduardo Saavedra', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rambla de Cataluña, 23', N'(93) 203 4560', N'galed@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GODOS', N'iloveyou', N'José Pedro Freyre', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'C/ Romero, 33', N'(95) 555 82 82', N'godos@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GOURL', N'iloveyou', N'André Fonseca', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Brasil, 442', N'(11) 555-9482', N'gourl@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GREAL', N'iloveyou', N'Howard Snyder', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2732 Baker Blvd.', N'(503) 555-7555', N'greal@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'GROSR', N'iloveyou', N'Manuel Pereira', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'5ª Ave. Los Palos Grandes', N'(2) 283-2951', N'grosr@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HANAR', N'iloveyou', N'Mario Pontes', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua do Paço, 67', N'(21) 555-0091', N'hanar@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HILAA', N'iloveyou', N'Carlos Hernández', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35', N'(5) 555-1340', N'hilaa@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HUNGC', N'iloveyou', N'Yoshi Latimer', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'City Center Plaza 516 Main St.', N'(503) 555-6874', N'hungc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HUNGO', N'iloveyou', N'Patricia McKenna', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'8 Johnstown Road', N'2967 542', N'hungo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ISLAT', N'iloveyou', N'Helen Bennett', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Garden House Crowther Way', N'(198) 555-8888', N'islat@abc.com', N'User.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'KOENE', N'iloveyou', N'Philip Cramer', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Maubelstr. 90', N'0555-09876', N'koene@abc.com', N'User.jpg', 1, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LACOR', N'iloveyou', N'Daniel Tonini', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'67, avenue de l''Europe', N'30.59.84.10', N'lacor@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LAMAI', N'iloveyou', N'Annette Roulet', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'1 rue Alsace-Lorraine', N'61.77.61.10', N'lamai@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LAUGB', N'iloveyou', N'Yoshi Tannamuri', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'1900 Oak St.', N'(604) 555-3392', N'laugb@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LAZYK', N'iloveyou', N'John Steel', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'12 Orchestra Terrace', N'(509) 555-7969', N'lazyk@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LEHMS', N'iloveyou', N'Renate Messner', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Magazinweg 7', N'069-0245984', N'lehms@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LETSS', N'iloveyou', N'Jaime Yorres', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'87 Polk St. Suite 5', N'(415) 555-5938', N'letss@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LILAS', N'iloveyou', N'Carlos González', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'(9) 331-6954', N'lilas@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LINOD', N'iloveyou', N'Felipe Izquierdo', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Ave. 5 de Mayo Porlamar', N'(8) 34-56-12', N'linod@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'LONEP', N'iloveyou', N'Fran Wilson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'89 Chiaroscuro Rd.', N'(503) 555-9573', N'lonep@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'MAGAA', N'iloveyou', N'Giovanni Rovelli', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Via Ludovico il Moro 22', N'035-640230', N'magaa@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'MAISD', N'iloveyou', N'Catherine Dewey', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rue Joseph-Bens 532', N'(02) 201 24 67', N'maisd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'MEREP', N'iloveyou', N'Jean Fresnière', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'43 rue St. Laurent', N'(514) 555-8054', N'merep@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'MORGK', N'iloveyou', N'Alexander Feuer', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Heerstr. 22', N'0342-023176', N'morgk@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'NORTS', N'iloveyou', N'Simon Crowther', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'South House 300 Queensbridge', N'(171) 555-7733', N'norts@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'OCEAN', N'iloveyou', N'Yvonne Moncada', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A', N'(1) 135-5333', N'ocean@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'OLDWO', N'iloveyou', N'Rene Phillips', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2743 Bering St.', N'(907) 555-7584', N'oldwo@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'OTTIK', N'iloveyou', N'Henriette Pfalzheim', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Mehrheimerstr. 369', N'0221-0644327', N'ottik@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PARIS', N'iloveyou', N'Marie Bertrand', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'265, boulevard Charonne', N'(1) 42.34.22.66', N'paris@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PERIC', N'iloveyou', N'Guillermo Fernández', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Calle Dr. Jorge Cash 321', N'(5) 552-3745', N'peric@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'phamtuyen121314', N'1d297c39556f0c3486278084fbf66482', N'Nguyễn Phạm Tuyên', 1, CAST(N'2003-10-22T00:00:00.000' AS DateTime), N'Xã Bông Trang', N'0943948068', N'phamtuyen121314@gmail.com', N'54ffde11-227d-466d-a8da-8573ab264c13.jpg', 1, 0, N'PCpoD')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PICCO', N'iloveyou', N'Georg Pipps', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Geislweg 14', N'6562-9722', N'picco@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'PRINI', N'iloveyou', N'Isabel de Castro', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Estrada da saúde n. 58', N'(1) 356-5634', N'prini@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'QUEDE', N'iloveyou', N'Bernardo Batista', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua da Panificadora, 12', N'(21) 555-4252', N'quede@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'QUEEN', N'iloveyou', N'Lúcia Carvalho', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Alameda dos Canàrios, 891', N'(11) 555-1189', N'queen@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'QUICK', N'iloveyou', N'Horst Kloss', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Taucherstraße 10', N'0372-035188', N'quick@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RANCH', N'iloveyou', N'Sergio Gutiérrez', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. del Libertador 900', N'(1) 123-5555', N'ranch@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RATTC', N'iloveyou', N'Paula Wilson', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2817 Milton Dr.', N'(505) 555-5939', N'rattc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'REGGC', N'iloveyou', N'Maurizio Moroni', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Strada Provinciale 124', N'0522-556721', N'reggc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RICAR', N'iloveyou', N'Janete Limeira', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Copacabana, 267', N'(21) 555-3412', N'ricar@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'RICSU', N'iloveyou', N'Michael Holz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Grenzacherweg 237', N'0897-034214', N'ricsu@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'ROMEY', N'iloveyou', N'Alejandra Camino', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Gran Vía, 1', N'(91) 745 6200', N'romey@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SANTG', N'iloveyou', N'Jonas Bergulfsen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Erling Skakkes gate 78', N'07-98 92 35', N'santg@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SAVEA', N'iloveyou', N'Jose Pavarotti', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'187 Suffolk Ln.', N'(208) 555-8097', N'savea@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SEVES', N'iloveyou', N'Hari Kumar', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'90 Wadhurst Rd.', N'(171) 555-1717', N'seves@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SIMOB', N'iloveyou', N'Jytte Petersen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Vinbæltet 34', N'31 12 34 56', N'simob@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SPECD', N'iloveyou', N'Dominique Perrier', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'25, rue Lauriston', N'(1) 47.55.60.10', N'specd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SPLIR', N'iloveyou', N'Art Braunschweiger', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'P.O. Box 555', N'(307) 555-4680', N'splir@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'SUPRD', N'iloveyou', N'Pascale Cartrain', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Boulevard Tirou, 255', N'(071) 23 67 22 20', N'suprd@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'THEBI', N'iloveyou', N'Liz Nixon', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'89 Jefferson Way Suite 2', N'(503) 555-3612', N'thebi@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'THECR', N'iloveyou', N'Liu Wong', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'55 Grizzly Peak Rd.', N'(406) 555-5834', N'thecr@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TOMSP', N'iloveyou', N'Karin Josephs', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Luisenstr. 48', N'0251-031259', N'tomsp@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TORTU', N'iloveyou', N'Miguel Angel Paolino', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Avda. Azteca 123', N'(5) 555-2933', N'tortu@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TRADH', N'iloveyou', N'Anabela Domingues', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Av. Inês de Castro, 414', N'(11) 555-2167', N'tradh@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'TRAIH', N'iloveyou', N'Helvetius Nagy', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'722 DaVinci Blvd.', N'(206) 555-8257', N'traih@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VAFFE', N'iloveyou', N'Palle Ibsen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Smagsloget 45', N'86 21 32 43', N'vaffe@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VICTE', N'iloveyou', N'Mary Saveley', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'2, rue du Commerce', N'78.32.54.86', N'victe@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'VINET', N'iloveyou', N'Paul Henriot', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'59 rue de l''Abbaye', N'26.47.15.10', N'vinet@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WANDK', N'iloveyou', N'Rita Müller', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Adenauerallee 900', N'0711-020361', N'wandk@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WARTH', N'iloveyou', N'Pirkko Koskitalo', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Torikatu 38', N'981-443655', N'warth@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WELLI', N'iloveyou', N'Paula Parente', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Rua do Mercado, 12', N'(14) 555-8122', N'welli@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WHITC', N'iloveyou', N'Karl Jablonski', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'305 - 14th Ave. S. Suite 3B', N'(206) 555-4112', N'whitc@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WILMK', N'iloveyou', N'Matti Karttunen', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'Keskuskatu 45', N'90-224 8858', N'wilmk@abc.com', N'User.jpg', 0, 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'WOLZA', N'iloveyou', N'Zbyszek Piestrzeniewicz', 0, CAST(N'2009-08-01T15:10:40.857' AS DateTime), N'ul. Filtrowa 68', N'(26) 642-7012', N'wolza@abc.com', N'User.jpg', 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1000, N'Bánh kem', N'banh-kem', N'Bánh kem ngon và đa dạng', N'MY-MUSE-1-1.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1001, N'Bánh ngọt', N'banh-ngot', N'Bánh ngọt phong phú và hấp dẫn', N'Certificate.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1002, N'Bánh mặn', N'banh-man', N'Bánh mặn thơm ngon và đa dạng', N'banh-sung-bo-hanh-nhan-1.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1003, N'Hoa tươi', N'hoa-tuoi', N'Các loại hoa tươi đẹp và tươi mới', N'Bell.png')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'HH', N'Hoai Hieu Bakery', N'hieukhung.bakery.jpg', N'Nguyễn Thị Hoài Hiếu', N'hieukhungroi@gmail.com', N'0901002220', N'Binh Chanh', N'Công ty chuyên bánh bao, bánh răng')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'NL', N'NhaLam', N'apple.gif', N'Pham Tuyen', N'pike@yahoo.com', N'0987345876', N'765 Hello, Califonia, United States', N'Cake Shop')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'PT', N'Phuong Thanh Bakery', N'phuongthanh.meomeo.bakery', N'Phan Thị Phương Thanh', N'thanhchodien@gmail.com', N'0730889210', N'Vincom ThuDuc', N'Công ty đồ ăn vặt bên trong bệnh viện trung ương 3')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'PTu', N'Phạm Tuyên R&B', N'famtwen22.png', N'Nguyễn Phạm Tuyên', N'nptuyen121314@gmail.com', N'0380011101', N'Tăng Nhơn Phú', N'Công ty chuyên môi giới đồ ăn, sản phẩm chất lượng thấp VN')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (N'VB', N'Vu Beo Bakery', N'vubeo.bakery.webp', N'Trần Nhật Vũ', N'trannhatvu@gmail.com', N'087355122', N'Thao Dien', N'Công ty chuyên bánh ngọt, bánh xe')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'lvc', N'Lê Văn C', N'lvc@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nva', N'Trần Văn A', N'tva@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'nvb', N'Nguyễn Văn B', N'nvb@gmail.com', N'8fb31c8536177f3c388cf45a650de3f6')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'phamtuyenad', N'Nguyễn Phạm Tuyên', N'phamtuyen121314@gmail.com', N'672da35ad5b262e2e69afb6fd68ce8cb')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'tranvanq', N'Trần Thị A', N'wiener@tikitaka.net', N'8fb31c8536177f3c388cf45a650de3f6')
GO
SET IDENTITY_INSERT [dbo].[PhanCong] ON 

INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (2, N'nva', N'BGD', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (3, N'lvc', N'BGD', CAST(N'2017-12-17T10:15:51.303' AS DateTime), 1)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (7, N'nvb', N'PKT', CAST(N'2017-12-17T10:16:39.180' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (12, N'phamtuyenad', N'BGD', CAST(N'2024-05-17T10:16:39.180' AS DateTime), 0)
INSERT [dbo].[PhanCong] ([MaPC], [MaNV], [MaPB], [NgayPC], [HieuLuc]) VALUES (20, N'tranvanq', N'PKTo', CAST(N'2024-06-11T06:05:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PhanCong] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyen] ON 

INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (16, N'BGD', 1, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (17, N'BGD', 2, 0, 0, 0, 0)
INSERT [dbo].[PhanQuyen] ([MaPQ], [MaPB], [MaTrang], [Them], [Sua], [Xoa], [Xem]) VALUES (18, N'BGD', 3, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[PhanQuyen] OFF
GO
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'BGD', N'Ban Giám Đốc', N'Chỉ thị mọi nhiệm vụ công tác phải làm. Đề xuất các mục tiêu dự kiến trong quý.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'DVL', N'Develoment', N'Phụ trách việc chỉnh sửa website của Công Ty')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKD', N'Phòng kinh doanh', N'Phân tích các sản phẩm bán được. Dự kiến nguồn Sale và đề xuất tăng trưởng số xuất bán của các mặt hàng.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKT', N'Phòng Kỹ thuật', N'Nhận thông tin điều chỉnh và phát triển các kỹ thuật tại doanh nghiệp, đảm nhận nhiệm vụ hỗ trợ mở rộng các doanh nghiệp mới.')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB], [ThongTin]) VALUES (N'PKTo', N'Phòng Kế toán', N'Thu thập dữ liệu và đưa ra sơ đồ tổng thể từng hạng mục cho phòng ban Kinh Doanh.')
GO
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (-1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
GO
SET IDENTITY_INSERT [dbo].[TrangWeb] ON 

INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (1, N'Trang chủ Admin', N'Default.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (2, N'Quản lý Đơn hàng', N'QLDonHang.aspx')
INSERT [dbo].[TrangWeb] ([MaTrang], [TenTrang], [URL]) VALUES (3, N'Quản lý Hàng hóa', N'QLHangHoa.aspx')
SET IDENTITY_INSERT [dbo].[TrangWeb] OFF
GO
ALTER TABLE [dbo].[BanBe] ADD  CONSTRAINT [DF_Promotions_Sent]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[ChiTietHD] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_NgayGY]  DEFAULT (getdate()) FOR [NgayGY]
GO
ALTER TABLE [dbo].[GopY] ADD  CONSTRAINT [DF_GopY_CanTraLoi]  DEFAULT ((0)) FOR [CanTraLoi]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [NgaySX]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Discount]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[HangHoa] ADD  CONSTRAINT [DF_Products_Votes]  DEFAULT ((0)) FOR [SoLanXem]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_RequireDate]  DEFAULT (getdate()) FOR [NgayCan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippedDate]  DEFAULT (((1)/(1))/(1900)) FOR [NgayGiao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_PaymentMethod]  DEFAULT (N'Cash') FOR [CachThanhToan]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_ShippingMethod]  DEFAULT (N'Airline') FOR [CachVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [PhiVanChuyen]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((0)) FOR [MaTrangThai]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayDua]  DEFAULT (getdate()) FOR [NgayDua]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Gender]  DEFAULT ((0)) FOR [GioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Birthday]  DEFAULT (getdate()) FOR [NgaySinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Hinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_Active]  DEFAULT ((0)) FOR [HieuLuc]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_Customers_UserLevel]  DEFAULT ((0)) FOR [VaiTro]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Them]  DEFAULT ((0)) FOR [Them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Sua]  DEFAULT ((0)) FOR [Sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xoa]  DEFAULT ((0)) FOR [Xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_Xem]  DEFAULT ((0)) FOR [Xem]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_QuangBa_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_QuangBa_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[HinhanhSP]  WITH CHECK ADD  CONSTRAINT [FK__HinhanhSP__MaHH__18EBB532] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[HinhanhSP] CHECK CONSTRAINT [FK__HinhanhSP__MaHH__18EBB532]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Customers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_Favorites_Customers]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
