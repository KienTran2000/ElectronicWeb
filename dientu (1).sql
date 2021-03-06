USE [master]
GO
create database BanHangDienTu
go
USE BanHangDienTu
GO
/****** Object:  Table [dbo].[ADMINS]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINS](
	[MaNV] [int] NOT NULL,
	[TenLOGIN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.ADMINS] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIET_HOADON]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIET_HOADON](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CLIENTS]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTS](
	[MaKH] [int] NOT NULL,
	[TenLOGIN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.CLIENTS] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIOHANG]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIOHANG](
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [float] NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_dbo.GIOHANG] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANG_SX]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANG_SX](
	[MaHSX] [int] NOT NULL,
	[TenHSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.HANG_SX] PRIMARY KEY CLUSTERED 
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[NgayDatHang] [date] NULL,
	[Email] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GT] [nvarchar](5) NULL,
	[SDT] [char](10) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_dbo.KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIHANG](
	[MaLH] [int] NOT NULL,
	[TenLH] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.LOAIHANG] PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [int] NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GT] [nvarchar](5) NULL,
	[NS] [date] NULL,
	[SĐT] [char](13) NULL,
	[Luong] [float] NULL,
	[photo] [varchar](300) NULL,
 CONSTRAINT [PK_dbo.NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[TinhTrang] [nvarchar](30) NULL,
	[MaLH] [int] NULL,
	[MaHSX] [int] NULL,
	[Photo] [varchar](50) NULL,
	[NgaySX] [date] NULL,
 CONSTRAINT [PK_dbo.SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADMINS] ([MaNV], [TenLOGIN], [MatKhau]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[ADMINS] ([MaNV], [TenLOGIN], [MatKhau]) VALUES (2, N'admin2', N'1')
INSERT [dbo].[ADMINS] ([MaNV], [TenLOGIN], [MatKhau]) VALUES (4, N'admin4', N'1')
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (12, 2, 1, 18900000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (12, 8, 1, 12999000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (13, 9, 1, 2500000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (13, 15, 1, 13299000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (14, 10, 1, 13500000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (14, 14, 3, 17699000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (15, 14, 1, 17699000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (15, 16, 3, 15690000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (16, 10, 6, 13500000)
INSERT [dbo].[CHITIET_HOADON] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (16, 14, 1, 17699000)
INSERT [dbo].[CLIENTS] ([MaKH], [TenLOGIN], [MatKhau]) VALUES (1, N'kh001', N'1')
INSERT [dbo].[CLIENTS] ([MaKH], [TenLOGIN], [MatKhau]) VALUES (2, N'kh004', N'123')
INSERT [dbo].[CLIENTS] ([MaKH], [TenLOGIN], [MatKhau]) VALUES (3, N'kh002', N'1')
INSERT [dbo].[CLIENTS] ([MaKH], [TenLOGIN], [MatKhau]) VALUES (4, N'kh003', N'1')
INSERT [dbo].[GIOHANG] ([MaSP], [SoLuong], [Gia], [Photo]) VALUES (1, 1, 17900000, NULL)
INSERT [dbo].[GIOHANG] ([MaSP], [SoLuong], [Gia], [Photo]) VALUES (2, 2, 27800000, NULL)
INSERT [dbo].[GIOHANG] ([MaSP], [SoLuong], [Gia], [Photo]) VALUES (3, 2, 3000000, NULL)
INSERT [dbo].[GIOHANG] ([MaSP], [SoLuong], [Gia], [Photo]) VALUES (4, 1, 7800000, NULL)
INSERT [dbo].[HANG_SX] ([MaHSX], [TenHSX]) VALUES (1, N'Dell')
INSERT [dbo].[HANG_SX] ([MaHSX], [TenHSX]) VALUES (2, N'SamSung')
INSERT [dbo].[HANG_SX] ([MaHSX], [TenHSX]) VALUES (3, N'Sony')
INSERT [dbo].[HANG_SX] ([MaHSX], [TenHSX]) VALUES (4, N'Asus')
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([MaHD], [TenKH], [SDT], [DiaChi], [NgayDatHang], [Email]) VALUES (12, N'Tran Hong Duong', N'0387965252', N'Ha Nam', CAST(N'2019-05-24' AS Date), N'Phamduong@gmail.com')
INSERT [dbo].[HOADON] ([MaHD], [TenKH], [SDT], [DiaChi], [NgayDatHang], [Email]) VALUES (13, N'Trọng Đại', N'21212121  ', N'Hà nỘi', CAST(N'2019-05-29' AS Date), N'qw@gmail.com')
INSERT [dbo].[HOADON] ([MaHD], [TenKH], [SDT], [DiaChi], [NgayDatHang], [Email]) VALUES (14, N'Minh Lãm', N'3213231   ', N'càu giấy', CAST(N'2019-05-29' AS Date), N'qsad@gmail.com')
INSERT [dbo].[HOADON] ([MaHD], [TenKH], [SDT], [DiaChi], [NgayDatHang], [Email]) VALUES (15, N'Nguyễn Thị Thu Hà', N'0134675498', N'Phạm Văn Đồng,Hà Nội', CAST(N'2019-05-29' AS Date), N'ha@gmail.com')
INSERT [dbo].[HOADON] ([MaHD], [TenKH], [SDT], [DiaChi], [NgayDatHang], [Email]) VALUES (16, N'Phạm Duy Thái', N'0376543221', N'Trần Cung Hà Nội', CAST(N'2019-05-29' AS Date), N'thai12@gmail.com')
SET IDENTITY_INSERT [dbo].[HOADON] OFF
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [GT], [SDT], [NgaySinh]) VALUES (0, N'Phạm Minh Thái', N'Nam', N'0387651414', CAST(N'1991-10-10' AS Date))
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [GT], [SDT], [NgaySinh]) VALUES (1, N'Phạm Thế Hoạt', N'Nam', N'0325798653', CAST(N'1976-10-10' AS Date))
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [GT], [SDT], [NgaySinh]) VALUES (2, N'Trần Đức Hiền', N'Nam', N'0387644649', CAST(N'1977-02-10' AS Date))
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [GT], [SDT], [NgaySinh]) VALUES (3, N'Phạm Thế Quý', N'Nam', N'0384848765', CAST(N'1982-11-10' AS Date))
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [GT], [SDT], [NgaySinh]) VALUES (4, N'Trịnh Minh Trung', N'Nam', N'0347448899', CAST(N'1988-06-19' AS Date))
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (1, N'Laptop')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (2, N'SmartPhone')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (3, N'Phụ Kiện')
INSERT [dbo].[LOAIHANG] ([MaLH], [TenLH]) VALUES (4, N'Tai Nghe')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GT], [NS], [SĐT], [Luong], [photo]) VALUES (0, N'Phạm Duy Thái', N'Nu', CAST(N'1998-10-08' AS Date), N'0367654100   ', 1500000, N'ssdsadsa')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GT], [NS], [SĐT], [Luong], [photo]) VALUES (1, N'Phan Thị Cúc', N'Nữ', CAST(N'1998-10-10' AS Date), N'0361256545   ', 1500000, NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GT], [NS], [SĐT], [Luong], [photo]) VALUES (2, N'Phan Văn Nhật', N'Nam', CAST(N'1998-02-15' AS Date), N'0346461414   ', 5000000, NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GT], [NS], [SĐT], [Luong], [photo]) VALUES (3, N'Phan Hoàng Sơn', N'Nam', CAST(N'1998-04-19' AS Date), N'0368453912   ', 400000, NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [GT], [NS], [SĐT], [Luong], [photo]) VALUES (4, N'Trịnh Văn Hà', N'Nam', CAST(N'1996-10-10' AS Date), N'0358764157   ', 3600000, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (1, N'Dell Vostro 35600', 15000000, N'Mới', 1, 1, N'product08.png', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (2, N'SamSung Galaxy S10', 18900000, N'Mới', 2, 2, N'product07.png', CAST(N'2019-01-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (3, N'Tai Nghe Sony 365', 3500000, N'Mới', 3, 3, N'product02.png', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (4, N'Asus MX567', 12700000, N'Mới', 1, 4, N'product03.png', CAST(N'2018-10-03' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (5, N'Laptop MSI Gaming134', 15000000, N'Mới', 1, 1, N'product06.png', CAST(N'2018-10-05' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (8, N'SamSung Galaxy S7 Edge', 12999000, N'Mới', 2, 2, N'samsung j5.jpg', CAST(N'2018-12-07' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (9, N'Tai Nghe Sony Max 7658', 2500000, N'Mới', 3, 3, N'product05.png', CAST(N'2019-10-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (10, N'Laptop Sony Probook 7329', 13500000, N'Mới', 1, 3, N'product01.png', CAST(N'2020-02-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (13, N'Dell Inspirion G3 3569', 20899000, N'Mới', 1, 1, N'product10.png', CAST(N'2019-10-09' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (14, N'Laptop Asus Gaming M4310', 17699000, N'Mới', 1, 4, N'produc13.jpg', CAST(N'2020-01-01' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (15, N'Máy Ảnh Rekam', 13299000, N'Mới', 3, 3, N'product09.png', CAST(N'2018-10-10' AS Date))
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Gia], [TinhTrang], [MaLH], [MaHSX], [Photo], [NgaySX]) VALUES (16, N'Dell Inspiron 5370', 15690000, N'Mới', 1, 1, N'product14.jpg', CAST(N'2027-10-10' AS Date))
/****** Object:  Index [IX_MaNV]    Script Date: 6/10/2019 2:17:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaNV] ON [dbo].[ADMINS]
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaKH]    Script Date: 6/10/2019 2:17:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaKH] ON [dbo].[CLIENTS]
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaSP]    Script Date: 6/10/2019 2:17:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaSP] ON [dbo].[GIOHANG]
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaHSX]    Script Date: 6/10/2019 2:17:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaHSX] ON [dbo].[SANPHAM]
(
	[MaHSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaLH]    Script Date: 6/10/2019 2:17:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_MaLH] ON [dbo].[SANPHAM]
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADMINS]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ADMINS_dbo.NHANVIEN_MaNV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[ADMINS] CHECK CONSTRAINT [FK_dbo.ADMINS_dbo.NHANVIEN_MaNV]
GO
ALTER TABLE [dbo].[CHITIET_HOADON]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[CHITIET_HOADON]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CLIENTS]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CLIENTS_dbo.KHACHHANG_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[CLIENTS] CHECK CONSTRAINT [FK_dbo.CLIENTS_dbo.KHACHHANG_MaKH]
GO
ALTER TABLE [dbo].[GIOHANG]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GIOHANG_dbo.SANPHAM_MaSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[GIOHANG] CHECK CONSTRAINT [FK_dbo.GIOHANG_dbo.SANPHAM_MaSP]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SANPHAM_dbo.HANG_SX_MaHSX] FOREIGN KEY([MaHSX])
REFERENCES [dbo].[HANG_SX] ([MaHSX])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_dbo.SANPHAM_dbo.HANG_SX_MaHSX]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SANPHAM_dbo.LOAIHANG_MaLH] FOREIGN KEY([MaLH])
REFERENCES [dbo].[LOAIHANG] ([MaLH])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_dbo.SANPHAM_dbo.LOAIHANG_MaLH]
GO
/****** Object:  StoredProcedure [dbo].[HoaDonFull]    Script Date: 6/10/2019 2:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[HoaDonFull]
as
	SELECT        dbo.HOADON.MaHD, dbo.HOADON.TenKH, dbo.HOADON.SDT, dbo.HOADON.DiaChi, dbo.HOADON.NgayDatHang, dbo.HOADON.Email, dbo.CHITIET_HOADON.MaSP, 
                         dbo.CHITIET_HOADON.SoLuong, dbo.CHITIET_HOADON.DonGia
	FROM            dbo.CHITIET_HOADON INNER JOIN
                         dbo.HOADON ON dbo.CHITIET_HOADON.MaHD = dbo.HOADON.MaHD
GO
USE [master]
GO
ALTER DATABASE [BanHangDienTu] SET  READ_WRITE 
GO
