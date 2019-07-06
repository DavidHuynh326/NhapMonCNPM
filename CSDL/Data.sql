USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='QLNT')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'QLNT') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [QLNT]
END
GO

/* Collation = SQL_Latin1_General_CP1_CI_AS */
CREATE DATABASE [QLNT]
GO
USE [QLNT]
GO

CREATE TABLE [dbo].[tblHst](
	[tenTre] [nvarchar](50) NOT NULL,
	[ngaysinh] [nvarchar] (10) NOT NULL,
	[phuhuynh] [nvarchar](50) NOT NULL,
	[tenonha] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[dienthoai] [nvarchar](50) NOT NULL,
	 CONSTRAINT [PK_tblHst] PRIMARY KEY CLUSTERED 
(
	[tenTre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO[dbo].[tblHst]([tenTre],[ngaysinh],[phuhuynh],[tenonha],[diachi],[dienthoai]) VALUES(N'Huynh Trung Tan',N'1/1/1998',N'Huynh Gia',N'Meo Bu',N'Lam Dong',N'0123456789')
GO
INSERT INTO[dbo].[tblHst]([tenTre],[ngaysinh],[phuhuynh],[tenonha],[diachi],[dienthoai]) VALUES(N'Phan Van Tien',N'1/6/1998',N'Phan Thi',N'Dua',N'Quang Tri',N'01234567891')
GO
INSERT INTO[dbo].[tblHst]([tenTre],[ngaysinh],[phuhuynh],[tenonha],[diachi],[dienthoai]) VALUES(N'Hoang Anh Minh',N'1/2/1998',N'Hoang Gia',N'Ga',N'Sao hoa',N'012345678910')
CREATE TABLE [dbo].[tblLop](
	[tenLop] [nvarchar](50) NOT NULL,
	[khoiLop] [nvarchar](50) NOT NULL,
	[tenTre] [nvarchar](50) NOT NULL,
	[ngaynhaphoc] [nvarchar](10) NOT NULL,
	[tuoi] [int] NOT NULL,
	[ghichu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblLop] PRIMARY KEY CLUSTERED 
(
	[tenLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [QLNT]
GO
INSERT INTO[dbo].[tblLop]([tenLop],[khoiLop],[tenTre],[ngaynhaphoc],[tuoi],[ghichu]) VALUES(N'Mam 1',N'Mam',N'Huynh Trung Tan',N'1/1/2019',N'21',N'Nam')
GO
INSERT INTO[dbo].[tblLop]([tenLop],[khoiLop],[tenTre],[ngaynhaphoc],[tuoi],[ghichu]) VALUES(N'Mam 2',N'Mam',N'Phan Van Tien',N'1/1/2019',N'21',N'Nam')
GO
INSERT INTO[dbo].[tblLop]([tenLop],[khoiLop],[tenTre],[ngaynhaphoc],[tuoi],[ghichu]) VALUES(N'Mam 3',N'Mam',N'Hoang Anh Minh',N'1/1/2019',N'21',N'Nam')

CREATE TABLE [dbo].[tblListTre](
	[tenTre] [nvarchar](50) NOT NULL,
	[tuoi] [int] NOT NULL,
	[khoiLop] [nvarchar](50) NOT NULL,
	[ghichu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblListTre] PRIMARY KEY CLUSTERED 
(
	[tenTre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [QLNT]
GO
INSERT INTO[dbo].[tblListTre]([tenTre],[tuoi],[khoiLop],[ghichu]) VALUES(N'Huynh Trung Tan',N'21',N'Mam',N'Nam')
GO
INSERT INTO[dbo].[tblListTre]([tenTre],[tuoi],[khoiLop],[ghichu]) VALUES(N'Phan Van Tien',N'21',N'Mam',N'Nam')
GO
INSERT INTO[dbo].[tblListTre]([tenTre],[tuoi],[khoiLop],[ghichu]) VALUES(N'Hoang Anh Minh',N'21',N'Mam',N'Nam')

CREATE TABLE [dbo].[tblTinhtrang](
	[tenTre] [nvarchar](50) NOT NULL,
	[khoiLop] [nvarchar](50) NOT NULL,
	[ngay] [date] NOT NULL,
	[tinhtrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblTinhtrang] PRIMARY KEY CLUSTERED 
(
	[tenTre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [QLNT]
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Huynh Trung Tan',N'Mam',N'1/1/2020',N'Bieng an')
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Phan Van Tien',N'Mam',N'1/1/2020',N'Ngoan')
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Hoang Anh Minh',N'Mam',N'1/1/2020',N'Benh')


/*CREATE TABLE [dbo].[tblBaocao](
	[tenTre] [nvarchar](50) NOT NULL,
	[khoiLop] [nvarchar](50) NOT NULL,
	[ngay] [date] NOT NULL,
	[tinhtrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblTinhtrang] PRIMARY KEY CLUSTERED 
(
	[tenTre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [QLNT]
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Huynh Trung Tan',N'Mam',N'Bieng an',N'Nam')
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Phan Van Tien',N'Ngoan',N'Mam',N'Nam')
GO
INSERT INTO[dbo].[tblTinhtrang]([tenTre],[khoiLop],[ngay],[tinhtrang]) VALUES(N'Hoang Anh Minh',N'Benh',N'Mam',N'Nam')

*/