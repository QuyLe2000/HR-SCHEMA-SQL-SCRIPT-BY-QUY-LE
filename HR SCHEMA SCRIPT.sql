USE [master]
GO
/****** Object:  Database [HR_SCHEMA]    Script Date: 7/31/2023 10:00:16 PM ******/
CREATE DATABASE [HR_SCHEMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HR_SCHEMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HR_SCHEMA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HR_SCHEMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HR_SCHEMA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HR_SCHEMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HR_SCHEMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HR_SCHEMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HR_SCHEMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HR_SCHEMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HR_SCHEMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HR_SCHEMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HR_SCHEMA] SET  MULTI_USER 
GO
ALTER DATABASE [HR_SCHEMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HR_SCHEMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HR_SCHEMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HR_SCHEMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HR_SCHEMA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HR_SCHEMA]
GO
/****** Object:  User [Helius]    Script Date: 7/31/2023 10:00:16 PM ******/
CREATE USER [Helius] FOR LOGIN [Helius] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [HR_SCHEMA]
GO
/****** Object:  Sequence [dbo].[departments_seq]    Script Date: 7/31/2023 10:00:17 PM ******/
CREATE SEQUENCE [dbo].[departments_seq] 
 AS [bigint]
 START WITH 280
 INCREMENT BY 10
 MINVALUE -9223372036854775808
 MAXVALUE 9990
 CACHE 
GO
USE [HR_SCHEMA]
GO
/****** Object:  Sequence [dbo].[employees_seq]    Script Date: 7/31/2023 10:00:17 PM ******/
CREATE SEQUENCE [dbo].[employees_seq] 
 AS [bigint]
 START WITH 207
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [HR_SCHEMA]
GO
/****** Object:  Sequence [dbo].[locations_seq]    Script Date: 7/31/2023 10:00:17 PM ******/
CREATE SEQUENCE [dbo].[locations_seq] 
 AS [bigint]
 START WITH 3300
 INCREMENT BY 100
 MINVALUE -9223372036854775808
 MAXVALUE 9900
 CACHE 
