USE [master]
GO
/****** Object:  Database [BookManagementDB]    Script Date: 7/17/2023 11:31:37 AM ******/
CREATE DATABASE [BookManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHICUONG\MSSQL\DATA\BookManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHICUONG\MSSQL\DATA\BookManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookManagementDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookManagementDB]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboProduct]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Discount] [nchar](10) NULL,
 CONSTRAINT [PK_ComboProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ImageUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Floor]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FloorNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Floor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[PicUrl] [nvarchar](max) NULL,
	[TimeSlotId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](50) NULL,
	[CheckInDate] [datetime] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[ShippingFee] [float] NULL,
	[FinalAmount] [float] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DeliveryPhone] [nvarchar](50) NULL,
	[OrderType] [int] NOT NULL,
	[TimeSlotId] [int] NOT NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductName] [nchar](255) NULL,
	[Quantity] [int] NOT NULL,
	[FinalAmount] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[ProductInMenuId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](255) NULL,
	[Price] [float] NOT NULL,
	[Detail] [nvarchar](100) NULL,
	[Status] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SupplierStoreId] [int] NOT NULL,
	[GeneralProductId] [int] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInMenu]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Price] [float] NULL,
	[Active] [bit] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
 CONSTRAINT [PK_ProductInMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [nvarchar](50) NULL,
	[FloorId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[StoreCode] [nvarchar](50) NULL,
	[CreateAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/17/2023 11:31:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArriveTime] [time](7) NOT NULL,
	[CheckoutTime] [time](7) NOT NULL,
	[IsActive] [bit] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Id], [Name]) VALUES (1, N'1')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (1, N'Cơm', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (2, N'Đồ Ăn Vặt', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (3, N'Thức Uống', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (4, N'Bánh', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (5, N'Nước', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (6, N'Khác', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (7, N'Ưu Đãi', 1, CAST(N'2023-06-21T00:00:00.000' AS DateTime), CAST(N'2023-06-21T00:00:00.000' AS DateTime), N'No')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Phone], [Email], [ImageUrl]) VALUES (1, N'Cuongvo', N'0938929584', N'cuongvo@gmail.com', N'1')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Floor] ON 

INSERT [dbo].[Floor] ([Id], [FloorNumber]) VALUES (1, N'1')
SET IDENTITY_INSERT [dbo].[Floor] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [Type], [PicUrl], [TimeSlotId], [CreateAt], [UpdateAt]) VALUES (4, N'Cơm Trưa Ngon Miệng', 1, N'1', 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (1, N'Cơm Sườn', N'https://nhaxinhplaza.vn/wp-content/uploads/cach-lam-com-suon-nuong.jpg', 2, N'a', 0, CAST(N'2023-07-16T22:01:48.007' AS DateTime), NULL, 1, 1, 1, NULL, N'ms01')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (2, N'Sườn Trứng', N'https://nghebep.com/wp-content/uploads/2017/07/com-tam-1.jpg', 2, N'aa', 0, CAST(N'2023-07-16T22:11:35.810' AS DateTime), NULL, 1, 1, 1, NULL, N'ms02')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (3, N'Cơm Gà', N'https://i.ytimg.com/vi/Qn9VCUpKLHk/maxresdefault.jpg', 2, N'a', 0, CAST(N'2023-07-16T22:13:23.240' AS DateTime), NULL, 1, 1, 1, NULL, N'ms03')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (4, N'Cơm Sườn Bò', N'https://media.viez.vn/prod/2022/4/15/large_HI_01546_dc1c3e5af1.png', 3, N'aaa', 0, CAST(N'2023-07-16T22:14:21.700' AS DateTime), NULL, 1, 1, 1, NULL, N'ms04')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (5, N'Nem Chua', N'https://cdn.tgdd.vn/2020/07/CookRecipe/Avatar/nem-chua-ran-thumbnail.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:19:10.907' AS DateTime), NULL, 2, 1, 1, NULL, N'ms05')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (6, N'B.Gà Chiên', N'https://cdn.tgdd.vn/2021/02/CookRecipe/Avatar/banh-ga-chien-thumbnail.jpg', 2, N'aa', 0, CAST(N'2023-07-16T22:28:23.897' AS DateTime), NULL, 2, 1, 1, NULL, N'string')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (7, N'K.Tây Chiên', N'https://s.meta.com.vn/Data/image/2020/03/04/cach-lam-khoai-tay-chien-bang-noi-chien-khong-dau-3.jpg', 1, N'aa', 0, CAST(N'2023-07-16T22:30:37.347' AS DateTime), NULL, 2, 1, 1, NULL, N'ms07')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (8, N'Kim Bắp', N'https://daynauan.info.vn/wp-content/uploads/2019/05/com-cuon-kimbap.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:31:56.393' AS DateTime), NULL, 2, 1, 1, NULL, N'ms08')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (9, N'Trà Đào', N'https://channel.mediacdn.vn/thumb_w/640/2019/3/8/photo-1-15520438700571233711429.jpg', 2, N'aa', 0, CAST(N'2023-07-16T22:35:05.553' AS DateTime), NULL, 3, 1, 1, NULL, N'ms09')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (10, N'Trà Vải', N'https://file.hstatic.net/200000079049/article/nguyen-lieu-pha-che-do-uong_71f7d669ee3d4bb5b16ab5dc5ca9e972.jpg', 2, N'a', 0, CAST(N'2023-07-16T22:36:03.290' AS DateTime), NULL, 3, 1, 1, NULL, N'ms10')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (11, N'Trà Sữa', N'https://www.thuongdo.com/sites/default/files/u165605/do-uong-trung-quoc-3.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:37:20.953' AS DateTime), NULL, 3, 1, 1, NULL, N'ms11')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (12, N'Trà Dâu', N'https://websitecukcukvn.misacdn.net/wp-content/uploads/2022/04/Tra-dau-nam-my-chanh-vang-2.jpeg', 1, N'a', 0, CAST(N'2023-07-16T22:38:35.970' AS DateTime), NULL, 3, 1, 1, NULL, N'ms12')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (13, N'Hamburger', N'https://911pro.net/wp-content/uploads/2021/08/dia-diem-ban-hamburger-ngon-nhat-tai-sai-gon-1.jpg', 3, N'a', 0, CAST(N'2023-07-16T22:40:35.210' AS DateTime), NULL, 4, 1, 1, NULL, N'ms13')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (14, N'Bánh Pizza', N'https://toplist.vn/images/800px/loai-banh-pizza-ngon-nhat-the-gioi-169339.jpg', 3, N'a', 0, CAST(N'2023-07-16T22:41:51.327' AS DateTime), NULL, 4, 1, 1, NULL, N'ms14')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (15, N' Sandwich', N'https://flt.com.vn/wp-content/uploads/2021/02/nhung-dieu-ban-co-the-chua-biet-ve-loai-banh-sandwich-recipeimages-jambonsandwich.jpg', 3, N'a', 0, CAST(N'2023-07-16T22:45:02.400' AS DateTime), NULL, 4, 1, 1, NULL, N'ms15')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (16, N'Bánh Mì', N'https://diemdungchandongthap.com/wp-content/uploads/2021/06/banh-my.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:46:10.263' AS DateTime), NULL, 4, 1, 1, NULL, N'ms16')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (17, N'Coca Cola', N'https://product.hstatic.net/200000356473/product/cocacola-chai-390ml_7214ffae946e4e63826e8f38a45ed5fa_1024x1024.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:48:31.293' AS DateTime), NULL, 5, 1, 1, NULL, N'ms17')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (18, N'Pesi', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/470/160/products/nuoc-ngot-pepsi-chai-nhua-390ml-1670473313601.png?v=1670473317583', 1, N'a', 0, CAST(N'2023-07-16T22:48:59.467' AS DateTime), NULL, 5, 1, 1, NULL, N'ms18')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (19, N'7up', N'https://storage.googleapis.com/onelife-public/8934588023132.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:49:57.787' AS DateTime), NULL, 5, 1, 1, NULL, N'ms19')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (20, N'Sting', N'https://bizweb.dktcdn.net/thumb/large/100/469/765/products/nuoc-tang-luc-sting-gold-chai-330ml-201912021713292469.jpg', 1, N'a', 0, CAST(N'2023-07-16T22:50:45.560' AS DateTime), NULL, 5, 1, 1, NULL, N'ms20')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (21, N'Bánh Panera', N'https://hips.hearstapps.com/hmg-prod/images/starbucks-spinach-feta-egg-white-wrap-1531772733.jpg', 3, N'a', 0, CAST(N'2023-07-16T22:57:34.583' AS DateTime), NULL, 6, 1, 1, NULL, N'ms21')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (22, N'Gà Rán', N'https://media-cdn.tripadvisor.com/media/photo-s/14/eb/f4/33/fried-chicken.jpg', 3, N'a', 0, CAST(N'2023-07-16T22:58:22.770' AS DateTime), NULL, 6, 1, 1, NULL, N'ms22')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (23, N'Spaghetti', N'https://sanremo.imgix.net/2019/10/Tubular-Spaghetti-w-Nap-Sauce-3-1-1500x1000.jpg?auto=format&w=2000', 3, N'a', 0, CAST(N'2023-07-16T22:58:57.660' AS DateTime), NULL, 6, 1, 1, NULL, N'ms23')
INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (24, N'Hot Dog', N'https://www.eatthis.com/wp-content/uploads/sites/4/2021/12/hot-dogs-e1673488524148.jpg?quality=82&strip=all', 3, N'a', 0, CAST(N'2023-07-16T22:59:39.787' AS DateTime), NULL, 6, 1, 1, NULL, N'ms24')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductInMenu] ON 

INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (1, 1, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (2, 2, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (3, 3, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (4, 4, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (5, 5, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (6, 6, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (7, 7, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (8, 8, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (9, 9, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (10, 10, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (11, 11, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (12, 12, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (13, 13, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (14, 14, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (15, 15, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (16, 16, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (17, 17, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (18, 18, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (19, 19, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (20, 20, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (21, 21, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (22, 22, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (23, 23, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (24, 24, 4, 1, 1, CAST(N'2023-07-16T22:01:48.007' AS DateTime), CAST(N'2023-07-16T22:01:48.007' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductInMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomNumber], [FloorId], [AreaId]) VALUES (2, N'aa', 1, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([Id], [Name], [Phone], [StoreCode], [CreateAt], [UpdateAt], [Active]) VALUES (1, N'711', N'0776190244', N'F01', CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-12T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Store] ([Id], [Name], [Phone], [StoreCode], [CreateAt], [UpdateAt], [Active]) VALUES (2, N'CircleK', N'0776190244', N'F02', CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-12T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Store] ([Id], [Name], [Phone], [StoreCode], [CreateAt], [UpdateAt], [Active]) VALUES (3, N'MiniStop', N'0776190244', N'F03', CAST(N'2023-06-12T12:00:00.000' AS DateTime), CAST(N'2023-06-12T12:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([Id], [ArriveTime], [CheckoutTime], [IsActive], [Status]) VALUES (1, CAST(N'06:30:00' AS Time), CAST(N'07:00:00' AS Time), 1, 1)
INSERT [dbo].[TimeSlot] ([Id], [ArriveTime], [CheckoutTime], [IsActive], [Status]) VALUES (2, CAST(N'09:15:00' AS Time), CAST(N'09:45:00' AS Time), 1, 1)
INSERT [dbo].[TimeSlot] ([Id], [ArriveTime], [CheckoutTime], [IsActive], [Status]) VALUES (3, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), 1, 1)
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
/****** Object:  Index [IX_ComboProduct_ProductId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComboProduct_ProductId] ON [dbo].[ComboProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menu_TimeSlotId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Menu_TimeSlotId] ON [dbo].[Menu]
(
	[TimeSlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_RoomId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Order_RoomId] ON [dbo].[Order]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductInMenuId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductInMenuId] ON [dbo].[OrderDetail]
(
	[ProductInMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_SupplierStoreId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Product_SupplierStoreId] ON [dbo].[Product]
(
	[SupplierStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInMenu_MenuId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInMenu_MenuId] ON [dbo].[ProductInMenu]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInMenu_ProductId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInMenu_ProductId] ON [dbo].[ProductInMenu]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_AreaId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Room_AreaId] ON [dbo].[Room]
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_FloorId]    Script Date: 7/17/2023 11:31:38 AM ******/
CREATE NONCLUSTERED INDEX [IX_Room_FloorId] ON [dbo].[Room]
(
	[FloorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComboProduct]  WITH CHECK ADD  CONSTRAINT [FK_ComboProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ComboProduct] CHECK CONSTRAINT [FK_ComboProduct_Product]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_TimeSlot] FOREIGN KEY([TimeSlotId])
REFERENCES [dbo].[TimeSlot] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_TimeSlot]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Room1] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Room1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductInMenu] FOREIGN KEY([ProductInMenuId])
REFERENCES [dbo].[ProductInMenu] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductInMenu]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([SupplierStoreId])
REFERENCES [dbo].[Store] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
GO
ALTER TABLE [dbo].[ProductInMenu]  WITH CHECK ADD  CONSTRAINT [FK_ProductInMenu_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[ProductInMenu] CHECK CONSTRAINT [FK_ProductInMenu_Menu]
GO
ALTER TABLE [dbo].[ProductInMenu]  WITH CHECK ADD  CONSTRAINT [FK_ProductInMenu_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductInMenu] CHECK CONSTRAINT [FK_ProductInMenu_Product]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Area] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Area]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Floor] FOREIGN KEY([FloorId])
REFERENCES [dbo].[Floor] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Floor]
GO
USE [master]
GO
ALTER DATABASE [BookManagementDB] SET  READ_WRITE 
GO
