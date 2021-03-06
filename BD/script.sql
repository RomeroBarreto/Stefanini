USE [master]
GO
/****** Object:  Database [DbStf]    Script Date: 06/06/2018 19:23:00 ******/
CREATE DATABASE [DbStf]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database', FILENAME = N'C:\Projetos\Stefanini\BD\DbStf.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Database_log', FILENAME = N'C:\Projetos\Stefanini\BD\DbStf.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DbStf] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbStf].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbStf] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbStf] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbStf] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbStf] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbStf] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbStf] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbStf] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [DbStf] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbStf] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbStf] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbStf] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbStf] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbStf] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbStf] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbStf] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbStf] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbStf] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbStf] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbStf] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbStf] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbStf] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbStf] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbStf] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbStf] SET  MULTI_USER 
GO
ALTER DATABASE [DbStf] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbStf] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbStf] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbStf] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DbStf] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbStf] SET QUERY_STORE = OFF
GO
USE [DbStf]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DbStf]
GO
/****** Object:  Table [dbo].[City]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[RegionId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Classification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[GenderId] [int] NOT NULL,
	[CityId] [int] NULL,
	[RegionId] [int] NULL,
	[LastPurchase] [date] NULL,
	[ClassificationId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSys]    Script Date: 06/06/2018 19:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](40) NOT NULL,
	[UserRoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [RegionId]) VALUES (1, N'Porto Alegre', 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Classification] ON 

INSERT [dbo].[Classification] ([Id], [Name]) VALUES (1, N'VIP')
INSERT [dbo].[Classification] ([Id], [Name]) VALUES (2, N'Regular')
INSERT [dbo].[Classification] ([Id], [Name]) VALUES (3, N'Sporadic')
SET IDENTITY_INSERT [dbo].[Classification] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Phone], [GenderId], [CityId], [RegionId], [LastPurchase], [ClassificationId], [UserId]) VALUES (1, N'Maurício', N'(11) 95429999', 1, 1, 1, CAST(N'2016-09-10' AS Date), 1, 3)
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [GenderId], [CityId], [RegionId], [LastPurchase], [ClassificationId], [UserId]) VALUES (2, N'Carla', N'(53) 94569999', 2, 1, 1, CAST(N'2015-10-10' AS Date), 1, 2)
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [GenderId], [CityId], [RegionId], [LastPurchase], [ClassificationId], [UserId]) VALUES (3, N'Maria', N'(64) 94518888', 2, 1, 1, CAST(N'2013-10-12' AS Date), 3, 2)
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [GenderId], [CityId], [RegionId], [LastPurchase], [ClassificationId], [UserId]) VALUES (4, N'Douglas', N'(51) 12455555', 1, 1, 1, CAST(N'2016-05-05' AS Date), 2, 2)
INSERT [dbo].[Customer] ([Id], [Name], [Phone], [GenderId], [CityId], [RegionId], [LastPurchase], [ClassificationId], [UserId]) VALUES (5, N'Marta', N'(51) 45788888', 2, 1, 1, CAST(N'2016-08-08' AS Date), 2, 3)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [Name]) VALUES (1, N'Masculine ')
INSERT [dbo].[Gender] ([Id], [Name]) VALUES (2, N'Feminine  ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name]) VALUES (1, N'Rio Grande do Sul')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (2, N'São Paulo')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (3, N'Curitiba')
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [Name], [IsAdmin]) VALUES (1, N'Administrator ', 1)
INSERT [dbo].[UserRole] ([Id], [Name], [IsAdmin]) VALUES (2, N'Seller ', 0)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[UserSys] ON 

INSERT [dbo].[UserSys] ([Id], [Login], [Email], [Password], [UserRoleId]) VALUES (1, N'Administrator', N'admin@sellseverything.com', N'admin123', 1)
INSERT [dbo].[UserSys] ([Id], [Login], [Email], [Password], [UserRoleId]) VALUES (2, N'Seller1', N'seller1@sellseverything.com', N'seller1123', 2)
INSERT [dbo].[UserSys] ([Id], [Login], [Email], [Password], [UserRoleId]) VALUES (3, N'Seller2', N'seller2@sellseverything.com', N'seller2123', 2)
SET IDENTITY_INSERT [dbo].[UserSys] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
USE [master]
GO
ALTER DATABASE [DbStf] SET  READ_WRITE 
GO
