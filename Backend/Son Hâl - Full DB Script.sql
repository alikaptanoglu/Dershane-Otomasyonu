USE [master]
GO
/****** Object:  Database [proje]    Script Date: 21.12.2017 10:18:09 ******/
CREATE DATABASE [proje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\proje.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'proje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\proje_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [proje] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proje] SET ARITHABORT OFF 
GO
ALTER DATABASE [proje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proje] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proje] SET RECOVERY FULL 
GO
ALTER DATABASE [proje] SET  MULTI_USER 
GO
ALTER DATABASE [proje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [proje] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'proje', N'ON'
GO
USE [proje]
GO
/****** Object:  Table [dbo].[alan]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alan](
	[alan_id] [int] IDENTITY(1,1) NOT NULL,
	[alan_ad] [nvarchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[alan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[alan_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[alan_dersleri]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alan_dersleri](
	[alan_dersleri_id] [int] IDENTITY(1,1) NOT NULL,
	[alan_id] [int] NULL,
	[ders_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[alan_dersleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[alan_id] ASC,
	[ders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[deneme]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deneme](
	[deneme_id] [int] IDENTITY(1,1) NOT NULL,
	[deneme_seviye] [nvarchar](2) NOT NULL,
	[deneme_tarih] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[deneme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[deneme_seviye] ASC,
	[deneme_tarih] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dersler]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dersler](
	[ders_id] [int] IDENTITY(1,1) NOT NULL,
	[ders_ad] [nvarchar](30) NOT NULL,
	[ders_seviye] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ders_ad] ASC,
	[ders_seviye] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[devamsizlik]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devamsizlik](
	[ogr_id] [int] NULL,
	[tarih] [date] NULL CONSTRAINT [df_tarih]  DEFAULT (getdate()),
UNIQUE NONCLUSTERED 
(
	[ogr_id] ASC,
	[tarih] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoca]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hoca](
	[hoca_id] [int] IDENTITY(1,1) NOT NULL,
	[hoca_ad] [nvarchar](30) NOT NULL,
	[hoca_soyad] [nvarchar](30) NOT NULL,
	[hoca_tel] [nvarchar](10) NULL,
	[hoca_ucret] [int] NOT NULL,
	[hoca_tc] [char](11) NULL,
	[hoca_kayit_tarih] [date] NULL CONSTRAINT [df_hoca_kayit]  DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[hoca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[hoca_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[hoca_tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hoca_dersleri]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoca_dersleri](
	[hoca_dersleri_id] [int] IDENTITY(1,1) NOT NULL,
	[ders_id] [int] NULL,
	[hoca_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hoca_dersleri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[islemler]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islemler](
	[kullanici_ad] [nvarchar](20) NULL,
	[islem_tip] [nvarchar](12) NULL,
	[islem] [nvarchar](50) NULL,
	[tarih] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kitaplar]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitaplar](
	[kitap_id] [int] IDENTITY(1,1) NOT NULL,
	[ders_id] [int] NULL,
	[kitap_ad] [nvarchar](30) NOT NULL,
	[kitap_yayin] [nvarchar](20) NOT NULL,
	[kitap_ucret] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[kitap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ders_id] ASC,
	[kitap_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kullanicilar]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanicilar](
	[kullanici_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_ad] [nvarchar](20) NULL,
	[kullanici_sifre] [nvarchar](20) NULL,
	[ogretmen_islemleri] [bit] NULL,
	[veli_ogrenci_islemleri] [bit] NULL,
	[ders_islemleri] [bit] NULL,
	[sinav_islemleri] [bit] NULL,
	[kullanici_islemleri] [bit] NULL,
	[devamsizlik_islemleri] [bit] NULL,
	[arsiv_islemleri] [bit] NULL,
	[son_giris_tarih] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[kullanici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[kullanici_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ogrenci](
	[ogr_id] [int] IDENTITY(1000,1) NOT NULL,
	[ogr_tc] [char](11) NOT NULL,
	[ogr_ad] [nvarchar](20) NULL,
	[ogr_soyad] [nvarchar](20) NULL,
	[veli_id] [int] NULL,
	[sube_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ogr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ogr_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ogrenci_deneme]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci_deneme](
	[ogrenci_deneme_id] [int] IDENTITY(1,1) NOT NULL,
	[deneme_id] [int] NULL,
	[ogr_id] [int] NULL,
	[turkce_net] [float] NULL,
	[sosyal_net] [float] NULL,
	[matematik_net] [float] NULL,
	[fen_net] [float] NULL,
	[puan_ygs_1] [float] NULL,
	[puan_ygs_2] [float] NULL,
	[puan_ygs_3] [float] NULL,
	[puan_ygs_4] [float] NULL,
	[puan_ygs_5] [float] NULL,
	[puan_ygs_6] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ogrenci_deneme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[deneme_id] ASC,
	[ogr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ogrenci_detay]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci_detay](
	[ogr_id] [int] NULL,
	[ogr_tel] [nvarchar](10) NULL,
	[ogr_adres] [nvarchar](50) NOT NULL,
	[ogr_okul] [nvarchar](30) NOT NULL,
	[ogr_kayit_tar] [date] NULL CONSTRAINT [df_kayit_tarih]  DEFAULT (getdate()),
	[ogr_dogum_tar] [date] NOT NULL,
	[ogr_ucret] [int] NULL CONSTRAINT [df_ogr_ucret]  DEFAULT ((2000)),
UNIQUE NONCLUSTERED 
(
	[ogr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[silinen_hoca]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_hoca](
	[hoca_id] [int] NULL,
	[hoca_ad] [nvarchar](30) NULL,
	[hoca_soyad] [nvarchar](30) NULL,
	[hoca_tel] [nvarchar](10) NULL,
	[hoca_ucret] [int] NULL,
	[hoca_tc] [char](11) NULL,
	[hoca_kayit_tarih] [date] NULL,
	[hoca_silinme_tarih] [date] NULL CONSTRAINT [df_hoca_silinme_tarih]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[silinen_hoca_yedek]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_hoca_yedek](
	[hoca_id] [int] NULL,
	[hoca_ad] [nvarchar](30) NULL,
	[hoca_soyad] [nvarchar](30) NULL,
	[hoca_tel] [nvarchar](10) NULL,
	[hoca_ucret] [int] NULL,
	[hoca_tc] [char](11) NULL,
	[hoca_kayit_tarih] [date] NULL,
	[hoca_silinme_tarih] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[silinen_ogrenci]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_ogrenci](
	[ogr_id] [int] NULL,
	[ogr_tc] [char](11) NULL,
	[ogr_ad] [nvarchar](20) NULL,
	[ogr_soyad] [nvarchar](20) NULL,
	[veli_id] [int] NULL,
	[sube_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[silinen_ogrenci_detay]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[silinen_ogrenci_detay](
	[ogr_id] [int] NULL,
	[ogr_tel] [nvarchar](10) NULL,
	[ogr_adres] [nvarchar](50) NULL,
	[ogr_okul] [nvarchar](30) NULL,
	[ogr_kayit_tar] [date] NULL,
	[ogr_dogum_tar] [date] NULL,
	[ogr_ucret] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[silinen_ogrenci_detay_yedek]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[silinen_ogrenci_detay_yedek](
	[ogr_id] [int] NULL,
	[ogr_tel] [nvarchar](10) NULL,
	[ogr_adres] [nvarchar](50) NULL,
	[ogr_okul] [nvarchar](30) NULL,
	[ogr_kayit_tar] [date] NULL,
	[ogr_dogum_tar] [date] NULL,
	[ogr_ucret] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[silinen_ogrenci_yedek]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_ogrenci_yedek](
	[ogr_id] [int] NULL,
	[ogr_tc] [char](11) NULL,
	[ogr_ad] [nvarchar](20) NULL,
	[ogr_soyad] [nvarchar](20) NULL,
	[veli_id] [int] NULL,
	[sube_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[silinen_veli]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_veli](
	[veli_id] [int] NULL,
	[veli_ad] [nvarchar](30) NULL,
	[veli_soyad] [nvarchar](30) NULL,
	[veli_tel] [nvarchar](10) NULL,
	[veli_tc] [char](11) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[silinen_veli_yedek]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[silinen_veli_yedek](
	[veli_id] [int] NULL,
	[veli_ad] [nvarchar](30) NULL,
	[veli_soyad] [nvarchar](30) NULL,
	[veli_tel] [nvarchar](10) NULL,
	[veli_tc] [char](11) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sube]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sube](
	[sube_id] [int] IDENTITY(1,1) NOT NULL,
	[sube_harf] [nvarchar](1) NULL,
	[sube_seviye] [nvarchar](2) NULL,
	[alan_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sube_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sube_harf] ASC,
	[sube_seviye] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[veli]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[veli](
	[veli_id] [int] IDENTITY(1,1) NOT NULL,
	[veli_ad] [nvarchar](30) NOT NULL,
	[veli_soyad] [nvarchar](30) NOT NULL,
	[veli_tel] [nvarchar](10) NULL,
	[veli_tc] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[veli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[veli_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[veli_tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_Ders]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Ders] AS


Select 
	
	d.ders_id,
	d.ders_ad,
	d.ders_seviye,
	h.hoca_ad as Veren_Hoca_Ad,
	h.hoca_soyad as Veren_Hoca_Soyad,
	h.hoca_tc as Veren_Hoca_TC
	
	
from 

dersler d

left join  hoca_dersleri hd on d.ders_id=hd.ders_id
left join  hoca h on hd.hoca_id=h.hoca_id
GO
/****** Object:  View [dbo].[VW_Kitap]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[VW_Kitap]

AS

Select 

	k.kitap_id,
	d.ders_ad,
	d.ders_seviye,
	k.kitap_ad,
	k.kitap_yayin,
	k.kitap_ucret
	
	

from kitaplar k inner join dersler d on k.ders_id=d.ders_id


GO
/****** Object:  View [dbo].[VW_Kullanicilar]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[VW_Kullanicilar]

AS

Select 

	kullanici_id as Kullanıcı_No,
	kullanici_ad as Kullanıcı_İsim,
	ogretmen_islemleri as Öğretmen_İşlemleri ,
	veli_ogrenci_islemleri as Veli_Öğrenci_İşlemleri,
	ders_islemleri as Ders_İşlemleri,
	sinav_islemleri as Sınav_İşlemleri,
	kullanici_islemleri as Kullanıcı_İşlemleri,
	devamsizlik_islemleri as Devamsızlık_İşlemleri,
	arsiv_islemleri as arsiv_İşlemleri
	
	

from kullanicilar 


GO
/****** Object:  View [dbo].[VW_Ogrenci]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Ogrenci] AS

Select 

	o.ogr_id as Öğrenci_Numarası,
	o.ogr_ad as Öğrenci_İsmi,
	o.ogr_soyad as Öğrenci_Soyadı ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sınıf,
	a.alan_ad as Alanı,
	o.ogr_tc as Öğrenci_TC,
	od.ogr_tel as Öğrenci_Telefon,
	od.ogr_adres as Öğrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayıt_Tarihi,
	od.ogr_dogum_tar as Doğum_Tarihi,
	od.ogr_ucret as Alınan_Ücret,
	v.veli_ad as Veli_İsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


from 

ogrenci o 

left join ogrenci_detay od on o.ogr_id = od.ogr_id
left join veli v on v.veli_id=o.veli_id 
left join sube s on s.sube_id=o.sube_id
left join alan a on a.alan_id=s.alan_id
GO
/****** Object:  View [dbo].[VW_Ogretmen]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[VW_Ogretmen] AS
	
Select
	hoca_id as Sıra,
	hoca_ad as İsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaş,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayıt_Tarihi

From Hoca


GO
/****** Object:  View [dbo].[VW_Silinen_Ogrenci]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VW_Silinen_Ogrenci]
AS
Select 

	o.ogr_id as Öğrenci_Numarası,
	o.ogr_ad as Öğrenci_İsmi,
	o.ogr_soyad as Öğrenci_Soyadı ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sınıf,
	a.alan_ad as Alanı,
	o.ogr_tc as Öğrenci_TC,
	od.ogr_tel as Öğrenci_Telefon,
	od.ogr_adres as Öğrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayıt_Tarihi,
	od.ogr_dogum_tar as Doğum_Tarihi,
	od.ogr_ucret as Alınan_Ücret,
	v.veli_ad as Veli_İsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


	from 

	silinen_ogrenci o 

	left join silinen_ogrenci_detay od on o.ogr_id = od.ogr_id
	left join silinen_veli v on v.veli_id=o.veli_id 
	left join sube s on s.sube_id=o.sube_id
	left join alan a on a.alan_id=s.alan_id

GO
/****** Object:  View [dbo].[VW_Silinen_Ogretmen]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[VW_Silinen_Ogretmen]

	
AS

Select
	hoca_id as Sıra,
	hoca_ad as İsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaş,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayıt_Tarihi,
	hoca_silinme_tarih as 'Silinme Tarihi'

From Silinen_Hoca


GO
/****** Object:  View [dbo].[VW_Siniflar]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_Siniflar]
AS

Select 
s.sube_id as 'Şube Sırası',
s.sube_seviye as 'Seviye',
s.sube_harf as 'Şube',
a.alan_ad as 'Alanı'
from sube s
inner join alan a on s.alan_id = a.alan_id


GO
/****** Object:  Index [IN_Devamsizlik_Ogrenci_Numara]    Script Date: 21.12.2017 10:18:09 ******/
CREATE NONCLUSTERED INDEX [IN_Devamsizlik_Ogrenci_Numara] ON [dbo].[devamsizlik]
(
	[ogr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IN_Devamsizlik_Tarih]    Script Date: 21.12.2017 10:18:09 ******/
CREATE NONCLUSTERED INDEX [IN_Devamsizlik_Tarih] ON [dbo].[devamsizlik]
(
	[tarih] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IN_Ogrenci_Tc]    Script Date: 21.12.2017 10:18:09 ******/
CREATE NONCLUSTERED INDEX [IN_Ogrenci_Tc] ON [dbo].[ogrenci]
(
	[ogr_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IN_Ogrenci_Tc]    Script Date: 21.12.2017 10:18:09 ******/
CREATE NONCLUSTERED INDEX [IN_Ogrenci_Tc] ON [dbo].[veli]
(
	[veli_tc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alan_dersleri]  WITH CHECK ADD FOREIGN KEY([alan_id])
REFERENCES [dbo].[alan] ([alan_id])
GO
ALTER TABLE [dbo].[alan_dersleri]  WITH CHECK ADD FOREIGN KEY([ders_id])
REFERENCES [dbo].[dersler] ([ders_id])
GO
ALTER TABLE [dbo].[devamsizlik]  WITH CHECK ADD FOREIGN KEY([ogr_id])
REFERENCES [dbo].[ogrenci] ([ogr_id])
GO
ALTER TABLE [dbo].[hoca_dersleri]  WITH CHECK ADD FOREIGN KEY([ders_id])
REFERENCES [dbo].[dersler] ([ders_id])
GO
ALTER TABLE [dbo].[hoca_dersleri]  WITH CHECK ADD FOREIGN KEY([hoca_id])
REFERENCES [dbo].[hoca] ([hoca_id])
GO
ALTER TABLE [dbo].[islemler]  WITH CHECK ADD FOREIGN KEY([kullanici_ad])
REFERENCES [dbo].[kullanicilar] ([kullanici_ad])
GO
ALTER TABLE [dbo].[kitaplar]  WITH CHECK ADD FOREIGN KEY([ders_id])
REFERENCES [dbo].[dersler] ([ders_id])
GO
ALTER TABLE [dbo].[ogrenci]  WITH CHECK ADD FOREIGN KEY([sube_id])
REFERENCES [dbo].[sube] ([sube_id])
GO
ALTER TABLE [dbo].[ogrenci]  WITH CHECK ADD FOREIGN KEY([veli_id])
REFERENCES [dbo].[veli] ([veli_id])
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD FOREIGN KEY([deneme_id])
REFERENCES [dbo].[deneme] ([deneme_id])
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD FOREIGN KEY([ogr_id])
REFERENCES [dbo].[ogrenci] ([ogr_id])
GO
ALTER TABLE [dbo].[ogrenci_detay]  WITH CHECK ADD FOREIGN KEY([ogr_id])
REFERENCES [dbo].[ogrenci] ([ogr_id])
GO
ALTER TABLE [dbo].[sube]  WITH CHECK ADD FOREIGN KEY([alan_id])
REFERENCES [dbo].[alan] ([alan_id])
GO
ALTER TABLE [dbo].[alan]  WITH CHECK ADD  CONSTRAINT [ck_alan_ad] CHECK  (([alan_ad]='-' OR [alan_ad]='dil' OR [alan_ad]='ts' OR [alan_ad]='tm' OR [alan_ad]='mf'))
GO
ALTER TABLE [dbo].[alan] CHECK CONSTRAINT [ck_alan_ad]
GO
ALTER TABLE [dbo].[deneme]  WITH CHECK ADD  CONSTRAINT [ck_deneme_seviye] CHECK  (([deneme_seviye]='12' OR [deneme_seviye]='11' OR [deneme_seviye]='10' OR [deneme_seviye]='9'))
GO
ALTER TABLE [dbo].[deneme] CHECK CONSTRAINT [ck_deneme_seviye]
GO
ALTER TABLE [dbo].[dersler]  WITH CHECK ADD  CONSTRAINT [ck_ders_seviye] CHECK  (([ders_seviye]='12' OR [ders_seviye]='11' OR [ders_seviye]='10' OR [ders_seviye]='9'))
GO
ALTER TABLE [dbo].[dersler] CHECK CONSTRAINT [ck_ders_seviye]
GO
ALTER TABLE [dbo].[hoca]  WITH CHECK ADD  CONSTRAINT [ck_hoca_tc] CHECK  (([hoca_tc] like replicate('[0-9]',(11))))
GO
ALTER TABLE [dbo].[hoca] CHECK CONSTRAINT [ck_hoca_tc]
GO
ALTER TABLE [dbo].[hoca]  WITH CHECK ADD  CONSTRAINT [ck_hoca_tel] CHECK  (([hoca_tel] like replicate('[0-9]',(10))))
GO
ALTER TABLE [dbo].[hoca] CHECK CONSTRAINT [ck_hoca_tel]
GO
ALTER TABLE [dbo].[islemler]  WITH CHECK ADD  CONSTRAINT [ck_islem_tip] CHECK  (([islem_tip] like 'db export' OR [islem_tip] like 'db import' OR [islem_tip] like 'table export' OR [islem_tip] like 'table import'))
GO
ALTER TABLE [dbo].[islemler] CHECK CONSTRAINT [ck_islem_tip]
GO
ALTER TABLE [dbo].[ogrenci]  WITH CHECK ADD  CONSTRAINT [ck_ogr_tc] CHECK  (([ogr_tc] like replicate('[0-9]',(11))))
GO
ALTER TABLE [dbo].[ogrenci] CHECK CONSTRAINT [ck_ogr_tc]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_fen_net] CHECK  (([fen_net]>=(-10) AND [fen_net]<=(40)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_fen_net]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_matematik_net] CHECK  (([matematik_net]>=(-10) AND [matematik_net]<=(40)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_matematik_net]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_1] CHECK  (([puan_ygs_1]>=(0) AND [puan_ygs_1]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_1]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_2] CHECK  (([puan_ygs_2]>=(0) AND [puan_ygs_2]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_2]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_3] CHECK  (([puan_ygs_3]>=(0) AND [puan_ygs_3]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_3]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_4] CHECK  (([puan_ygs_4]>=(0) AND [puan_ygs_4]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_4]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_5] CHECK  (([puan_ygs_5]>=(0) AND [puan_ygs_5]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_5]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_puan_ygs_6] CHECK  (([puan_ygs_6]>=(0) AND [puan_ygs_6]<=(500)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_puan_ygs_6]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_sosyal_net] CHECK  (([sosyal_net]>=(-10) AND [sosyal_net]<=(40)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_sosyal_net]
GO
ALTER TABLE [dbo].[ogrenci_deneme]  WITH CHECK ADD  CONSTRAINT [ck_turkce_net] CHECK  (([turkce_net]>=(-10) AND [turkce_net]<=(40)))
GO
ALTER TABLE [dbo].[ogrenci_deneme] CHECK CONSTRAINT [ck_turkce_net]
GO
ALTER TABLE [dbo].[ogrenci_detay]  WITH CHECK ADD  CONSTRAINT [ck_ogr_tel] CHECK  (([ogr_tel] like replicate('[0-9]',(10))))
GO
ALTER TABLE [dbo].[ogrenci_detay] CHECK CONSTRAINT [ck_ogr_tel]
GO
ALTER TABLE [dbo].[sube]  WITH CHECK ADD  CONSTRAINT [ck_sube_harf] CHECK  (([sube_harf] like '[A-Z]'))
GO
ALTER TABLE [dbo].[sube] CHECK CONSTRAINT [ck_sube_harf]
GO
ALTER TABLE [dbo].[sube]  WITH CHECK ADD  CONSTRAINT [ck_sube_seviye] CHECK  (([sube_seviye]='12' OR [sube_seviye]='11' OR [sube_seviye]='10' OR [sube_seviye]='9'))
GO
ALTER TABLE [dbo].[sube] CHECK CONSTRAINT [ck_sube_seviye]
GO
ALTER TABLE [dbo].[veli]  WITH CHECK ADD  CONSTRAINT [ck_veli_tc] CHECK  (([veli_tc] like replicate('[0-9]',(11))))
GO
ALTER TABLE [dbo].[veli] CHECK CONSTRAINT [ck_veli_tc]
GO
ALTER TABLE [dbo].[veli]  WITH CHECK ADD  CONSTRAINT [ck_veli_tel] CHECK  (([veli_tel] like replicate('[0-9]',(10))))
GO
ALTER TABLE [dbo].[veli] CHECK CONSTRAINT [ck_veli_tel]
GO
/****** Object:  StoredProcedure [dbo].[SP_Alan_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--seviye bilgisinden sonra gelen şube harfin sonrasında alan adını çekmek için.
Create proc [dbo].[SP_Alan_Ara]
@seviye nvarchar(2),
@harf nvarchar(1)
AS
Select alan_ad from alan where alan_id=(select alan_id from sube where (sube_seviye=@seviye and sube_harf=@harf))

GO
/****** Object:  StoredProcedure [dbo].[SP_Alan_Ders_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_Alan_Ders_Sil] 
	
		@alan_dersleri_id int
AS
	
		declare @varmi int
		
		select @varmi=alan_dersleri_id from alan_dersleri where (alan_dersleri_id=@alan_dersleri_id)
	
		if(@varmi is null)
		BEGIN
			Select 'Ders Bulunamadı...'
			RETURN -1
		END


		--alan dersi sil.
		delete from alan_dersleri where (alan_dersleri_id=@alan_dersleri_id)



GO
/****** Object:  StoredProcedure [dbo].[SP_Alan_Dersleri_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Alan_Dersleri_Ara]
	@ders_id int
AS

Select
	ad.alan_dersleri_id as Alan_Ders_Sıra,
	a.alan_ad as Alanı,
	d.ders_seviye as Seviyesi,
	d.ders_ad as Ders_Adı,
	h.hoca_ad as Hoca_İsmi,
	h.hoca_soyad as Hoca_Soyad

from dersler d
inner join alan_dersleri ad on d.ders_id = ad.ders_id
inner join alan a on ad.alan_id = a.alan_id
inner join hoca_dersleri hd on d.ders_id=hd.ders_id
inner join hoca h on h.hoca_id=hd.hoca_id


where (d.ders_id=@ders_id)


GO
/****** Object:  StoredProcedure [dbo].[SP_Alan_Dersleri_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Alan_Dersleri_Ekle] 

	@ders_id int,

	@alan_ad nvarchar(3) -- alan id sini bulmak için

AS
	---- bahsettiği Ders var mı kontrol edelim
	Declare @dersvarmi int
	SELECT @dersvarmi=ders_id FROM dersler WHERE (ders_id=@ders_id )

	
	
	IF (@dersvarmi is null)
	BEGIN
		SELECT 'Girilen ders bulunmamakta...'
		RETURN -1
	END
		
	---- bahsettiği ALAN var mı kontrol edelim
	Declare @alan_id int
	SELECT @alan_id=alan_id FROM alan WHERE (alan_ad=@alan_ad)

	IF (@alan_id is null)
	BEGIN
		SELECT 'Girilen alan bulunmamakta...'
		RETURN -1
	END

	----girilen ders 9.sınıf dersi ise alanı direkt olarak '-' girdirt.
	
	Declare @seviye nvarchar(2)
	Select @seviye=ders_seviye from dersler where (ders_id=@ders_id)
	if(@seviye='9')
		Set @alan_id = 1
	
	---- ders ve alan varsa , bu iki kaydı Alan_Dersleri'ne eklemeye çalışalım, ama ya daha önceden eklendiyse ? bunu sorgulayalıp yoksa akabinin de ekleyelim, varsa hata verdirelim

	Declare @alan_dersleri_id int
	Select @alan_dersleri_id=alan_dersleri_id FROM alan_dersleri WHERE ( alan_id=@alan_id AND ders_id=@ders_id)

	IF (@alan_dersleri_id is null)
	BEGIN
		INSERT INTO alan_dersleri (alan_id,ders_id) VALUES (@alan_id,@ders_id)
	END
	ELSE
	BEGIN
		Select 'Bu ders zaten bu alana eklenmiş...'
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_Bugun_Gelmeyenler]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Bugun_Gelmeyenler]
AS
declare @tarih date
set @tarih= getdate()

Select
	
	v.veli_tel,
	o.ogr_id,
	o.ogr_ad,
	o.ogr_soyad
	
	
From devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id inner join veli v on o.veli_id=v.veli_id
where d.tarih = @tarih


GO
/****** Object:  StoredProcedure [dbo].[SP_Deneme_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	---------------------------------------------------------- DENEME PROCEDURE ----------------------------------------------

	CREATE PROC [dbo].[SP_Deneme_Ekle] 

	@deneme_seviye nvarchar(2),	
	@deneme_tarih date
AS
	
	--Seviye(hiç şube) var mı
	Declare @ogrsayisi int
	Select @ogrsayisi=count(ogr_id) from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))
	if(@ogrsayisi=0)
	BEGIN
		Select 'Belirtilen seviyede öğrenci bulunamamakta.'
		Return -1
	END

	---- daha önce böyle bir sınav yapıldı mı sor
	Declare @deneme_id int
	Select @deneme_id=deneme_id from deneme where(deneme_seviye=@deneme_seviye and deneme_tarih=@deneme_tarih)
	IF(@deneme_id is not null)
	BEGIN
		Select 'Böyle bir sınav zaten eklendi...'
		RETURN -1
	END
	
	

	----tüm ogrenci verisini çekip sınav id ile birleştirip sınav eklendiği anda tüm ogrencilerin record'ları puan tablosuna eklenebilirdi ama bilgim yetmedi 
	----oyuzden sadece deneme sınavını açtığımızla kalacaz aşağıdaki gibi. bu durumunda sınavı ekledikten sonra her öğrenci için puan ını tektek girecez

	INSERT INTO deneme(deneme_seviye,deneme_tarih) values(@deneme_seviye,@deneme_tarih) -- Denemeyi ekledik.
	
	SELECT @deneme_id = SCOPE_IDENTITY() -- eklenen denemenin ID 'si alındı -> öğrenci_deneme ' eklemeleri için.
	
	
	
	
	---- ÖĞRENCİ_DENEMELER 'i ekleniyor...
	

		declare @ogr_id int
 
			declare cursor1 cursor for SELECT ogr_id from ogrenci where (sube_id in (select sube_id from sube where (sube_seviye=@deneme_seviye)))

				OPEN cursor1

					FETCH NEXT FROM cursor1 INTO @ogr_id

						WHILE @@FETCH_STATUS = 0
							BEGIN
			 
							    -- PUANLAMA İŞLEMLERİ ÖNCESİ İŞLEMLER...
								
									---- Zaten öğrencinin puanı eklenmiş mi?
										Declare @ogrenci_deneme_id int
										Select @ogrenci_deneme_id=ogrenci_deneme_id from ogrenci_deneme where(deneme_id=@deneme_id and ogr_id=@ogr_id)
										IF(@ogrenci_deneme_id is not null)
											BEGIN
												Select 'Bu öğrencinin bu sınav da zaten puan kaydı var...'
												CONTINUE; -- Sıradaki öğrenciye geçilir.
											END
										ELSE
											BEGIN
												---- öğrenci puanını ekle
												-- Öğrenci netleri rastgele oluşturulup belli bir katsayıyla çarpılıp hesaplanacaktır.
												-- Burada her deneme için net girişi Ön yüzden uzun zaman alacağından böyle bir yola gidildi.
												--mat : 40 - 5 puan ---- 200
												--Türkçe 40 - 4.5  ---- 180
												--Sosyal 40 - 1.50 ---- 60
												--Fen 40 - 1.5 ---- 60
												DECLARE 
												@ygs_puan_1 FLOAT,
												@ygs_puan_2 FLOAT,
												@ygs_puan_3 FLOAT,
												@ygs_puan_4 FLOAT,
												@ygs_puan_5 FLOAT,
												@ygs_puan_6 FLOAT

												DECLARE @Upper INT;
												DECLARE @Lower INT;

												DECLARE @turkce_net FLOAT,
														@sosyal_net FLOAT,
														@matematik_net FLOAT,
														@fen_net FLOAT

												SET @Lower = 0     -- En düşük random net
												SET @Upper = 40    -- En yüksek random Net

												SELECT @turkce_net =  (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @sosyal_net =(SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @matematik_net = (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))
												SELECT @fen_net = (SELECT @Lower + CONVERT(FLOAT, (@Upper-@Lower)*RAND()))

							--					SELECT @turkce_net,@sosyal_net,@matematik_net,@fen_net

												SELECT @ygs_puan_1 = 140 + @matematik_net*4 + @turkce_net*1.5 + @sosyal_net*1.5 + @fen_net*2
												SELECT @ygs_puan_2 = 140 + @matematik_net*4 + @turkce_net*1.5 + @sosyal_net*1 + @fen_net*2.5
												SELECT @ygs_puan_3 = 140 + @matematik_net*4 + @turkce_net*2.5 + @sosyal_net*1.5 + @fen_net*1
												SELECT @ygs_puan_4 = 140 + @matematik_net*3.5 + @turkce_net*3 + @sosyal_net*1.5 + @fen_net*1
												SELECT @ygs_puan_5 = 140 + @matematik_net*2 + @turkce_net*4 + @sosyal_net*2 + @fen_net*1
												SELECT @ygs_puan_6 = 140 + @matematik_net*1 + @turkce_net*4 + @sosyal_net*3 + @fen_net*1

							--					SELECT @ygs_puan_1 AS YGS1 ,@ygs_puan_2 AS YGS2 ,@ygs_puan_3 AS YGS3,@ygs_puan_4 AS YGS4,@ygs_puan_5 AS YGS5,@ygs_puan_6 AS YGS6

												-- puanlar eklenir.
								
												INSERT INTO ogrenci_deneme (deneme_id,ogr_id,turkce_net,sosyal_net,matematik_net,fen_net,puan_ygs_1,puan_ygs_2,puan_ygs_3,puan_ygs_4,puan_ygs_5,puan_ygs_6)
												values(@deneme_id,@ogr_id,round(@turkce_net,4),round(@sosyal_net,4),round(@matematik_net,4),round(@fen_net,4),round(@ygs_puan_1,4),round(@ygs_puan_2,4),round(@ygs_puan_3,4),round(@ygs_puan_4,4),round(@ygs_puan_5,4),round(@ygs_puan_6,4)) 
																
											END
										
							
								FETCH NEXT FROM cursor1 INTO @ogr_id
							END
				CLOSE cursor1

			DEALLOCATE cursor1
			

GO
/****** Object:  StoredProcedure [dbo].[SP_Ders_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_Ders_Ara]
@kelime nvarchar(30)
AS

Select 
	
	d.ders_id,
	d.ders_ad,
	d.ders_seviye,
	h.hoca_ad as Veren_Hoca_Ad,
	h.hoca_soyad as Veren_Hoca_Soyad,
	h.hoca_tc as Veren_Hoca_TC
	
	
from 

dersler d

left join  hoca_dersleri hd on d.ders_id=hd.ders_id
left join  hoca h on hd.hoca_id=h.hoca_id
where (
	
	d.ders_ad like '%'+@kelime+'%' or 
	d.ders_seviye like '%'+@kelime+'%' or 
	h.hoca_ad like '%'+@kelime+'%' or 
	h.hoca_soyad like '%'+@kelime+'%' or 
	h.hoca_tc like '%'+@kelime+'%' 
	
	)
GO
/****** Object:  StoredProcedure [dbo].[SP_Ders_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PRoc [dbo].[SP_Ders_Guncelle]
	@ders_id int,
	
	@yeni_ders_ad nvarchar(30),
	@yeni_ders_seviye nvarchar(2)

AS

set @yeni_ders_ad = upper(SUBSTRING(@yeni_ders_ad,1,1))+LOWER(SUBSTRING(@yeni_ders_ad,2,len(@yeni_ders_ad)-1))

	--ders var mı kontrol
		declare @varmi int
		Select @varmi=ders_id from dersler where (ders_id=@ders_id)
		if(@varmi is null)
		BEGIN
			Select 'Belirtilen Ders Bulunmamakta...'
			return -1
		END
		
	-- prametreler boş  ise  default olarak eskileri al

		if(@yeni_ders_ad is null)
			BEGIN
				Select @yeni_ders_ad=ders_ad from dersler where (ders_id=@ders_id)
			END
		if(@yeni_ders_seviye is null)
			BEGIN
				Select @yeni_ders_seviye=ders_seviye from dersler where (ders_id=@ders_id)
			END
			
	-- değiştirilmeye çalışılan ders zaten var mı, değişen ad seviyeyle yine kendisiyse devam et
	
		declare @varmi2 int
		Select @varmi2=ders_id from dersler where(ders_ad=@yeni_ders_ad and ders_seviye=@yeni_ders_seviye)
		if(@varmi2 = @ders_id)
			BEGIN
				--zaten yine kendisiyse bitir.
				Select 'Yeni Verilen Değerler Zaten Dersin Kendisine Ait...'
				return -1
			END
		ELSE IF (@varmi2 is null)
			BEGIN
				--verilen ders adı ve seviye boştaysa , dersi güncelle.
				update dersler set ders_ad=@yeni_ders_ad,ders_seviye=@yeni_ders_seviye where (ders_id=@ders_id)
			END
		ELSE
			BEGIN -- hem kendisi değil , hem boşta da değilse , ozaman zaten böyle bir ders vardır.
				Select 'Değiştirilmeye Çalışılan Ders Zaten Bulunmakta.'
			END
		
	
		
GO
/****** Object:  StoredProcedure [dbo].[SP_Ders_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Ders_Sil] @ders_id int

AS
	
	-- alan dersleri sileriz

	delete from alan_dersleri where (ders_id=@ders_id)

	-- kitapları sil

	delete from kitaplar where (ders_id=@ders_id)

	-- hoca dersleri sil

	delete from hoca_dersleri where (ders_id=@ders_id)


	-- en son :ders sil

	delete from dersler where ders_id=@ders_id

GO
/****** Object:  StoredProcedure [dbo].[SP_Dersler_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Dersler_Ekle] 
@ad nvarchar(20),
@seviye nvarchar(2)

AS
	
set @ad = upper(SUBSTRING(@ad,1,1))+LOWER(SUBSTRING(@ad,2,len(@ad)-1))
	Declare @id int
	
	Select @id=ders_id FROM dersler WHERE (ders_ad=@ad AND ders_seviye=@seviye)

	IF(@id is null) -- BÖyle bir der daha önce girildi mi
	BEGIN--girilmediyse
		INSERT INTO dersler (ders_ad,ders_seviye) VALUES (@ad,@seviye)
	END
	ELSE
	BEGIN -- girildiyse
		SELECT 'Bu Ders Zaten Var...'
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Devamsizlik_Ekle] 

	@ogr_id int, -- ÖĞRENCİNİN OKUL NUMARASI...
	@tarih date

AS
	----ogrenci var mı sorgula
	declare @ogr int
	Select @ogr=ogr_id from ogrenci where(ogr_id=@ogr_id)
	IF(@ogr is null)
	BEGIN
		Select 'Öğrenci Bulunamadı'
		RETURN -1
	END

	----aynı öğrenci aynı tarih de gelmediği kayıtı daha önce girilmiş mi sorgula
	declare @varmi int
	Select @varmi=ogr_id from devamsizlik where(ogr_id=@ogr and tarih=@tarih)
	IF(@varmi is not null)
	BEGIN
		Select 'Bu öğrencinin Bu tarihte gelmediği zaten girilmiş.'
		RETURN -1
	END

	----gelmediği günü ekle
	INSERT INTO devamsizlik (ogr_id,tarih) values(@ogr,@tarih)

GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Nolu_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Devamsizlik_Nolu_Ara]
@ogr_id int
AS

	select 
		o.ogr_id as Öğrenci_Numara,
		o.ogr_ad as Öğrenci_İsim,
		o.ogr_soyad as Öğrenci_Soyad,
		d.tarih as Devamsızlık_Tarihi
	
	from devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id
	where d.ogr_id = @ogr_id
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Nolu_Tarihli_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Devamsizlik_Nolu_Tarihli_Ara]
@ogr_id int,
@tarih date
AS

	select 
		o.ogr_id as Öğrenci_Numara,
		o.ogr_ad as Öğrenci_İsim,
		o.ogr_soyad as Öğrenci_Soyad,
		d.tarih as Devamsızlık_Tarihi
	
	from devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id
	where d.ogr_id = @ogr_id and d.tarih=@tarih
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Orani_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Devamsizlik_Orani_Ara]
@tarih date

as
	Declare @toplam_ogrenci_sayi int,@toplam_gelmeyen_ogrenci_sayi int
	select @toplam_ogrenci_sayi = count(*) from ogrenci
	Select @toplam_gelmeyen_ogrenci_sayi = count(*) from devamsizlik where tarih=@tarih


	Select @toplam_ogrenci_sayi,@toplam_gelmeyen_ogrenci_sayi


GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Devamsizlik_Sil]
@ogr_id int,
@tarih date

AS

	delete from devamsizlik where (ogr_id=@ogr_id and tarih=@tarih)
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Devamsizlik_Tarihli_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_Devamsizlik_Tarihli_Ara]

@tarih date
AS

	select 
		o.ogr_id as Öğrenci_Numara,
		o.ogr_ad as Öğrenci_İsim,
		o.ogr_soyad as Öğrenci_Soyad,
		d.tarih as Devamsızlık_Tarihi
	
	from devamsizlik d inner join ogrenci o on d.ogr_id=o.ogr_id
	where d.tarih=@tarih
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Hoca_Ders_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_Hoca_Ders_Sil] 
	
		@hoca_tc char(11),
		@ders_id int
AS
	
		declare @hoca_id int,@dersvarmi int

		Select @hoca_id=hoca_id from hoca where (hoca_tc=@hoca_tc)
		
		--hoca var mı
		if(@hoca_id is null)
		BEGIN
			SELECT 'Hoca bulunamadı...'
			RETURN -1
		END
		
		--ders var mı
		select @dersvarmi=ders_id from dersler where (ders_id=@ders_id )
	
		if(@dersvarmi is null)
		BEGIN
			Select 'Ders Bulunamadı...'
			RETURN -1
		END


		--hoca_dersleri sil.
		delete from hoca_dersleri where (ders_id=@ders_id and hoca_id=@hoca_id)

	
GO
/****** Object:  StoredProcedure [dbo].[SP_Hoca_Dersleri_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Hoca_Dersleri_Ekle] 
@hoca_tc char(11),-- hoca id için

@ders_id int -- ders id 

AS
	---- Hoca var mı soruduralım
	Declare @hoca_id int
	Select @hoca_id=hoca_id FROM hoca WHERE (hoca_tc=@hoca_tc)

	if(@hoca_id is null)
	BEGIN
		Select 'Böyle bir hoca bulunamadı...'
		RETURN -1
	END

	---- Ders var mı sorduralım
	Declare @varmi int
	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id)

	IF(@varmi is null)
	BEGIN
		Select 'Böyle bir ders bulunamadı...'
		RETURN -1
	END

	---- ders ve hoca var ama, bu tabloya daha önceden HOCA VE DERS 'ini ekledik mi diye sorgu koyacaktık ama , hatırla HOCA_DERSLERİ tablosunu oluştururken
	---- ders_id ve hoca_id'ye birbirlerine bağlı unique özellik ekledik,  koymak istediğimiz ders ile hocanın kaydı varsa zaten bunu bize yaptırmayacak.
	---- AMAA... ben yine de bu sorguyu yapmak istiyorum çünkü sonucunda türkçe bir hata bildirisi dönsün.

	Declare @hoca_dersleri_id int

	Select @hoca_dersleri_id=hoca_dersleri_id FROM hoca_dersleri WHERE (ders_id=@ders_id AND hoca_id=@hoca_id)

	IF (@hoca_dersleri_id is null)
	BEGIN
		INSERT INTO hoca_dersleri (ders_id,hoca_id) VALUES(@ders_id,@hoca_id)
	END
	ELSE
	BEGIN
		SELECT 'Zaten Bu Ders Alınmıştır...'
	END

GO
/****** Object:  StoredProcedure [dbo].[SP_Hoca_ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_Hoca_ekle]

 @ad nvarchar(20),
 @soyad nvarchar(20),
 @tel nvarchar(10),
 @ucret int,
 @tc char(11),
 @kayit_tarih date

AS

--boyut düzenleme.
set @ad = upper(SUBSTRING(@ad,1,1))+LOWER(SUBSTRING(@ad,2,len(@ad)-1))
set @soyad = upper(SUBSTRING(@soyad,1,1))+LOWER(SUBSTRING(@soyad,2,len(@soyad)-1))

	-- Hoca var mı yok mu kontrol et
	Declare @id int

	Select @id=hoca_id FROM hoca WHERE (hoca_ad=@ad AND hoca_soyad=@soyad AND (hoca_tel=@tel or hoca_tc=@tc) ) --eklenilmeye çalışılan hoca varsa onun id sini değişkene alırız
	
	IF (@id is null) -- hoca var mı kontrol ediliyor...
	
		BEGIN
				if(@kayit_tarih is null)
				BEGIN
					set @kayit_tarih = GETDATE()
				END
			INSERT INTO hoca (hoca_ad,hoca_soyad,hoca_tel,hoca_ucret,hoca_tc,hoca_kayit_tarih) VALUES(@ad,@soyad,@tel,@ucret,@tc,@kayit_tarih)
		END
	

	ELSE -- eğer öyle bir hoca varsa , hata çıkartılır.
	
		BEGIN
			Select 'Zaten Öyle Bir Hoca Mevcut...'
		END


GO
/****** Object:  StoredProcedure [dbo].[SP_Hoca_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_Hoca_Guncelle] 
	@hoca_id int,
	
	@yeni_hoca_ad nvarchar(30),
	@yeni_hoca_soyad nvarchar(30),
	@yeni_hoca_tel char(10),
	@yeni_hoca_ucret int,
	@yeni_hoca_tc char(11),
	@yeni_hoca_kayit_tarih date

AS

set @yeni_hoca_ad = upper(SUBSTRING(@yeni_hoca_ad,1,1))+LOWER(SUBSTRING(@yeni_hoca_ad,2,len(@yeni_hoca_ad)-1))
set @yeni_hoca_soyad = upper(SUBSTRING(@yeni_hoca_soyad,1,1))+LOWER(SUBSTRING(@yeni_hoca_soyad,2,len(@yeni_hoca_soyad)-1))
	

	--hoca var mı kontrol et
	declare @varmi int
	Select @varmi=hoca_id from hoca where( hoca_id=@hoca_id )
	if(@varmi is null)
	BEGIN
		Select 'Belirtilen hoca bulunamadı...'
		return -1
	END

	--değerler boşsa eski değerleri default olarak koy
	if(@yeni_hoca_ad is null)
	BEGIN
		Select @yeni_hoca_ad=hoca_ad from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_soyad is null)
	BEGIN
		Select @yeni_hoca_soyad=hoca_soyad from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_tel is null)
	BEGIN
		Select @yeni_hoca_tel=hoca_tel from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_ucret is null)
	BEGIN
		Select @yeni_hoca_ucret=hoca_ucret from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_tc is null)
	BEGIN
		Select @yeni_hoca_tc=hoca_tc from hoca where (hoca_id=@hoca_id)
	END
	if(@yeni_hoca_kayit_tarih is null)
	BEGIN
		Select @yeni_hoca_kayit_tarih=hoca_kayit_tarih from hoca where (hoca_id=@hoca_id)
	END

	--yeni verilerden ortaya çıkan hoca zaten varsa öyle hoca var de
	declare @varmi2 int
	Select @varmi2=hoca_id from hoca where (hoca_ad=@yeni_hoca_ad and hoca_soyad=@yeni_hoca_soyad and hoca_tel=@yeni_hoca_tel and hoca_ucret=@yeni_hoca_ucret and hoca_tc=@yeni_hoca_tc and hoca_kayit_tarih = @yeni_hoca_kayit_tarih)
	if (@varmi2 is not null)
	BEGIN
		Select 'yeni girilen verilere sahip hoca zaten bulunmakta...'
		return -1
	END

	--hocayı update et
	update hoca set 
	
	hoca_ad=@yeni_hoca_ad,
	hoca_soyad=@yeni_hoca_soyad,
	hoca_tel=@yeni_hoca_tel,
	hoca_ucret=@yeni_hoca_ucret,
	hoca_tc=@yeni_hoca_tc,
	hoca_kayit_tarih=@yeni_hoca_kayit_tarih
	where (hoca_id=@hoca_id)
	
	
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Hoca_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Hoca_Sil] 
	
	@hoca_id nvarchar(30)

AS

	Declare @varmi int

	Select @varmi = hoca_id from hoca where (hoca_id=@hoca_id)

	if (@varmi is null)
	BEGIN
		Select 'böyle bir hoca bulunamadı...'
		RETURN -1
	END

	--hocanın sahip olduğu bütün hoca_dersleri silinir
	delete from hoca_dersleri where (hoca_id=@hoca_id)

	--hoca silinir

	delete from hoca where hoca_id=@hoca_id
GO
/****** Object:  StoredProcedure [dbo].[SP_Kitap_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[SP_Kitap_Ara]

@ders_id int

AS

Select 

	k.kitap_id as Kitap_No,
	d.ders_ad as Ders_İsmi,
	d.ders_seviye as Ders_Seviye,
	k.kitap_ad as Kitap_İsim,
	k.kitap_yayin as Kitap_Yayın,
	k.kitap_ucret as Kitap_Ücret
	
	

from kitaplar k inner join dersler d on k.ders_id=d.ders_id

where 
(	d.ders_id =@ders_id )


GO
/****** Object:  StoredProcedure [dbo].[SP_Kitap_Ara_Kelimeli]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[SP_Kitap_Ara_Kelimeli]

@kelime nvarchar(30),
@ders_id int

AS

Select 

	k.kitap_id as Kitap_No,
	d.ders_ad as Ders_İsmi,
	d.ders_seviye as Ders_Seviye,
	k.kitap_ad as Kitap_İsim,
	k.kitap_yayin as Kitap_Yayın,
	k.kitap_ucret as Kitap_Ücret
	
	

from kitaplar k inner join dersler d on k.ders_id=d.ders_id

where 
(	d.ders_id =@ders_id and( 
	k.kitap_ad like '%'+@kelime+'%' or 
	k.kitap_yayin like '%'+@kelime+'%' or 
	k.kitap_ucret like '%'+@kelime+'%' )

)


GO
/****** Object:  StoredProcedure [dbo].[SP_Kitap_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Kitap_Sil] 

@kitap_id int

as

	declare @varmi int

	Select @varmi=kitap_id from kitaplar where (kitap_id= @kitap_id)

	if(@varmi is null)
	BEGIN
		Select 'Böyle bir kitap bulunmamakta'
		RETURN -1
	END

	delete from kitaplar where kitap_id=@kitap_id
GO
/****** Object:  StoredProcedure [dbo].[SP_Kitaplar_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Kitaplar_Ekle] 

@ders_id int,

@kitap_ad nvarchar(30),
@kitap_yayin nvarchar(20),
@kitap_ucret int

AS

set @kitap_ad = upper(SUBSTRING(@kitap_ad,1,1))+LOWER(SUBSTRING(@kitap_ad,2,len(@kitap_ad)-1))

	--------#### Kitapın eklenmek istendiği ders gerçekten var mı ona bakarız, hatırla kitap bir derse bağlı olmak zorunda
	Declare @varmi int

	Select @varmi=ders_id FROM dersler WHERE(ders_id=@ders_id) -- eğer öyle ders varsa değişkenimize alırız

	IF(@varmi is null) -- değişken boşsa böyle bir ders yok demektir, ozaman kitap da ekleyemeyiz, o yüzden return ile bitiririz.
	BEGIN
		Select 'Boyle bir ders bulunamadı...' as HATA
		Return -1
	END
	---------#### ders varsa, bu sefer olan bir kitabı mı tekrar ekliyoruz ona bakarız
	Declare @kitap_id int

	Select @kitap_id=kitap_id FROM kitaplar WHERE ( ders_id=@ders_id AND kitap_ad = @kitap_ad ) -- eklemeye çalıştığımız özellikler aranıp id değişkenimize atılır

	IF(@kitap_id is null)-- id ' boş ise daha önce böyle bir kitap eklenmemiş demektir, kitabı ekleriz
	BEGIN
		INSERT INTO kitaplar (ders_id,kitap_ad,kitap_yayin,kitap_ucret) VALUES(@ders_id,@kitap_ad,@kitap_yayin,@kitap_ucret)
	END
	ELSE -- id' boş değilse , aynı kitabı daha önce eklemişiz demektir, hiç bir şey yapmayız buradan sonra kod olmadığından, prosedür aşağıdaki hatayı yazdırıp kendiliğinden biter zaten.
	BEGIN
		SELECT 'Böyle bir kitap zaten mevcut...' as HATA
	END


GO
/****** Object:  StoredProcedure [dbo].[SP_Kullanici_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Kullanici_Ekle]

	@kullanici_ad nvarchar(20),
	@kullanici_sifre nvarchar(20),
	
	@ogretmen_islemleri bit,
	@veli_ogrenci_islemleri bit,
	@ders_islemleri bit,
	@sinav_islemleri bit,
	@kullanici_islemleri bit,
	@devamsizlik_islemleri bit,
	@arsiv_islemleri bit
AS
	
	
	if(@kullanici_ad = 'müdür')
	BEGIN
		Select 'Müdür adlı kullanıcı eklenilemez.'
		return -1
	END

	INSERT INTO kullanicilar values(@kullanici_ad,@kullanici_sifre,@ogretmen_islemleri,@veli_ogrenci_islemleri,@ders_islemleri,@sinav_islemleri,@kullanici_islemleri,@devamsizlik_islemleri,@arsiv_islemleri,NULL)
	

GO
/****** Object:  StoredProcedure [dbo].[SP_Kullanici_Yetki_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Kullanici_Yetki_Guncelle]

	@kullanici_id int,
	@ogretmen_islemleri bit,
	@veli_ogrenci_islemleri bit,
	@ders_islemleri bit,
	@sinav_islemleri bit,
	@kullanici_islemleri bit,
	@devamsizlik_islemleri bit,
	@arsiv_islemleri bit
AS
	
	declare @kullanici_ad nvarchar(20)

	select @kullanici_ad=kullanici_ad from kullanicilar where ( kullanici_id=@kullanici_id)
	if(@kullanici_ad = 'müdür')
	BEGIN
		Select 'Müdür için işlem yapılamaz.'
		return -1
	END

	UPDATE kullanicilar set
	ogretmen_islemleri=@ogretmen_islemleri,
	veli_ogrenci_islemleri=@veli_ogrenci_islemleri,
	ders_islemleri=@ders_islemleri,
	sinav_islemleri=@sinav_islemleri,
	kullanici_islemleri=@kullanici_islemleri,
	devamsizlik_islemleri=@devamsizlik_islemleri,
	arsiv_islemleri=@arsiv_islemleri
	where (kullanici_id=@kullanici_id)
GO
/****** Object:  StoredProcedure [dbo].[SP_Ogrenci_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Ogrenci_Ara]

@kelime nvarchar(30)

AS
	
	Select 

	o.ogr_id as Öğrenci_Numarası,
	o.ogr_ad as Öğrenci_İsmi,
	o.ogr_soyad as Öğrenci_Soyadı ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sınıf,
	a.alan_ad as Alanı,
	o.ogr_tc as Öğrenci_TC,
	od.ogr_tel as Öğrenci_Telefon,
	od.ogr_adres as Öğrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayıt_Tarihi,
	od.ogr_dogum_tar as Doğum_Tarihi,
	od.ogr_ucret as Alınan_Ücret,
	v.veli_ad as Veli_İsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


	from 

	ogrenci o 

	left join ogrenci_detay od on o.ogr_id = od.ogr_id
	left join veli v on v.veli_id=o.veli_id 
	left join sube s on s.sube_id=o.sube_id
	left join alan a on a.alan_id=s.alan_id
	
	where (
	
	o.ogr_id like '%'+@kelime+'%' or 
	o.ogr_ad like '%'+@kelime+'%' or 
	o.ogr_soyad like '%'+@kelime+'%' or 
	s.sube_seviye like '%'+@kelime+'%' or 
	s.sube_harf like '%'+@kelime+'%' or 
	a.alan_ad like '%'+@kelime+'%' or 
	o.ogr_tc like '%'+@kelime+'%' or 
	od.ogr_tel like '%'+@kelime+'%' or 
	od.ogr_adres like '%'+@kelime+'%' or 
	od.ogr_okul like '%'+@kelime+'%' or 
	od.ogr_kayit_tar like '%'+@kelime+'%' or 
	od.ogr_dogum_tar like '%'+@kelime+'%' or 
	od.ogr_ucret like '%'+@kelime+'%' or 
	v.veli_ad like '%'+@kelime+'%' or 
	v.veli_soyad like '%'+@kelime+'%' or 
	v.veli_tc like '%'+@kelime+'%' or 
	v.veli_tel like '%'+@kelime+'%' 
	
	)
	
	
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Ogrenci_Deneme_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Ogrenci_Deneme_Ara]

@deneme_seviye nvarchar(2),
@deneme_tarih date

AS

	Select 

		od.ogr_id as Öğrenci_Numarası,
		UPPER(o.ogr_ad) as İsmi,
		UPPER(o.ogr_soyad) as Soyismi,
		UPPER(a.alan_ad) as Alanı,
		od.turkce_net as Türkçe_Net,
		od.sosyal_net as Sosyal_Net,
		od.matematik_net as Matematik_Net,
		od.fen_net as Fen_Net,
		puan_ygs_1 as YGS_1,
		puan_ygs_2 as YGS_2,
		puan_ygs_3 as YGS_3,
		puan_ygs_4 as YGS_4,
		puan_ygs_5 as YGS_5,
		puan_ygs_6 as YGS_6

	from 

	ogrenci_deneme od 
	inner join ogrenci o on od.ogr_id= o.ogr_id
	inner join sube s on o.sube_id = s.sube_id 
	inner join alan a on s.alan_id = a.alan_id
	inner join deneme d on d.deneme_id = od.deneme_id

	where d.deneme_seviye=@deneme_seviye and d.deneme_tarih=@deneme_tarih


GO
/****** Object:  StoredProcedure [dbo].[SP_Ogrenci_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_Ogrenci_Guncelle]

	@ogr_id int,
	@yeni_ogr_ad VARCHAR(30),
	@yeni_ogr_soyad VARCHAR(30),
	@yeni_ogr_tel CHAR(10),
	@yeni_ogr_adres VARCHAR(60),
	@yeni_ogr_okul VARCHAR(50),
	@yeni_ogr_ucret INT,
	@yeni_ogr_dogum_tar date,
	@yeni_ogr_kayit_tar date,
	@yeni_ogr_tc char(11),
	
	@yeni_seviye VARCHAR(2),
	@yeni_harf VARCHAR(1)
	
AS
set @yeni_ogr_ad = upper(SUBSTRING(@yeni_ogr_ad,1,1))+LOWER(SUBSTRING(@yeni_ogr_ad,2,len(@yeni_ogr_ad)-1))
set @yeni_ogr_soyad = upper(SUBSTRING(@yeni_ogr_soyad,1,1))+LOWER(SUBSTRING(@yeni_ogr_soyad,2,len(@yeni_ogr_soyad)-1))

	DECLARE @yeni_sube_id INT

	-- ogrenci var mı kontrol
	declare @varmi int
	Select @varmi=ogr_id from ogrenci where (ogr_id=@ogr_id)
	if(@varmi is null)
	BEGIN
		Select 'Belirtilen Öğrenci Bulunamadı'
		Return -1
	END


	-- veriler boşsa eskilerini default al

	IF(@yeni_ogr_ad is null)
	BEGIN
		Select @yeni_ogr_ad = ogr_ad from ogrenci where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_soyad is null)
	BEGIN
		Select @yeni_ogr_soyad = ogr_soyad from ogrenci where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_tel is null)
	BEGIN
		Select @yeni_ogr_tel = ogr_tel from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_adres is null)
	BEGIN
		Select @yeni_ogr_adres = ogr_adres from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_okul is null)
	BEGIN
		Select @yeni_ogr_okul = ogr_okul from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_ucret is null)
	BEGIN
		Select @yeni_ogr_ucret = ogr_ucret from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_dogum_tar is null)
	BEGIN
		Select @yeni_ogr_dogum_tar = ogr_dogum_tar from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_kayit_tar is null)
	BEGIN
		Select @yeni_ogr_kayit_tar = ogr_kayit_tar from ogrenci_detay where (ogr_id=@ogr_id)
	END
	IF(@yeni_ogr_tc is null)
	BEGIN
		Select @yeni_ogr_tc = ogr_tc from ogrenci where (ogr_id=@ogr_id)
	END


	--- Sube Güncelleme işlemi

	DECLARE @sube_id INT

	SELECT @sube_id = sube_id FROM ogrenci WHERE (ogr_id=@ogr_id) -- ilk önce şube id'sini elimeze aldık.

	
		DECLARE @sube_harf VARCHAR(1),@sube_seviye VARCHAR(2)-- Subenin harfini ve seviyesini bulalım.

		SELECT @sube_harf = sube_harf , @sube_seviye = sube_seviye FROM sube WHERE (sube_id=@sube_id)

				IF(@yeni_seviye is null) -- Eğer güncelleme olmadıysa eski değerleri yükleyelim.
				BEGIN
					Select @yeni_seviye = @sube_seviye
				END
				IF(@yeni_harf is null)
				BEGIN
					Select @yeni_harf = @sube_harf -- Eğer güncelleme olmadıysa eski değerleri yükleyelim.
				END

				-- ve son durumda öğrencinin sube_id sini bulup gönderelim.
				SELECT @yeni_sube_id = sube_id FROM sube WHERE (sube_seviye = @yeni_seviye AND sube_harf = @yeni_harf) -- öğrencisnin son durumdaki subesini bulduk.

	
	-- ogrenciyi güncelle
	update ogrenci set ogr_ad=@yeni_ogr_ad,ogr_soyad=@yeni_ogr_soyad,sube_id=@yeni_sube_id,ogr_tc=@yeni_ogr_tc where (ogr_id=@ogr_id)
	update ogrenci_detay set ogr_tel=@yeni_ogr_tel,ogr_adres=@yeni_ogr_adres,ogr_okul=@yeni_ogr_okul,ogr_ucret=@yeni_ogr_ucret,ogr_dogum_tar=@yeni_ogr_dogum_tar,ogr_kayit_tar=@yeni_ogr_kayit_tar where (ogr_id=@ogr_id)
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Ogrenci_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Ogrenci_Sil] @ogr_id int
as

	declare @varmi int

	Select @varmi=ogr_id from ogrenci where (ogr_id=@ogr_id)

	if (@varmi is null)
	BEGIN
		Select 'Böyle bir öğrenci bulunmamakta...'
		RETURN -1
	END

	Delete from ogrenci_detay where ogr_id=@ogr_id


GO
/****** Object:  StoredProcedure [dbo].[SP_Ogretmen_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Ogretmen_Ara]

@kelime nvarchar(30)
	
AS

Select
	hoca_id as Sıra,
	hoca_ad as İsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaş,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayıt_Tarihi

From Hoca

where (
	
	hoca_ad like '%'+@kelime+'%' or 
	hoca_soyad like '%'+@kelime+'%' or 
	hoca_tel like '%'+@kelime+'%' or 
	hoca_ucret like '%'+@kelime+'%' or 
	hoca_tc like '%'+@kelime+'%' or 
	hoca_kayit_tarih like '%'+@kelime+'%' 
	
	)
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Ortalama_Puanlar_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Ortalama_Puanlar_Ara]

@tarih date

as

	Select 
	d.deneme_seviye,
	avg(puan_ygs_1) as 'YGS 1',
	avg(puan_ygs_2) as 'YGS 2',
	avg(puan_ygs_3) as 'YGS 3',
	avg(puan_ygs_4) as 'YGS 4',
	avg(puan_ygs_5) as 'YGS 5',
	avg(puan_ygs_6) as 'YGS 6'
	from ogrenci_deneme od
	inner join deneme d on od.deneme_id = d.deneme_id 
	where (d.deneme_tarih = @tarih )
	group by d.deneme_seviye order by d.deneme_seviye asc
	


GO
/****** Object:  StoredProcedure [dbo].[SP_Silinen_Ogrenci_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Silinen_Ogrenci_Ara]

@kelime nvarchar(30)

AS
	
	Select 

	o.ogr_id as Öğrenci_Numarası,
	o.ogr_ad as Öğrenci_İsmi,
	o.ogr_soyad as Öğrenci_Soyadı ,
	s.sube_seviye as Seviye,
	s.sube_harf as Sınıf,
	a.alan_ad as Alanı,
	o.ogr_tc as Öğrenci_TC,
	od.ogr_tel as Öğrenci_Telefon,
	od.ogr_adres as Öğrenci_Adres,
	od.ogr_okul as Okulu,
	od.ogr_kayit_tar as Kayıt_Tarihi,
	od.ogr_dogum_tar as Doğum_Tarihi,
	od.ogr_ucret as Alınan_Ücret,
	v.veli_ad as Veli_İsmi,
	v.veli_soyad as Veli_Soyismi,
	v.veli_tc as Veli_TC,
	v.veli_tel as Veli_Telefon


	from 

	silinen_ogrenci o 

	left join silinen_ogrenci_detay od on o.ogr_id = od.ogr_id
	left join silinen_veli v on v.veli_id=o.veli_id 
	left join sube s on s.sube_id=o.sube_id
	left join alan a on a.alan_id=s.alan_id
	
	where (
	
	o.ogr_id like '%'+@kelime+'%' or 
	o.ogr_ad like '%'+@kelime+'%' or 
	o.ogr_soyad like '%'+@kelime+'%' or 
	s.sube_seviye like '%'+@kelime+'%' or 
	s.sube_harf like '%'+@kelime+'%' or 
	a.alan_ad like '%'+@kelime+'%' or 
	o.ogr_tc like '%'+@kelime+'%' or 
	od.ogr_tel like '%'+@kelime+'%' or 
	od.ogr_adres like '%'+@kelime+'%' or 
	od.ogr_okul like '%'+@kelime+'%' or 
	od.ogr_kayit_tar like '%'+@kelime+'%' or 
	od.ogr_dogum_tar like '%'+@kelime+'%' or 
	od.ogr_ucret like '%'+@kelime+'%' or 
	v.veli_ad like '%'+@kelime+'%' or 
	v.veli_soyad like '%'+@kelime+'%' or 
	v.veli_tc like '%'+@kelime+'%' or 
	v.veli_tel like '%'+@kelime+'%' 
	
	)
GO
/****** Object:  StoredProcedure [dbo].[SP_Silinen_Ogretmen_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_Silinen_Ogretmen_Ara]

@kelime nvarchar(30)
	
AS

Select
	hoca_id as Sıra,
	hoca_ad as İsim,
	hoca_soyad as Soyisim,
	hoca_tel as Telefon,
	hoca_ucret as Maaş,
	hoca_tc as TC,
	hoca_kayit_tarih as Kayıt_Tarihi,
	hoca_silinme_tarih as 'Silinme Tarihi'
	
From Silinen_Hoca

where (
	
	hoca_ad like '%'+@kelime+'%' or 
	hoca_soyad like '%'+@kelime+'%' or 
	hoca_tel like '%'+@kelime+'%' or 
	hoca_ucret like '%'+@kelime+'%' or 
	hoca_tc like '%'+@kelime+'%' or 
	hoca_kayit_tarih like '%'+@kelime+'%' or 
	hoca_silinme_tarih like '%'+@kelime+'%' 
	
	)
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_Sube_Ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Sube_Ekle] 

	@sube_harf nvarchar(1),
	@sube_seviye nvarchar(2),

	@alan_ad nvarchar(3) -- alan id 'sini bulacaz

AS
	---- Alan sorgulama
	Declare @alan_id int
	Select @alan_id=alan_id from alan where (alan_ad=@alan_ad)

	IF(@alan_id is null)
	BEGIN
		Select 'belirtilen alan bulunamadı'
		Return -1
	END

	---- önceden girildi mi kontrol? zaten unique ' koyduk ama türkçe hata mesajı vermek için sorduruyoruz.

	Declare @sube_id int
	select @sube_id=sube_id from sube where( sube_harf=@sube_harf and sube_seviye=@sube_seviye and alan_id = @alan_id)

	IF(@sube_id is null)
	BEGIN
		INSERT INTO  sube (sube_harf,sube_seviye,alan_id) values (@sube_harf,@sube_seviye,@alan_id)
	END
	ELSE
	BEGIN
		Select 'Böyle bir şube zaten bulunmakta'
	END


GO
/****** Object:  StoredProcedure [dbo].[SP_Sube_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[SP_Sube_Guncelle]

	@sube_harf char(1),
	@sube_seviye nvarchar(2),
	
	
	@yeni_sube_harf char(1),
	@yeni_sube_seviye nvarchar(2),
	@yeni_alan_ad nvarchar(3)
AS

	---- dönüştürülmesi istenilen sube var mı kontrol et

	declare @sube_id int

	Select @sube_id=sube_id from sube where (sube_harf=@sube_harf and sube_seviye=@sube_seviye)

	if(@sube_id is null)
	BEGIN
		Select 'Böyle bir şube bulunamadı'
		return -1
	END
	---- Dönüşüm sonrası çakışacak şube var mı kontrol
	declare @sube_id2 int
	Select  @sube_id2 from sube where (sube_harf=@yeni_sube_harf and sube_seviye = @yeni_sube_seviye)
	if (@sube_id2 is not null)
	BEGIN
		Select 'Var olan bir şubeye değiştirilemez.'
		REturn -1
	END
	
	----benzer şube yoksa şube değiştirilme üzere , parametrelere değer verilmemişse eski bilgileri default olarak girilecek

	if(@yeni_sube_harf is null)
	BEGIN
		Select @yeni_sube_harf=sube_harf from sube where (sube_id=@sube_id)
	END
	if(@yeni_sube_seviye is null)
	BEGIN
		Select @yeni_sube_seviye=sube_seviye from sube where (sube_id=@sube_id)
	END
	
	----alan Default için alan_id bulma
	
		Declare @yeni_alan_id int
		Select @yeni_alan_id=alan_id from alan where (alan_ad=@yeni_alan_ad)
		
		if(@yeni_alan_id is null)
		BEGIN
			Select 'Girilen alan bulunamadığı için alan güncellemesi yapılmadı.'
			Select @yeni_alan_id=alan_id from sube where (sube_id=@sube_id)
		END
		

	
	---- şube değiştirilir

	update sube set sube_harf=@sube_harf,sube_seviye=@sube_seviye,alan_id=@yeni_alan_id
	where sube_id=@sube_id
GO
/****** Object:  StoredProcedure [dbo].[SP_Sube_Sil]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Sube_Sil] @sube_seviye nvarchar(2),@sube_harf char(1)

as

	declare @sube_id int

	Select @sube_id=sube_id from sube where (sube_seviye=@sube_seviye and sube_harf= @sube_harf)

	if(@sube_id is null)
	BEGIN
		Select 'Böyle bir şube bulunmamakta...'
		RETURN -1
	END

	declare @sube_ogrenci_sayi int

	Select @sube_ogrenci_sayi = count(ogr_id) from ogrenci where (sube_id=@sube_id)

	if(@sube_ogrenci_sayi > 0)
	BEGIN
		Select 'Şube silinemez, Şubeye ait öğrenci bulunmakta...'
		RETURN -1
	END


	delete from sube where sube_id=@sube_id
GO
/****** Object:  StoredProcedure [dbo].[SP_Subeler_Ara]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--öğrenci ekleme yerinde, seviye girildikten sonra şubeler seçeneğine aşağıdan dönenler eklenir.
Create proc [dbo].[SP_Subeler_Ara]
@seviye nvarchar(2)
AS

Select 

sube_harf

from sube 
where (sube_seviye=@seviye)


GO
/****** Object:  StoredProcedure [dbo].[SP_Veli_Guncelle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Veli_Guncelle]
	@ogr_id int,
	
	@yeni_veli_tc char(11),
	@yeni_veli_ad nvarchar(30),
	@yeni_veli_soyad nvarchar(30),
	@yeni_veli_tel char(10)

as

set @yeni_veli_ad = upper(SUBSTRING(@yeni_veli_ad,1,1))+LOWER(SUBSTRING(@yeni_veli_ad,2,len(@yeni_veli_ad)-1))
set @yeni_veli_soyad = upper(SUBSTRING(@yeni_veli_soyad,1,1))+LOWER(SUBSTRING(@yeni_veli_soyad,2,len(@yeni_veli_soyad)-1))

	--öğrenci var mı : öğrenci var sa veli_id ' si elimize gelir , veli id yi olup olmadığını sordururuz. farketmez.
	declare @veli_id int
	Select @veli_id=veli_id from ogrenci where (ogr_id=@ogr_id)
	if(@veli_id is null)
	BEGIN
		Select 'Belirtilen Veli Bulunamadı...(Öğrenci Olmayabilir.)'
		return -1
	END
	-- veli_id ' almış olduk
	
	
	

	-- veriler boş girilmişse default olarak eski verileri alalım
	if(@yeni_veli_ad is null)
	BEGIN
		Select @yeni_veli_ad=veli_ad from veli where (veli_id=@veli_id)
	END

	if(@yeni_veli_soyad is null)
	BEGIN
		Select @yeni_veli_soyad=veli_soyad from veli where (veli_id=@veli_id)
	END
	if(@yeni_veli_tel is null)
	BEGIN
		Select @yeni_veli_tel=veli_tel from veli where (veli_id=@veli_id)
	END

	-- update yapılır
	UPDATE veli set veli_ad=@yeni_veli_ad,veli_soyad=@yeni_veli_soyad,veli_tel=@yeni_veli_tel,veli_tc=@yeni_veli_tc where veli_id=@veli_id


GO
/****** Object:  StoredProcedure [dbo].[SP_Veli_Ogrenci_ekle]    Script Date: 21.12.2017 10:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Veli_Ogrenci_ekle]
    @veli_ad nvarchar(30),-- Veli bilgileri
	@veli_soyad nvarchar(30),
	@veli_tel char(10) ,
	@veli_tc char(11) ,


	@ogr_tc char(11), -- Ogrenci
	@ogr_ad nvarchar(30),
	@ogr_soyad nvarchar(30),
	

	@ogr_seviye nvarchar(2),
	@ogr_harf nvarchar(1),

	@ogr_tel char(10),-- Ogrenci_Detay
	@ogr_adres nvarchar(60),
	@ogr_okul nvarchar(50),
	@ogr_kayit_tar date,
	@ogr_dogum_tar date,
	@ogr_ucret int
	
AS

set @veli_ad = upper(SUBSTRING(@veli_ad,1,1))+LOWER(SUBSTRING(@veli_ad,2,len(@veli_ad)-1))
set @veli_soyad = upper(SUBSTRING(@veli_soyad,1,1))+LOWER(SUBSTRING(@veli_soyad,2,len(@veli_soyad)-1))
set @ogr_ad = upper(SUBSTRING(@ogr_ad,1,1))+LOWER(SUBSTRING(@ogr_ad,2,len(@ogr_ad)-1))
set @ogr_soyad = upper(SUBSTRING(@ogr_soyad,1,1))+LOWER(SUBSTRING(@ogr_soyad,2,len(@ogr_soyad)-1))


	-- Veli daha önce eklenmişmi kontrol etmemiz gerekir.
	DECLARE @Veli_id INT
	

	SELECT @Veli_id = veli_id FROM veli WHERE (veli_tel=@veli_tel and veli_tc=@veli_tc) -- Veli id'sini elimize aldık.

	IF(@Veli_id IS NULL) -- Veli id' si null ise veli daha once eklenememiştir. eklememiz gerekir.
		BEGIN -- veli yoksa veli eklenir , 
			-- ama, ya aynı tc veya aynı telefon daha önce kullanılmışsa ? , bunu aşağıda kontrol ederiz ::: YENİ - > Emreninki Fix
			Declare @varmi1 int,@varmi2 int 
			Select @varmi1=veli_id from veli where (veli_tel=@veli_tel)
			Select @varmi2=veli_id from veli where (veli_tc=@veli_tc)
			if(@varmi1 is not null or @varmi2 is not null)
			BEGIN
				Select 'Belirtilen Tc veya Telefon Başka bir velide kullanılmış Aynısı Girilemez.'
				Return -1
			END
			-- Veli eklenir.
			INSERT INTO veli(veli_ad,veli_soyad,veli_tel,veli_tc)
			VALUES (@veli_ad,@veli_soyad,@veli_tel,@veli_tc)
			SELECT @Veli_id = SCOPE_IDENTITY() -- Biraz önce olşturduğumuz velinin id'sini elimize almamıza yardımcı olur.
		END
	ELSE -- Eğer @veli_id NULL değilse daha önce bu veli var demektir. bizde oğrencimizi bu veliye ekleyeceğiz.
		BEGIN
			-- önce var olan velinin id'sini elimze alalım.
			Select @veli_id = veli_id from veli where(veli_tel=@veli_tel) -- Var olan velinin id'sini elimze aldık.
		END


	--  Ogrenci Ekleme : İlk önce öğrencinin eklendiği sube varmı kontrol edelim.

		-- Sube Kontrolu:
		DECLARE 
			@sube_id INT
			SELECT @sube_id = sube_id FROM sube WHERE (sube_seviye =  @ogr_seviye AND  sube_harf = @ogr_harf)
			IF(@sube_id IS NULL)
				BEGIN
					--Sube bulunamadı, değişkenlere NULL ver.
					SELECT @ogr_seviye=NULL
					SELECT @ogr_harf=NULL
				END
			
			-- Sube Bulunursa öğrenciyi ekleyebilirim.Bulunmazsa Default Değer OLARAK NULL ile eklenir:  sonradan seviyesi harfi girilebilir.
			
					DECLARE @ogr_id INT
					SELECT @ogr_id = ogr_id FROM ogrenci WHERE (ogr_tc = @ogr_tc) -- Öğrencinin id'sini elimze aldık.
					IF(@ogr_id IS NOT NULL)
						BEGIN
							SELECT 'Öğrenci Zaten Kayıtlı'
							RETURN -1
					END
					ELSE
						BEGIN
						
						 --- öğrenci eklenir.
							INSERT INTO ogrenci (ogr_tc,ogr_ad,ogr_soyad,veli_id,sube_id) VALUES (@ogr_tc,@ogr_ad,@ogr_soyad,@veli_id,@sube_id)
							SELECT @ogr_id = SCOPE_IDENTITY()-- bi önceki satırda oluşan verinin identity tip sütunu değerini alır.
						--- Öğrenci detay eklenir.
							INSERT INTO ogrenci_detay (ogr_id,ogr_tel,ogr_adres,ogr_okul,ogr_kayit_tar,ogr_dogum_tar,ogr_ucret)
							VALUES(@ogr_id,@ogr_tel,@ogr_adres,@ogr_okul,@ogr_kayit_tar,@ogr_dogum_tar,@ogr_ucret)


						END
				


GO
USE [master]
GO
ALTER DATABASE [proje] SET  READ_WRITE 
GO