GO
/****** Object:  Table [dbo].[countries]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [char](2) NOT NULL,
	[country_name] [varchar](40) NULL,
	[region_id] [int] NULL,
 CONSTRAINT [country_c_id_pk] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[departments]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] NOT NULL,
	[department_name] [varchar](30) NOT NULL,
	[manager_id] [int] NULL,
	[location_id] [int] NULL,
 CONSTRAINT [dept_id_pk] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dim_table]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dim_table](
	[employee_id] [int] NOT NULL,
	[job_id] [varchar](10) NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
	[location_id] [int] NULL,
	[country_id] [char](2) NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NULL,
	[salary] [numeric](8, 2) NULL,
	[commission_pct] [numeric](2, 2) NULL,
	[department_name] [varchar](30) NULL,
	[job_title] [varchar](35) NULL,
	[city] [varchar](30) NULL,
	[state_province] [varchar](25) NULL,
	[country_name] [varchar](40) NULL,
	[region_name] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employees]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](25) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [varchar](10) NOT NULL,
	[salary] [decimal](8, 2) NULL,
	[commission_pct] [decimal](2, 2) NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
 CONSTRAINT [emp_emp_id_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[job_history]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[job_history](
	[employee_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[job_id] [varchar](10) NOT NULL,
	[department_id] [int] NULL,
 CONSTRAINT [jhist_emp_id_st_date_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [varchar](10) NOT NULL,
	[job_title] [varchar](35) NOT NULL,
	[min_salary] [int] NULL,
	[max_salary] [int] NULL,
 CONSTRAINT [job_id_pk] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[locations]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [int] NOT NULL,
	[street_address] [varchar](40) NULL,
	[postal_code] [varchar](12) NULL,
	[city] [varchar](30) NOT NULL,
	[state_province] [varchar](25) NULL,
	[country_id] [char](2) NULL,
 CONSTRAINT [loc_id_pk] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[regions]    Script Date: 7/31/2023 10:00:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[regions](
	[region_id] [int] NOT NULL,
	[region_name] [varchar](25) NULL,
 CONSTRAINT [reg_id_pk] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'AR', N'Argentina', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'AU', N'Australia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'BE', N'Belgium', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'BR', N'Brazil', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CA', N'Canada', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CH', N'Switzerland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CN', N'China', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'DE', N'Germany', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'DK', N'Denmark', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'EG', N'Egypt', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'FR', N'France', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IL', N'Israel', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IN', N'India', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IT', N'Italy', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'JP', N'Japan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'KW', N'Kuwait', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'ML', N'Malaysia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'MX', N'Mexico', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'NG', N'Nigeria', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'NL', N'Netherlands', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'SG', N'Singapore', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'UK', N'United Kingdom', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'US', N'United States of America', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'ZM', N'Zambia', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'ZW', N'Zimbabwe', 4)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (10, N'Administration', 200, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (20, N'Marketing', 201, 1800)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (30, N'Purchasing', 114, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (40, N'Human Resources', 203, 2400)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (50, N'Shipping', 121, 1500)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (60, N'IT', 103, 1400)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (70, N'Public Relations', 204, 2700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (80, N'Sales', 145, 2500)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (90, N'Executive', 100, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (100, N'Finance', 108, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (110, N'Accounting', 205, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (120, N'Treasury', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (130, N'Corporate Tax', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (140, N'Control And Credit', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (150, N'Shareholder Services', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (160, N'Benefits', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (170, N'Manufacturing', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (180, N'Construction', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (190, N'Contracting', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (200, N'Operations', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (210, N'IT Support', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (220, N'NOC', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (230, N'IT Helpdesk', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (240, N'Government Sales', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (250, N'Retail Sales', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (260, N'Recruiting', NULL, 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (270, N'Payroll', NULL, 1700)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (69, N'Harrison', N'Bloom', N'HBLOOM', N'011.44.1343.829268', CAST(N'2006-03-23' AS Date), N'SA_REP', CAST(10000.00 AS Decimal(8, 2)), CAST(0.20 AS Decimal(2, 2)), 149, 80)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (100, N'Steven', N'King', N'SKING', N'515.123.4567', CAST(N'2003-06-17' AS Date), N'AD_PRES', CAST(24000.00 AS Decimal(8, 2)), NULL, NULL, 90)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (101, N'Neena', N'Kochhar', N'NKOCHHAR', N'515.123.4568', CAST(N'2005-09-21' AS Date), N'AD_VP', CAST(17000.00 AS Decimal(8, 2)), NULL, 100, 90)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (102, N'Lex', N'De Haan', N'LDEHAAN', N'515.123.4569', CAST(N'2001-01-13' AS Date), N'AD_VP', CAST(17000.00 AS Decimal(8, 2)), NULL, 100, 90)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (103, N'Alexander', N'Hunold', N'AHUNOLD', N'590.423.4567', CAST(N'2006-01-03' AS Date), N'IT_PROG', CAST(9000.00 AS Decimal(8, 2)), NULL, 102, 60)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (104, N'Bruce', N'Ernst', N'BERNST', N'590.423.4568', CAST(N'2007-05-21' AS Date), N'IT_PROG', CAST(6000.00 AS Decimal(8, 2)), NULL, 103, 60)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (105, N'David', N'Austin', N'DAUSTIN', N'590.423.4569', CAST(N'2005-06-25' AS Date), N'IT_PROG', CAST(4800.00 AS Decimal(8, 2)), NULL, 103, 60)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (106, N'Valli', N'Pataballa', N'VPATABAL', N'590.423.4560', CAST(N'2006-02-05' AS Date), N'IT_PROG', CAST(4800.00 AS Decimal(8, 2)), NULL, 103, 60)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (107, N'Diana', N'Lorentz', N'DLORENTZ', N'590.423.5567', CAST(N'2007-02-07' AS Date), N'IT_PROG', CAST(4200.00 AS Decimal(8, 2)), NULL, 103, 60)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (108, N'Nancy', N'Greenberg', N'NGREENBE', N'515.124.4569', CAST(N'2002-08-17' AS Date), N'FI_MGR', CAST(12008.00 AS Decimal(8, 2)), NULL, 101, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (109, N'Daniel', N'Faviet', N'DFAVIET', N'515.124.4169', CAST(N'2002-08-16' AS Date), N'FI_ACCOUNT', CAST(9000.00 AS Decimal(8, 2)), NULL, 108, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (110, N'John', N'Chen', N'JCHEN', N'515.124.4269', CAST(N'2005-09-28' AS Date), N'FI_ACCOUNT', CAST(8200.00 AS Decimal(8, 2)), NULL, 108, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (111, N'Ismael', N'Sciarra', N'ISCIARRA', N'515.124.4369', CAST(N'2005-09-30' AS Date), N'FI_ACCOUNT', CAST(7700.00 AS Decimal(8, 2)), NULL, 108, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (112, N'Jose Manuel', N'Urman', N'JMURMAN', N'515.124.4469', CAST(N'2006-03-07' AS Date), N'FI_ACCOUNT', CAST(7800.00 AS Decimal(8, 2)), NULL, 108, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (113, N'Luis', N'Popp', N'LPOPP', N'515.124.4567', CAST(N'2007-12-07' AS Date), N'FI_ACCOUNT', CAST(6900.00 AS Decimal(8, 2)), NULL, 108, 100)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (114, N'Den', N'Raphaely', N'DRAPHEAL', N'515.127.4561', CAST(N'2002-12-07' AS Date), N'PU_MAN', CAST(11000.00 AS Decimal(8, 2)), NULL, 100, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (115, N'Alexander', N'Khoo', N'AKHOO', N'515.127.4562', CAST(N'2003-05-18' AS Date), N'PU_CLERK', CAST(3100.00 AS Decimal(8, 2)), NULL, 114, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (116, N'Shelli', N'Baida', N'SBAIDA', N'515.127.4563', CAST(N'2005-12-24' AS Date), N'PU_CLERK', CAST(2900.00 AS Decimal(8, 2)), NULL, 114, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (117, N'Sigal', N'Tobias', N'STOBIAS', N'515.127.4564', CAST(N'2005-07-24' AS Date), N'PU_CLERK', CAST(2800.00 AS Decimal(8, 2)), NULL, 114, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (118, N'Guy', N'Himuro', N'GHIMURO', N'515.127.4565', CAST(N'2006-11-15' AS Date), N'PU_CLERK', CAST(2600.00 AS Decimal(8, 2)), NULL, 114, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (119, N'Karen', N'Colmenares', N'KCOLMENA', N'515.127.4566', CAST(N'2007-06-10' AS Date), N'PU_CLERK', CAST(2500.00 AS Decimal(8, 2)), NULL, 114, 30)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (120, N'Matthew', N'Weiss', N'MWEISS', N'650.123.1234', CAST(N'2004-07-18' AS Date), N'ST_MAN', CAST(8000.00 AS Decimal(8, 2)), NULL, 100, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (121, N'Adam', N'Fripp', N'AFRIPP', N'650.123.2234', CAST(N'2005-04-10' AS Date), N'ST_MAN', CAST(8200.00 AS Decimal(8, 2)), NULL, 100, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (122, N'Payam', N'Kaufling', N'PKAUFLIN', N'650.123.3234', CAST(N'2003-05-01' AS Date), N'ST_MAN', CAST(7900.00 AS Decimal(8, 2)), NULL, 100, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (129, N'Laura', N'Bissot', N'LBISSOT', N'650.124.5234', CAST(N'2005-08-20' AS Date), N'ST_CLERK', CAST(3300.00 AS Decimal(8, 2)), NULL, 121, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (130, N'Mozhe', N'Atkinson', N'MATKINSO', N'650.124.6234', CAST(N'2005-10-30' AS Date), N'ST_CLERK', CAST(2800.00 AS Decimal(8, 2)), NULL, 121, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (131, N'James', N'Marlow', N'JAMRLOW', N'650.124.7234', CAST(N'2005-02-16' AS Date), N'ST_CLERK', CAST(2500.00 AS Decimal(8, 2)), NULL, 121, 50)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (149, N'Eleni', N'Zlotkey', N'EZLOTKEY', N'011.44.1344.429018', CAST(N'2008-01-29' AS Date), N'SA_MAN', CAST(10500.00 AS Decimal(8, 2)), CAST(0.20 AS Decimal(2, 2)), 100, 80)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [commission_pct], [manager_id], [department_id]) VALUES (299, N'Peter', N'Tucker', N'PTUCKER', N'011.44.1344.129268', CAST(N'2005-01-30' AS Date), N'SA_REP', CAST(10000.00 AS Decimal(8, 2)), CAST(0.30 AS Decimal(2, 2)), 149, 80)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AC_ACCOUNT', N'Public Accountant', 4200, 9000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AC_MGR', N'Accounting Manager', 8200, 16000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_ASST', N'Administration Assistant', 3000, 6000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_PRES', N'President', 20080, 40000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'AD_VP', N'Administration Vice President', 15000, 30000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'FI_ACCOUNT', N'Accountant', 4200, 9000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'FI_MGR', N'Finance Manager', 8200, 16000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'HR_REP', N'Human Resources Representative', 4000, 9000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'IT_PROG', N'Programmer', 4000, 10000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'MK_MAN', N'Marketing Manager', 9000, 15000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'MK_REP', N'Marketing Representative', 4000, 9000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PR_REP', N'Public Relations Representative', 4500, 10500)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PU_CLERK', N'Purchasing Clerk', 2500, 5500)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'PU_MAN', N'Purchasing Manager', 8000, 15000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SA_MAN', N'Sales Manager', 10000, 20080)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SA_REP', N'Sales Representative', 6000, 12008)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'SH_CLERK', N'Shipping Clerk', 2500, 5500)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'ST_CLERK', N'Stock Clerk', 2008, 5000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'ST_MAN', N'Stock Manager', 5500, 8500)
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1000, N'1297 Via Cola di Rie', N'00989', N'Roma', NULL, N'IT')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1100, N'93091 Calle della Testa', N'10934', N'Venice', NULL, N'IT')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1200, N'2017 Shinjuku-ku', N'1689', N'Tokyo', N'Tokyo Prefecture', N'JP')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1300, N'9450 Kamiya-cho', N'6823', N'Hiroshima', NULL, N'JP')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1400, N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1500, N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1600, N'2007 Zagora St', N'50090', N'South Brunswick', N'New Jersey', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1700, N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1800, N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', N'CA')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1900, N'6092 Boxwood St', N'YSW 9T2', N'Whitehorse', N'Yukon', N'CA')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2000, N'40-5-12 Laogianggen', N'190518', N'Beijing', NULL, N'CN')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2100, N'1298 Vileparle (E)', N'490231', N'Bombay', N'Maharashtra', N'IN')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2200, N'12-98 Victoria Street', N'2901', N'Sydney', N'New South Wales', N'AU')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2300, N'198 Clementi North', N'540198', N'Singapore', NULL, N'SG')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2400, N'8204 Arthur St', NULL, N'London', NULL, N'UK')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2500, N'Magdalen Centre, The Oxford Science Park', N'OX9 9ZB', N'Oxford', N'Oxford', N'UK')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2600, N'9702 Chester Road', N'09629850293', N'Stretford', N'Manchester', N'UK')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2700, N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', N'DE')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2800, N'Rua Frei Caneca 1360', N'01307-002', N'Sao Paulo', N'Sao Paulo', N'BR')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2900, N'20 Rue des Corps-Saints', N'1730', N'Geneva', N'Geneve', N'CH')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (3000, N'Murtenstrasse 921', N'3095', N'Bern', N'BE', N'CH')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (3100, N'Pieter Breughelstraat 837', N'3029SK', N'Utrecht', N'Utrecht', N'NL')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (3200, N'Mariano Escobedo 9991', N'11932', N'Mexico City', N'Distrito Federal', N'MX')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (1, N'Europe')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (2, N'Americas')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (3, N'Asia')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (4, N'Middle East and Africa')
/****** Object:  Index [idx_countries_region_id]    Script Date: 7/31/2023 10:00:17 PM ******/
CREATE NONCLUSTERED INDEX [idx_countries_region_id] ON [dbo].[countries]
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [emp_email_uk]    Script Date: 7/31/2023 10:00:17 PM ******/
ALTER TABLE [dbo].[employees] ADD  CONSTRAINT [emp_email_uk] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[countries]  WITH CHECK ADD  CONSTRAINT [countr_reg_fk] FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([region_id])
GO
ALTER TABLE [dbo].[countries] CHECK CONSTRAINT [countr_reg_fk]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD  CONSTRAINT [dept_loc_fk] FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [dept_loc_fk]
GO
ALTER TABLE [dbo].[departments]  WITH NOCHECK ADD  CONSTRAINT [dept_mgr_fk] FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [dept_mgr_fk]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [emp_dept_fk] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [emp_dept_fk]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [emp_manager_fk] FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [emp_manager_fk]
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD  CONSTRAINT [jhist_dept_fk] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[job_history] CHECK CONSTRAINT [jhist_dept_fk]
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD  CONSTRAINT [jhist_emp_fk] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[job_history] CHECK CONSTRAINT [jhist_emp_fk]
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD  CONSTRAINT [jhist_job_fk] FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
GO
ALTER TABLE [dbo].[job_history] CHECK CONSTRAINT [jhist_job_fk]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [loc_c_id_fk] FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [loc_c_id_fk]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [emp_salary_min] CHECK  (([salary]>(0)))
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [emp_salary_min]
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD  CONSTRAINT [jhist_date_interval] CHECK  (([end_date]>[start_date]))
GO
ALTER TABLE [dbo].[job_history] CHECK CONSTRAINT [jhist_date_interval]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [loc_city_nn] CHECK  (([city] IS NOT NULL))
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [loc_city_nn]
GO
USE [master]
GO
ALTER DATABASE [HR_SCHEMA] SET  READ_WRITE 
GO
