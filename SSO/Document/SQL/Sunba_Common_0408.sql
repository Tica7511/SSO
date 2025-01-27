USE [master]
GO
/****** Object:  Database [SUNBA_Common]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE DATABASE [SUNBA_Common]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SUNBA_Common', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SUNBA_Common.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SUNBA_Common_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SUNBA_Common_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SUNBA_Common].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SUNBA_Common] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SUNBA_Common] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SUNBA_Common] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SUNBA_Common] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SUNBA_Common] SET ARITHABORT OFF 
GO
ALTER DATABASE [SUNBA_Common] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SUNBA_Common] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SUNBA_Common] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SUNBA_Common] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SUNBA_Common] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SUNBA_Common] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SUNBA_Common] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SUNBA_Common] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SUNBA_Common] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SUNBA_Common] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SUNBA_Common] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SUNBA_Common] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SUNBA_Common] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SUNBA_Common] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SUNBA_Common] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SUNBA_Common] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SUNBA_Common] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SUNBA_Common] SET RECOVERY FULL 
GO
ALTER DATABASE [SUNBA_Common] SET  MULTI_USER 
GO
ALTER DATABASE [SUNBA_Common] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SUNBA_Common] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SUNBA_Common] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SUNBA_Common] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SUNBA_Common] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SUNBA_Common] SET QUERY_STORE = OFF
GO
USE [SUNBA_Common]
GO
/****** Object:  User [sso]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [sso] FOR LOGIN [sso] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Repair]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [Repair] FOR LOGIN [Repair] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PM]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [PM] FOR LOGIN [PM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Inspection]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [Inspection] FOR LOGIN [Inspection] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Efficiency]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [Efficiency] FOR LOGIN [Efficiency] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DailyRecord]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [DailyRecord] FOR LOGIN [DailyRecord] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Communication]    Script Date: 2024/4/8 上午 11:05:53 ******/
CREATE USER [Communication] FOR LOGIN [Communication] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Repair]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Repair]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Inspection]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Efficiency]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DailyRecord]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Communication]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Communication]
GO
/****** Object:  Table [dbo].[人員資料表]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[人員資料表](
	[編號] [int] IDENTITY(1,1) NOT NULL,
	[單位名稱] [nvarchar](50) NOT NULL,
	[期別] [smallint] NULL,
	[帳號] [nvarchar](10) NOT NULL,
	[密碼] [nvarchar](100) NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[修改日期] [date] NOT NULL,
	[資料狀態] [nvarchar](2) NOT NULL,
	[職稱] [nvarchar](50) NULL,
	[所屬單位] [nvarchar](50) NULL,
	[代理人] [nvarchar](50) NULL,
	[人資管理] [bit] NULL,
	[人資] [bit] NULL,
	[請採購] [bit] NULL,
	[驗收] [bit] NULL,
	[固定資產] [bit] NULL,
	[庶務] [bit] NULL,
	[承攬商] [bit] NULL,
	[請修] [bit] NULL,
	[預防保養] [bit] NULL,
	[巡檢] [bit] NULL,
	[聯絡掛卡] [bit] NULL,
	[工作日誌] [bit] NULL,
	[營運效率] [bit] NULL,
	[重設密碼] [nvarchar](100) NULL,
	[權限設定] [bit] NULL,
 CONSTRAINT [PK_人員資料表_1] PRIMARY KEY CLUSTERED 
(
	[編號] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_人員資料表2]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_人員資料表2]
AS
SELECT          dbo.人員資料表.編號, dbo.人員資料表.單位名稱, dbo.人員資料表.期別, dbo.人員資料表.帳號, dbo.人員資料表.密碼, 
                            dbo.人員資料表.姓名, dbo.人員資料表.修改日期, dbo.人員資料表.資料狀態, dbo.人員資料表.人資, 
                            dbo.人員資料表.請採購, dbo.人員資料表.驗收, dbo.人員資料表.固定資產, dbo.人員資料表.庶務, 
                            dbo.人員資料表.承攬商, dbo.人員資料表.請修, dbo.人員資料表.預防保養, dbo.人員資料表.巡檢, 
                            dbo.人員資料表.聯絡掛卡, dbo.人員資料表.工作日誌, dbo.人員資料表.營運效率, 
                            UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID, UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_NAME, 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_NAME, dbo.人員資料表.職稱, dbo.人員資料表.所屬單位, 
                            dbo.人員資料表.代理人, UOF_Training_SUNBA.dbo.TB_EB_USER.EMAIL, dbo.人員資料表.重設密碼, 
                            CASE WHEN 帳號 = 'robit' THEN 'robit62@yahoo.com.tw' ELSE [70783499].dbo.HRMS_EMPLOYEE.EMPLOYEE_EMAIL_1
                             END AS [E-MAIL], dbo.人員資料表.權限設定, UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.RANK
FROM              [70783499].dbo.HRMS_EMPLOYEE RIGHT OUTER JOIN
                            dbo.人員資料表 ON [70783499].dbo.HRMS_EMPLOYEE.EMPLOYEE_NO = dbo.人員資料表.帳號 LEFT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP RIGHT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP ON 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_ID = UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID LEFT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.TITLE_ID = UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID RIGHT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_USER ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.USER_GUID = UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID ON
                             dbo.人員資料表.帳號 = UOF_Training_SUNBA.dbo.TB_EB_USER.ACCOUNT COLLATE Chinese_Taiwan_Stroke_CI_AS
GO
/****** Object:  View [dbo].[V_人員資料表_set]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[V_人員資料表_set]
AS
SELECT          
dbo.人員資料表.編號, 
dbo.人員資料表.單位名稱, 
dbo.人員資料表.期別, 
dbo.人員資料表.帳號, 
dbo.人員資料表.密碼, 
dbo.人員資料表.姓名, 
dbo.人員資料表.修改日期, 
dbo.人員資料表.資料狀態,
人資管理 ,
dbo.人員資料表.人資, 
dbo.人員資料表.請採購, 
dbo.人員資料表.驗收, 
dbo.人員資料表.固定資產, 
dbo.人員資料表.庶務, 
dbo.人員資料表.承攬商, 
dbo.人員資料表.請修, 
dbo.人員資料表.預防保養, 
dbo.人員資料表.巡檢, 
dbo.人員資料表.聯絡掛卡, 
dbo.人員資料表.工作日誌, 
dbo.人員資料表.營運效率, 
權限設定,
                            UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID, UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_NAME, 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_NAME, dbo.人員資料表.職稱, dbo.人員資料表.所屬單位, 
                            dbo.人員資料表.代理人, UOF_Training_SUNBA.dbo.TB_EB_USER.EMAIL, dbo.人員資料表.重設密碼, 
                            CASE WHEN 帳號 = 'robit' THEN 'robit62@yahoo.com.tw' ELSE ''
                             END AS [E-MAIL]
FROM              dbo.人員資料表 LEFT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP RIGHT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP ON 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_ID = UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID LEFT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.TITLE_ID = UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID RIGHT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_USER ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.USER_GUID = UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID ON
                             dbo.人員資料表.帳號 = UOF_Training_SUNBA.dbo.TB_EB_USER.ACCOUNT COLLATE Chinese_Taiwan_Stroke_CI_AS
GO
/****** Object:  View [dbo].[v_管理階層表]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_管理階層表]
AS

--select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
--,管理LV2= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
--,管理LV3= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID 　 )   FOR XML PATH('')),1,0,''),'')
--,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  ))   FOR XML PATH('')),1,0,''),'')
--,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  )))   FOR XML PATH('')),1,0,''),'')
--,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID )  )))   FOR XML PATH('')),1,0,''),'')
--,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID) )  )))   FOR XML PATH('')),1,0,''),'')
--from  UOF_Training_SUNBA..UOF_Training_SUNBA..TB_EB_GROUP  父  
--where LEV=1


select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV3= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID 　 )   FOR XML PATH('')),1,0,''),'')
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  ))   FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  )))   FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID )  )))   FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID) )  )))   FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=1

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID  =父.GROUP_ID)　    FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID  =父.GROUP_ID    ))    FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in (  SELECT +GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID ) ))  FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in (  SELECT +GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID )) ))  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=2  --and  GROUP_ID='fb86565b-b9a8-4f1c-9041-0ab380fbd019'

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in(  SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in(  SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  ) )  FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID  in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  )) )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=3   --and  PARENT_GROUP_ID='fb86565b-b9a8-4f1c-9041-0ab380fbd019'

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'')
,管理LV6=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
,管理LV7=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in (SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID) )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=4

 

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5= ''
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID =  父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=5



union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5= ''
,管理LV6= ''
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'') 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=6 

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5=''
,管理LV6= ''
,管理LV7= ''
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=7
　
  


GO
/****** Object:  View [dbo].[V_主管]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[V_主管]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx

WHERE    RANK=8--         (UOF_Training_SUNBA..TB_EB_EMPL_DEP.TITLE_ID = N'6680ce52-4d44-4dc0-af3f-e44da48f7db7')

and isnull(EMPLOYEE_WORK_STATUS,'1')='1'
GO
/****** Object:  View [dbo].[V_副經理]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[V_副經理]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
         RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and          (　TB_EB_EMPL_DEP.TITLE_ID = N'5b1761cd-07cb-85ab-aa28-7a167eccb48f')


GO
/****** Object:  View [dbo].[V_副廠長]    Script Date: 2024/4/8 上午 11:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[V_副廠長]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and         RANK= 5  --       (　TB_EB_EMPL_DEP.TITLE_ID =N'89a8a635-811c-4132-97c5-da89bc016566')
      and  TB_EB_JOB_TITLE.TITLE_NAME='副廠長'
GO
/****** Object:  View [dbo].[V_副課長]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[V_副課長]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and           RANK=7--      (　TB_EB_EMPL_DEP.TITLE_ID =N'21c55d45-3dd6-40b3-b22e-53e6b698184b')
 
GO
/****** Object:  View [dbo].[V_副總經理]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[V_副總經理]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and                (　TB_EB_EMPL_DEP.TITLE_ID = N'dd7fd081-5bf7-a15f-38e2-17fa91f7fcc8')
 
GO
/****** Object:  View [dbo].[V_經理]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[V_經理]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and              (　TB_EB_EMPL_DEP.TITLE_ID = N'94fdfcb6-4bd1-b750-69fd-74699d2b9474')
 
GO
/****** Object:  View [dbo].[V_董事長]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




 


CREATE VIEW [dbo].[V_董事長]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and                 (　TB_EB_EMPL_DEP.TITLE_ID  =N'cf5e94cd-1007-dc80-d222-51b22633f3bb')
 
GO
/****** Object:  View [dbo].[V_廠長]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





 


CREATE VIEW [dbo].[V_廠長]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and              (　TB_EB_EMPL_DEP.TITLE_ID  = N'1204c281-7ee2-4917-9fc6-1f1fb4e6ec03')
GO
/****** Object:  View [dbo].[V_課長]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






 


CREATE VIEW [dbo].[V_課長]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and           --RANK=6         
(　TB_EB_EMPL_DEP.TITLE_ID   in( '4353ee93-83c8-4d47-86bb-7b3d7519ac67','cb5108c5-6774-9c8a-4029-a1ccef626a02'))
GO
/****** Object:  View [dbo].[V_總經理]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





 


CREATE VIEW [dbo].[V_總經理]
AS
SELECT           
         TB_EB_USER.ACCOUNT AS 員工編號, 
         TB_EB_USER.NAME AS 姓名,
		 TB_EB_EMPL_DEP.TITLE_ID, 
         TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
		 RANK,
		 TB_EB_EMPL_DEP.GROUP_ID, 
         TB_EB_GROUP.GROUP_NAME AS 部門名稱,
         管理LV2,
         管理LV3, 
         管理LV4, 
         管理LV5,
         管理LV6,
         管理LV7
FROM     UOF_Training_SUNBA..TB_EB_USER INNER JOIN UOF_Training_SUNBA..TB_EB_EMPL_DEP		ON  TB_EB_USER.USER_GUID    = TB_EB_EMPL_DEP.USER_GUID 
                    INNER JOIN UOF_Training_SUNBA..TB_EB_JOB_TITLE		ON  TB_EB_EMPL_DEP.TITLE_ID = TB_EB_JOB_TITLE.TITLE_ID 
					INNER JOIN UOF_Training_SUNBA..TB_EB_GROUP			ON  TB_EB_EMPL_DEP.GROUP_ID = TB_EB_GROUP.GROUP_ID
					LEFT OUTER JOIN　v_管理階層表	ON  TB_EB_GROUP.GROUP_ID	= v_管理階層表.GROUP_ID
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx
WHERE  isnull(EMPLOYEE_WORK_STATUS,'1')='1'
and                 (　TB_EB_EMPL_DEP.TITLE_ID  =  N'dfb99eec-4840-8697-a4d3-cdae9d2b9cc7')
GO
/****** Object:  View [dbo].[v_代理人]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_代理人]
AS
SELECT         TB_EB_USER.ACCOUNT,  TB_EB_USER_AGENT.USER_GUID, TB_EB_USER_AGENT.AGENT_USER, 
                         TB_EB_USER.NAME
FROM            UOF_Training_SUNBA..TB_EB_USER INNER JOIN
                         UOF_Training_SUNBA..TB_EB_USER_AGENT ON  TB_EB_USER.USER_GUID =  TB_EB_USER_AGENT.AGENT_USER
outer apply( select  EMPLOYEE_WORK_STATUS from  [70783499].[dbo].[vwZZ_EMPLOYEE] where EMPLOYEE_NO = TB_EB_USER.ACCOUNT  COLLATE Chinese_Taiwan_Stroke_CI_AS) xx

WHERE          ( TB_EB_USER_AGENT.ORDERS = 0)
and isnull(EMPLOYEE_WORK_STATUS,'1')='1'
GO
/****** Object:  View [dbo].[V_電子簽核資料表_old]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 


CREATE VIEW [dbo].[V_電子簽核資料表_old]
AS





SELECT      
TB_EB_USER.USER_GUID, 
TB_EB_USER.ACCOUNT AS 員工編號, 
TB_EB_USER.EMAIL AS Mail, 
TB_EB_USER.NAME AS 姓名, 
v_代理人.NAME AS 代理人, 
v_代理人.ACCOUNT AS 代理人員工編號, 
TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
TB_EB_GROUP.GROUP_NAME AS 部門名稱, 
TB_EB_GROUP.GROUP_ID

,主管=x主管.姓名
,主管員工編號=x主管.員工編號

,副課長=x副課長.姓名
,副課長員工編號=x副課長.員工編號
,課長=x課長.姓名
,課長員工編號=x課長.員工編號
,副廠長=x副廠長.姓名
,副廠長員工編號=x副廠長.員工編號

,廠長=x廠長.姓名
,廠長員工編號=x廠長.員工編號
,經理=x經理.姓名
,經理員工編號=x經理.員工編號
,副總經理=x副總經理.姓名
,副總經理員工編號=x副總經理.員工編號
,總經理=x總經理.姓名
,總經理員工編號=x總經理.員工編號
FROM     UOF_Training_SUNBA..TB_EB_JOB_TITLE RIGHT OUTER JOIN
         UOF_Training_SUNBA..TB_EB_EMPL_DEP INNER JOIN
         UOF_Training_SUNBA..TB_EB_GROUP ON  TB_EB_EMPL_DEP.GROUP_ID =  TB_EB_GROUP.GROUP_ID ON 
         UOF_Training_SUNBA..TB_EB_JOB_TITLE.TITLE_ID =  TB_EB_EMPL_DEP.TITLE_ID RIGHT OUTER JOIN
         v_代理人 RIGHT OUTER JOIN
         UOF_Training_SUNBA..TB_EB_USER ON v_代理人.USER_GUID =  TB_EB_USER.USER_GUID ON 
         UOF_Training_SUNBA..TB_EB_EMPL_DEP.USER_GUID = TB_EB_USER.USER_GUID

outer apply ( select * from [V_主管]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_主管.RANK    )　x主管
outer apply ( select * from [V_副課長]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副課長.RANK  )　x副課長
outer apply ( select * from [V_課長]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_課長.RANK    )　x課長
outer apply ( select * from [V_副廠長]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副廠長.RANK  )　x副廠長
outer apply ( select * from [V_廠長]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_廠長.RANK    )　x廠長
outer apply ( select * from [V_經理]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_經理.RANK    )　x經理
outer apply ( select * from [V_副總經理]where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副總經理.RANK)　x副總經理
outer apply ( select * from [V_總經理]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_總經理.RANK  )　x總經理





GO
/****** Object:  View [dbo].[V_電子簽核資料表]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[V_電子簽核資料表]
AS





SELECT      
TB_EB_USER.USER_GUID, 
TB_EB_USER.ACCOUNT AS 員工編號, 
TB_EB_USER.EMAIL AS Mail, 
TB_EB_USER.NAME AS 姓名, 
TB_EB_JOB_TITLE.RANK,

v_代理人.NAME AS 代理人, 
v_代理人.ACCOUNT AS 代理人員工編號, 
TB_EB_JOB_TITLE.TITLE_NAME AS 職稱,
TB_EB_GROUP.GROUP_NAME AS 部門名稱, 
TB_EB_GROUP.GROUP_ID

,主管=x主管.姓名
,主管員工編號=x主管.員工編號
,主管RANK=x主管.RANK
,副課長=x副課長.姓名
,副課長員工編號=x副課長.員工編號
,副課長RANK=x副課長.RANK
,課長=x課長.姓名
,課長員工編號=x課長.員工編號
,課長RANK=x課長.RANK

,副廠長=x副廠長.姓名
,副廠長員工編號=x副廠長.員工編號
,副廠長RANK=x副廠長.RANK

,廠長=x廠長.姓名
,廠長員工編號=x廠長.員工編號
,廠長RANK=x廠長.RANK

,經理=x經理.姓名
,經理員工編號=x經理.員工編號
,經理RANK=x經理.RANK

,副總經理=x副總經理.姓名
,副總經理員工編號=x副總經理.員工編號
,副總經理RANK=x副總經理.RANK

,總經理=x總經理.姓名
,總經理員工編號=x總經理.員工編號
,總經理RANK=x總經理.RANK
FROM     UOF_Training_SUNBA..TB_EB_JOB_TITLE RIGHT OUTER JOIN
         UOF_Training_SUNBA..TB_EB_EMPL_DEP INNER JOIN
         UOF_Training_SUNBA..TB_EB_GROUP ON  TB_EB_EMPL_DEP.GROUP_ID =  TB_EB_GROUP.GROUP_ID ON 
         UOF_Training_SUNBA..TB_EB_JOB_TITLE.TITLE_ID =  TB_EB_EMPL_DEP.TITLE_ID RIGHT OUTER JOIN
         v_代理人 RIGHT OUTER JOIN
         UOF_Training_SUNBA..TB_EB_USER ON v_代理人.USER_GUID =  TB_EB_USER.USER_GUID ON 
         UOF_Training_SUNBA..TB_EB_EMPL_DEP.USER_GUID = TB_EB_USER.USER_GUID

outer apply ( select * from [V_主管]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS /*or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  */ )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_主管.RANK    )　x主管
outer apply ( select * from [V_副課長]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  /*or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' */  )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副課長.RANK  )　x副課長
outer apply ( select * from [V_課長]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  /*or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' */  )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_課長.RANK    )　x課長
outer apply ( select * from [V_副廠長]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' /*or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' */  )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副廠長.RANK  )　x副廠長
outer apply ( select * from [V_廠長]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' /*or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' */  )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_廠長.RANK    )　x廠長
outer apply ( select * from [V_經理]　　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_經理.RANK    )　x經理
outer apply ( select * from [V_副總經理]where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_副總經理.RANK)　x副總經理
outer apply ( select * from [V_總經理]　where (GROUP_ID =TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS or　管理LV7 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV6 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'  or　管理LV5 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or　管理LV4 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%' or 管理LV3 like '%'+TB_EB_GROUP.GROUP_ID COLLATE Chinese_Taiwan_Stroke_CI_AS +'%'   )and 員工編號<>TB_EB_USER.ACCOUNT and  isnull(TB_EB_JOB_TITLE.RANK,10) > V_總經理.RANK  )　x總經理





GO
/****** Object:  Table [dbo].[dept]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dept](
	[dept_code_ref] [varchar](15) NULL,
	[dept_name] [nvarchar](20) NULL,
	[dept_code] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_員工資料]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*order by dept_code*/
CREATE VIEW [dbo].[V_員工資料]
AS
SELECT  UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID, [70783499].dbo.vwZZ_EMPLOYEE.EMPLOYEE_NO, 
                   [70783499].dbo.vwZZ_EMPLOYEE.EMPLOYEE_CNAME, 
                   [70783499].dbo.vwZZ_EMPLOYEE.EMPLOYEE_EMAIL_1 AS EMPLOYEE_WORK_STATUS, dbo.dept.dept_code, 
                   [70783499].dbo.vwZZ_EMPLOYEE.DEPARTMENT_CNAME, [70783499].dbo.vwZZ_EMPLOYEE.JOB_CODE, 
                   [70783499].dbo.vwZZ_EMPLOYEE.GRADE_CODE, [70783499].dbo.vwZZ_EMPLOYEE.GRADE_CNAME, 
                   UOF_Training_SUNBA.dbo.TB_EB_USER.PASSWORD, [70783499].dbo.vwZZ_EMPLOYEE.UPDATE_DATE, 
                   UOF_Training_SUNBA.dbo.TB_EB_USER.ACCOUNT
FROM      [70783499].dbo.vwZZ_EMPLOYEE LEFT OUTER JOIN
                   UOF_Training_SUNBA.dbo.TB_EB_USER ON 
                   [70783499].dbo.vwZZ_EMPLOYEE.EMPLOYEE_NO COLLATE Chinese_Taiwan_Stroke_CS_AS = UOF_Training_SUNBA.dbo.TB_EB_USER.ACCOUNT
                    LEFT OUTER JOIN
                   dbo.dept ON [70783499].dbo.vwZZ_EMPLOYEE.DEPARTMENT_CODE = dbo.dept.dept_code_ref
GO
/****** Object:  View [dbo].[V_人員資料表]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_人員資料表]
AS
SELECT          dbo.人員資料表.編號, dbo.人員資料表.單位名稱, dbo.人員資料表.期別, dbo.人員資料表.帳號, dbo.人員資料表.密碼, 
                            dbo.人員資料表.姓名, dbo.人員資料表.修改日期, dbo.人員資料表.資料狀態, dbo.人員資料表.人資, 
                            dbo.人員資料表.請採購, dbo.人員資料表.驗收, dbo.人員資料表.固定資產, dbo.人員資料表.庶務, 
                            dbo.人員資料表.承攬商, dbo.人員資料表.請修, dbo.人員資料表.預防保養, dbo.人員資料表.巡檢, 
                            dbo.人員資料表.聯絡掛卡, dbo.人員資料表.工作日誌, dbo.人員資料表.營運效率, dbo.V_員工資料.dept_code, 
                            dbo.V_員工資料.DEPARTMENT_CNAME, 
							EMPLOYEE_WORK_STATUS=case when dbo.人員資料表.帳號='robit' then 'robit62@gmail.com' 
							     else dbo.V_員工資料.EMPLOYEE_WORK_STATUS
							end
FROM              dbo.V_員工資料 RIGHT OUTER JOIN
                            dbo.人員資料表 ON dbo.V_員工資料.EMPLOYEE_NO = dbo.人員資料表.帳號

GO
/****** Object:  Table [dbo].[人員資料表_測試]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[人員資料表_測試](
	[編號] [int] NOT NULL,
	[單位名稱] [nvarchar](50) NOT NULL,
	[期別] [smallint] NULL,
	[帳號] [nvarchar](10) NOT NULL,
	[密碼] [nvarchar](100) NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[修改日期] [date] NOT NULL,
	[資料狀態] [nvarchar](2) NOT NULL,
	[職稱] [nvarchar](50) NULL,
	[所屬單位] [nvarchar](50) NULL,
	[代理人] [nvarchar](50) NULL,
	[人資管理] [bit] NULL,
	[人資] [bit] NULL,
	[請採購] [bit] NULL,
	[驗收] [bit] NULL,
	[固定資產] [bit] NULL,
	[庶務] [bit] NULL,
	[承攬商] [bit] NULL,
	[請修] [bit] NULL,
	[預防保養] [bit] NULL,
	[巡檢] [bit] NULL,
	[聯絡掛卡] [bit] NULL,
	[工作日誌] [bit] NULL,
	[營運效率] [bit] NULL,
	[重設密碼] [nvarchar](100) NULL,
	[權限設定] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_人員資料表_測試]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_人員資料表_測試]
AS
SELECT          dbo.人員資料表_測試.編號, dbo.人員資料表_測試.單位名稱, dbo.人員資料表_測試.期別, dbo.人員資料表_測試.帳號, 
                            dbo.人員資料表_測試.密碼, dbo.人員資料表_測試.姓名, dbo.人員資料表_測試.修改日期, 
                            dbo.人員資料表_測試.資料狀態, dbo.人員資料表_測試.人資, dbo.人員資料表_測試.請採購, 
                            dbo.人員資料表_測試.驗收, dbo.人員資料表_測試.固定資產, dbo.人員資料表_測試.庶務, 
                            dbo.人員資料表_測試.承攬商, dbo.人員資料表_測試.請修, dbo.人員資料表_測試.預防保養, 
                            dbo.人員資料表_測試.巡檢, dbo.人員資料表_測試.聯絡掛卡, dbo.人員資料表_測試.工作日誌, 
                            dbo.人員資料表_測試.營運效率, UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID, 
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_NAME, 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID, 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_NAME, dbo.人員資料表_測試.職稱, 
                            dbo.人員資料表_測試.所屬單位, dbo.人員資料表_測試.代理人, UOF_Training_SUNBA.dbo.TB_EB_USER.EMAIL, 
                            dbo.人員資料表_測試.重設密碼, 
                            CASE WHEN 帳號 = 'robit' THEN 'robit62@yahoo.com.tw' ELSE [70783499].dbo.HRMS_EMPLOYEE.EMPLOYEE_EMAIL_1
                             END AS [E-MAIL], dbo.人員資料表_測試.權限設定, UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.RANK
FROM              [70783499].dbo.HRMS_EMPLOYEE RIGHT OUTER JOIN
                            dbo.人員資料表_測試 ON 
                            [70783499].dbo.HRMS_EMPLOYEE.EMPLOYEE_NO = dbo.人員資料表_測試.帳號 LEFT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP RIGHT OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP ON 
                            UOF_Training_SUNBA.dbo.TB_EB_GROUP.GROUP_ID = UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.GROUP_ID LEFT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.TITLE_ID = UOF_Training_SUNBA.dbo.TB_EB_JOB_TITLE.TITLE_ID RIGHT
                             OUTER JOIN
                            UOF_Training_SUNBA.dbo.TB_EB_USER ON 
                            UOF_Training_SUNBA.dbo.TB_EB_EMPL_DEP.USER_GUID = UOF_Training_SUNBA.dbo.TB_EB_USER.USER_GUID ON
                             dbo.人員資料表_測試.帳號 = UOF_Training_SUNBA.dbo.TB_EB_USER.ACCOUNT COLLATE Chinese_Taiwan_Stroke_CI_AS
GO
/****** Object:  View [dbo].[v_組織表]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 


CREATE VIEW [dbo].[v_組織表]
AS





select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=2 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=1 
union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=3 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=2 
union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN  ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=4 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=3
union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN  ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=5 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=4 
union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN  ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=6 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=5

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN  ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=7 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=6


union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV, 兒子.下階代碼, 兒子.下階單位名稱 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  LEFT OUTER JOIN  ( SELECT 下階代碼=GROUP_ID, 下階單位名稱=GROUP_NAME ,  PARENT_GROUP_ID ,階層=8 FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=8) 兒子
ON 兒子.PARENT_GROUP_ID =父.GROUP_ID WHERE  LEV=7
GO
/****** Object:  View [dbo].[V_組織架構]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_組織架構]
AS
SELECT          GROUP_ID AS dept_code, GROUP_NAME AS dept_name
FROM              UOF_Training_SUNBA.dbo.TB_EB_GROUP
GO
/****** Object:  View [dbo].[v_管理階層表_old]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_管理階層表_old]
AS

select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV3= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID 　 )   FOR XML PATH('')),1,0,''),'')
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  ))   FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID  )))   FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID )  )))   FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in(  SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=2 and PARENT_GROUP_ID =父.GROUP_ID) )  )))   FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=1

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID  =父.GROUP_ID)　    FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID  =父.GROUP_ID    ))    FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in (  SELECT +GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID ) ))  FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in (  SELECT +GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=3 and PARENT_GROUP_ID =父.GROUP_ID )) ))  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=2  --and  GROUP_ID='fb86565b-b9a8-4f1c-9041-0ab380fbd019'

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  FOR XML PATH('')),1,0,''),'')
,管理LV5= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in(  SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in(  SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  ) )  FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID  in( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=4 and PARENT_GROUP_ID =父.GROUP_ID  )) )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=3   --and  PARENT_GROUP_ID='fb86565b-b9a8-4f1c-9041-0ab380fbd019'

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'')
,管理LV6=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
,管理LV7=isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID in (SELECT  GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=5 and PARENT_GROUP_ID =  父.GROUP_ID) )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=4

 

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5= ''
,管理LV6= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'')
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID in ( SELECT GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=6 and PARENT_GROUP_ID =  父.GROUP_ID )  FOR XML PATH('')),1,0,''),'')
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=5



union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5= ''
,管理LV6= ''
,管理LV7= isnull(stuff((SELECT ','+GROUP_ID  FROM UOF_Training_SUNBA..TB_EB_GROUP  where LEV=7 and PARENT_GROUP_ID =  父.GROUP_ID FOR XML PATH('')),1,0,''),'') 
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=6 

union all
select GROUP_ID ,單位名稱=GROUP_NAME,LEV,PARENT_GROUP_ID
,管理LV2=''
,管理LV3='' 
,管理LV4=''
,管理LV5=''
,管理LV6= ''
,管理LV7= ''
from  UOF_Training_SUNBA..TB_EB_GROUP  父  
where LEV=7
　
 


GO
/****** Object:  Table [dbo].[ADM_RoleList]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_RoleList](
	[rol_UID] [varchar](2) NOT NULL,
	[rol_Description] [nvarchar](50) NULL,
	[rol_SortOrder] [int] NOT NULL,
	[rol_Active] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorizations]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorizations](
	[帳號] [nchar](50) NULL,
	[程式編號] [int] NULL,
	[是否可見程式選單] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Block]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Block](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name1] [nvarchar](100) NULL,
	[name2] [nvarchar](100) NULL,
	[name3] [nvarchar](100) NULL,
	[name4] [nvarchar](100) NULL,
	[name5] [nvarchar](100) NULL,
	[name6] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[depcod]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depcod](
	[org_id] [varchar](2) NULL,
	[dep_id] [varchar](5) NULL,
	[dep_name] [nvarchar](50) NULL,
	[dep_all_id] [varchar](7) NULL,
	[dep_up_all_id] [varchar](7) NULL,
	[dep_manager] [varchar](15) NULL,
	[dep_Level] [varchar](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mail_log]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mail_log](
	[mid] [bigint] IDENTITY(1,1) NOT NULL,
	[mail_sql] [nvarchar](max) NOT NULL,
	[mail_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[模組編號] [int] IDENTITY(1,1) NOT NULL,
	[模組名稱] [nvarchar](200) NULL,
	[模組說明] [nvarchar](500) NULL,
	[是否啟用] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules_ADM]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules_ADM](
	[adm_id] [int] IDENTITY(1,1) NOT NULL,
	[模組編號] [int] NULL,
	[adm_empno] [varchar](7) NULL,
	[adm_orgcd] [varchar](7) NULL,
	[adm_role_id] [varchar](2) NULL,
	[adm_deptcd] [varchar](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orgcod]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orgcod](
	[org_id] [varchar](2) NULL,
	[org_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programs]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programs](
	[程式編號] [int] IDENTITY(1,1) NOT NULL,
	[程式名稱] [nvarchar](200) NULL,
	[程式URL] [nvarchar](1000) NULL,
	[所屬模組編號] [int] NULL,
	[是否啟用] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[帳號] [nvarchar](50) NOT NULL,
	[密碼] [nvarchar](256) NULL,
	[是否啟用] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[天氣]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[天氣](
	[Id] [int] NOT NULL,
	[天氣狀況] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[組織表]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[組織表](
	[dept_code_ref] [nvarchar](50) NULL,
	[dept_name] [nvarchar](20) NULL,
	[dept_code] [varchar](15) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'03', N'系統負責人', 1, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'05', N'業務負責人', 2, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'07', N'高階主管', 3, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'08', N'高階幕僚', 4, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'10', N'單位主管', 5, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'20', N'單位主管幕僚', 6, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'12', N'單位一級主管', 7, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'14', N'單位二級主管', 9, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'24', N'單位二級幕僚', 10, N'1')
INSERT [dbo].[ADM_RoleList] ([rol_UID], [rol_Description], [rol_SortOrder], [rol_Active]) VALUES (N'22', N'單位一級主管幕僚', 11, N'1')
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (1, N'BOP')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (2, N'NGC')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (3, N'計量站')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (4, N'ACC')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (5, N'HRSG')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (6, N'GT')
INSERT [dbo].[Area] ([Id], [AreaName]) VALUES (7, N'ST')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Block] ON 

INSERT [dbo].[Block] ([Id], [name1], [name2], [name3], [name4], [name5], [name6]) VALUES (1, N'Block1', N'BLK-1', N'FD#1', N'CC#1', N'一號機', NULL)
INSERT [dbo].[Block] ([Id], [name1], [name2], [name3], [name4], [name5], [name6]) VALUES (2, N'Block2', N'BLK-2', N'FD#2', N'CC#2', N'二號機', NULL)
INSERT [dbo].[Block] ([Id], [name1], [name2], [name3], [name4], [name5], [name6]) VALUES (3, N'Block3', N'BLK-3', N'FD#3', N'CC#3', N'三號機', NULL)
INSERT [dbo].[Block] ([Id], [name1], [name2], [name3], [name4], [name5], [name6]) VALUES (4, N'Block4', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Block] OFF
GO
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0A000', N'總經理室', N'010A000', NULL, NULL, N'1')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0B000', N'行政管理部', N'010B000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0C000', N'技術部', N'010C000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0D000', N'承攬商', N'010D000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0E000', N'秘書室', N'010E000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0F000', N'財務部', N'010F000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0G000', N'工安課', N'010G000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0H000', N'管理課', N'010H000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J000', N'運轉課', N'010J000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0K000', N'維修課', N'010K000', N'010A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0F100', N'財務1部', N'010F100', N'010F000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0F200', N'財務2部', N'010F200', N'010F000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J100', N'運轉課A', N'010J100', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J200', N'運轉課B', N'010J200', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J300', N'運轉課C', N'010J300', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J400', N'運轉課D', N'010J400', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J500', N'運轉課E', N'010J500', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J600', N'運轉課-水處理', N'010J600', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J700', N'運轉課-效率', N'010J700', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0J800', N'運轉課-環保', N'010J800', N'010J000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0K100', N'維修課(電氣組)', N'010K100', N'010K000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0K200', N'維修課(儀控組)', N'010K200', N'010K000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0K300', N'維修課(機械組GT)', N'010K300', N'010K000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'01', N'0K400', N'維修課(機械組ST)', N'010K400', N'010K000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'21', N'0A000', N'第一事業部', N'210A000', NULL, NULL, N'1')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'21', N'0B000', N'研發部', N'210B000', N'210A000', NULL, N'2')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'21', N'0B100', N'研發一部', N'210B100', N'210B000', NULL, N'3')
INSERT [dbo].[depcod] ([org_id], [dep_id], [dep_name], [dep_all_id], [dep_up_all_id], [dep_manager], [dep_Level]) VALUES (N'21', N'0B200', N'研發二部', N'210B200', N'210B000', NULL, N'3')
GO
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA009', N'廠務室', N'090A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA001', N'董事長', N'0100000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA002', N'稽核室', N'010B000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA003', N'總經理', N'010A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA004', N'副總經理', N'010A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA005', N'行政管理部-經理', N'050A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA005-01', N'行政管部', N'050A100')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA006', N'財務部-經理', N'060A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA006-01', N'財務部', N'060A100')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA006-02', N'財務2部', N'060A200')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA007', N'豐德電廠', N'070A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA007-01', N'副廠長', N'070A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA008', N'技術', N'080A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA008-01', N'技術部', N'080A100')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA008-02', N'專案部', N'080A200')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA010', N'企劃部', N'100A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA011', N'顧問室', N'110A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012', N'運轉課-課長', N'120A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-01', N'運轉課-副課長', N'120A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-02', N'運轉課-效率', N'120C000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-03', N'運轉課-環保', N'120D000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-04', N'運轉課-水處理', N'120E000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-05', N'運轉課A', N'120F000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-06', N'運轉課B', N'120G000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-07', N'運轉課C', N'120H000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-08', N'運轉課D', N'120J000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA012-09', N'運轉課E', N'120K000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013', N'維修課-課長', N'130A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013-01', N'維修課-副課長', N'130A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013-02', N'維修課-電氣組', N'130C000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013-03', N'維修課-儀控組', N'130D000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013-04', N'維修課-機械組GT', N'130E000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA013-05', N'維修課-機械組ST', N'130F000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA014', N'管理課-課長', N'140A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA014-01', N'管理課-副課長', N'140A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA014-02', N'SB管理課', N'140B000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA015', N'工安課-課長', N'150A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA015-01', N'工安課-副課長', N'150A000')
INSERT [dbo].[dept] ([dept_code_ref], [dept_name], [dept_code]) VALUES (N'AA015-02', N'工安課', N'150A100')
GO
SET IDENTITY_INSERT [dbo].[mail_log] ON 

INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (1, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =密碼重設通知 ,@body =蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! ***** ,@body_format =''HTML''', NULL)
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (2, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:10:09.203' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (3, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:17:21.427' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (4, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:28:58.307' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (5, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62@yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="http://www.abc.com?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">http://www.abc.com?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:38:16.367' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (6, N'exec sp_GetUserGuid @email = ''robit62＠yahoo.com.tw'' ,@url =''https://powersunba.com.tw/sso/reset.aspx'' ', CAST(N'2023-12-26T17:41:56.167' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (7, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:41:56.180' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (8, N'exec sp_GetUserGuid @email = ''robit62＠yahoo.com.tw'' ,@url =''https://powersunba.com.tw/sso/reset.aspx'' ', CAST(N'2023-12-26T17:43:14.370' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (10, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62@yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''林家萱 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=&uid=C337">https://powersunba.com.tw/sso/reset.aspx?guid=&uid=C337</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T20:11:14.603' AS DateTime))
INSERT [dbo].[mail_log] ([mid], [mail_sql], [mail_time]) VALUES (9, N'exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'',@recipients = robit62＠yahoo.com.tw ,@subject =''密碼重設通知'' ,@body =''蕭俊雄 您好:<br><br>請點擊以下連結重設密碼<br><a href="https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit">https://powersunba.com.tw/sso/reset.aspx?guid=0544358d-3dcd-4cda-b499-c9bc0bf6bc95&uid=robit</a><br><br>***** 信件系統寄出，請勿直接回覆! *****'' ,@body_format =''HTML''', CAST(N'2023-12-26T17:43:14.383' AS DateTime))
SET IDENTITY_INSERT [dbo].[mail_log] OFF
GO
SET IDENTITY_INSERT [dbo].[Modules] ON 

INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (1, N'warehousing', N'倉庫相關(含入庫領料等)', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (2, N'purchasing', N'請採購', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (3, N'maintain', N'維護保養', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (4, N'repair', N'請修銷單', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (5, N'inspection', N'巡檢', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (6, N'asset', N'固資', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (7, N'accepting', N'驗收', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (8, N'affairs', N'庶務', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (9, N'communication', N'工作聯絡', 1)
INSERT [dbo].[Modules] ([模組編號], [模組名稱], [模組說明], [是否啟用]) VALUES (10, N'journal', N'工作日誌', 1)
SET IDENTITY_INSERT [dbo].[Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[Modules_ADM] ON 

INSERT [dbo].[Modules_ADM] ([adm_id], [模組編號], [adm_empno], [adm_orgcd], [adm_role_id], [adm_deptcd]) VALUES (1, 1, N'A10011', N'01', N'05', N'01')
INSERT [dbo].[Modules_ADM] ([adm_id], [模組編號], [adm_empno], [adm_orgcd], [adm_role_id], [adm_deptcd]) VALUES (2, 1, N'A10011', N'02', N'05', N'02')
SET IDENTITY_INSERT [dbo].[Modules_ADM] OFF
GO
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'01', N'高階')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'05', N'行政')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'06', N'財務')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'07', N'電廠')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'08', N'技術')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'09', N'廠務')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'10', N'企劃')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'11', N'顧問')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'12', N'運轉')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'13', N'維修')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'14', N'管理')
INSERT [dbo].[orgcod] ([org_id], [org_name]) VALUES (N'15', N'工安')
GO
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'warehousing', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'purchasing', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'maintain', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'repair', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'inspection', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'accepting', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'affairs', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'communication', NULL, 1)
INSERT [dbo].[Users] ([帳號], [密碼], [是否啟用]) VALUES (N'journal', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[人員資料表] ON 

INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (3, N'森霸', 1, N'E758', N'E758', N'何建信', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (4, N'森霸', 1, N'E962', N'E962', N'陳志哲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'eVo57iJYfU/xnnklNj5sRg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (5, N'森霸', 1, N'E286', N'E286', N'林金梅', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'IITJS9AKIPvJClfM0l3Exw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (6, N'森霸', 1, N'E255', N'E255', N'蕭嘉裕', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'4YOGfL5K6GGEH3kEdZDphw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (7, N'森霸', 1, N'E165', N'E165', N'吳榮仁', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'eQUHhOfbhcLoERCwU6NhbA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (8, N'森霸', 1, N'E148', N'E148', N'尤美蓮', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'X7psvI5oMS6uWd0zBjLqkw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (9, N'森霸', 1, N'E956', N'E956', N'周芩伃', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (10, N'森霸', 1, N'E067', N'E067', N'林勇政', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (11, N'森霸', 1, N'E948', N'E9481', N'黃璿晞', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'K8jNKNBHySVUVFY69zRHVg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (12, N'森霸', 1, N'E924', N'E924', N'溫富發', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'irinNzEYcKGSk23t6zYorw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (13, N'森霸', 1, N'E945', N'E9451', N'鄭銘芳', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'sd2WnIlQ8CxQeWbxn7xYUw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (14, N'森霸', 1, N'C583', N'C583', N'蔡國順', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'liFf71EbMeofR/lkLjSupA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (15, N'森霸', 1, N'E1005', N'E1005', N'廖欽驊', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'QR0zQtQUpIMKIlNje5ereA==', 1)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (16, N'森霸', 1, N'E895', N'E895', N'劉東宜', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'QN5MuMXHmrFGUstupzytJQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (17, N'森霸', 1, N'E1003', N'E1003', N'林志豪', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'f777eMrFByaWkGcAlmax5w==', 1)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (18, N'森霸', 1, N'E1004', N'E1004', N'吳蕙如', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'8g9Teaz/UHsDXr3bzJ3ypA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (19, N'森霸', 1, N'E955', N'E955', N'何沛軒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'wu/CIRAPakJPFDYhIr4h9g==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (20, N'森霸', 1, N'E1007', N'E1007', N'周雨蓓', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (21, N'森霸', 1, N'C572', N'C572', N'林岳昇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (22, N'森霸', 1, N'C581', N'C581', N'曾信斌', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'ilY6K7Y2n78NV7POcERfNg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (23, N'森霸', 1, N'C625', N'C625', N'賴振興', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'QNaFBZqztuJH0Ttut4G7jg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (24, N'森霸', 1, N'C717', N'C717', N'歐皖麟', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'5bV1cOuVt6DHfVnjj1i07g==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (25, N'森霸', 1, N'C718', N'C718', N'王瑞全', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (26, N'森霸', 1, N'E1010', N'E1010', N'何俊穎', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (27, N'森霸', 1, N'E320-02', N'E320-02', N'許智傑', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'a3JJa9ymoV87jbGnIKqJuA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (28, N'森霸', 1, N'E615', N'E615', N'邱凡純', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (29, N'森霸', 1, N'E600', N'E600', N'王鈞儀', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'UsEM85ZFxjoM1Jyf4XgbPw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (30, N'森霸', 1, N'E703', N'E703', N'曾姿綺', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'bEfWEwldC9ZcPQt/RESiIQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (31, N'森霸', 1, N'E314', N'E314', N'宋羽芑', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'KQsrOCC3kG0Zq6m6k4vHLw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (32, N'森霸', 1, N'E535', N'E535', N'張韻華', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'qOqidlRfa4kdb8mkZ0Okyw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (33, N'森霸', 1, N'E1006', N'E1006', N'劉達融', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (34, N'森霸', 1, N'E321', N'E321', N'劉育辰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (35, N'森霸', 1, N'E338', N'E338', N'曾正旻', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'CbgXVotdhCvSk7KDTfZ3Fg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (36, N'森霸', 1, N'E182', N'E182', N'吳銀豐', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'DOvazujESJ7zqGOX1asT5A==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (37, N'森霸', 1, N'E1031', N'E1031', N'呂吉祥', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (38, N'森霸', 1, N'E542', N'E542', N'顏明德', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (39, N'森霸', 1, N'E504', N'E504', N'蘇威羽', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (40, N'森霸', 1, N'E341', N'E341', N'黃世杰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (41, N'森霸', 1, N'E540', N'E540', N'洪閔強', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (42, N'森霸', 1, N'E710', N'E710', N'張繼育', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (43, N'森霸', 1, N'E784', N'E784', N'陳信貿', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (44, N'森霸', 1, N'E516', N'E516', N'田育安', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (45, N'森霸', 1, N'E1000', N'E1000', N'陸鈞竣', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (46, N'森霸', 1, N'E543', N'E543', N'楊家銘', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'SuyWBylfxiMo0qN7nKIbmg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (47, N'森霸', 1, N'E942', N'E942', N'凃欽閔', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (48, N'森霸', 1, N'E343', N'E343', N'王忠輝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (49, N'森霸', 1, N'E1055', N'E1055', N'馮馳恩', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (50, N'森霸', 1, N'E1024', N'E1024', N'黃建瑋', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'UTkz/6TqIVwC09kjAcgpjA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (51, N'森霸', 1, N'E337', N'E337', N'朱聰輝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (52, N'森霸', 1, N'E808', N'E808', N'賴冠忠', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (53, N'森霸', 1, N'E776', N'E776', N'鄭耿彬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (54, N'森霸', 1, N'E339', N'E339', N'黃榮彬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'KmS5ftUzUyXX5tFeqgDMYw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (55, N'森霸', 1, N'E461', N'E461', N'張展臺', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (56, N'森霸', 1, N'E656', N'E656', N'吳宗憲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (57, N'森霸', 1, N'E708', N'E708', N'李軒毅', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (58, N'森霸', 1, N'E350', N'E350', N'林南安', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (59, N'森霸', 1, N'E939', N'E939', N'陳智謙', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (60, N'森霸', 1, N'E772', N'E772', N'劉士敬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'HFUDAYUs082hPbyrF4ux2w==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (61, N'森霸', 1, N'E347', N'E347', N'蔡裕昌', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (62, N'森霸', 1, N'E1026', N'E1026', N'吳立全', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'fY8uQtUdiv6GMxaP/Bp9jg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (63, N'森霸', 1, N'E1058', N'E1058', N'張煜昇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (64, N'森霸', 1, N'E1059', N'E1059', N'楊曜禎', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (65, N'森霸', 1, N'E1060', N'E1060', N'薛丞恩', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (66, N'森霸', 1, N'E351', N'E351', N'楊謦瑄', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'twcYT5HHsfpq/WyG23zdzQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (67, N'森霸', 1, N'E999', N'E999', N'鄭宇勝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (68, N'森霸', 1, N'E783', N'E783', N'林裕庭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'M2aMBLE/0D0gUGiwfWryJw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (69, N'森霸', 1, N'E431', N'E431', N'陳俊維', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (70, N'森霸', 1, N'E894', N'E894', N'許書維', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (71, N'森霸', 1, N'E183', N'E183', N'饒志中', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (72, N'森霸', 1, N'E342', N'E342', N'周宏謀', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (73, N'森霸', 1, N'E780', N'E780', N'盧銘聰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'mZOP1eXRIhbjIgeUy94N/A==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (74, N'森霸', 1, N'E1025', N'E1025', N'楊雅富', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (75, N'森霸', 1, N'E398', N'E398', N'李裕仁', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (76, N'森霸', 1, N'E333', N'E333', N'凃瓊月', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (77, N'森霸', 1, N'E548', N'E548', N'陳禹彰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, NULL, N'WbOcopoiAeK2u2vsoiFEhA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (78, N'森霸', 1, N'E395', N'E395', N'劉奕其', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (79, N'森霸', 1, N'E325', N'E325', N'潘千裡', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (80, N'森霸', 1, N'E811', N'E811', N'鄭琪玉', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (81, N'森霸', 1, N'E508', N'E508', N'沈雅琦', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'98tH8esphh3jrsXDU6v2lQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (82, N'森霸', 1, N'E941', N'E941', N'吳俊龍', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (83, N'森霸', 1, N'E1002', N'E1002', N'王柏為', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (84, N'森霸', 1, N'E352', N'E352', N'郭宗文', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (85, N'森霸', 1, N'E596', N'E596', N'陳依妡', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'tMzosfICtiCaqajpFizgag==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (86, N'森霸', 1, N'E568', N'E568', N'洪志民', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (87, N'森霸', 1, N'E844', N'E844', N'翁雅筠', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'n3X6oxDC4rg7TVZ4eaAmTw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (88, N'森霸', 1, N'E329', N'E329', N'許雅婷', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'0upMEl/CATO3gu0bRP/3ww==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (89, N'森霸', 1, N'E639', N'E639', N'葉品尚', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'R2ggCt0NzilvzfyMty2Jhg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (90, N'森霸', 1, N'E256', N'E256', N'劉煜堂', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (91, N'森霸', 1, N'E612', N'E612', N'蘇暉淵', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (92, N'森霸', 1, N'E785', N'E785', N'張高軒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (93, N'森霸', 1, N'E995', N'E995', N'洪秉賢', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (94, N'森霸', 1, N'E287', N'E287', N'陳昌儒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (95, N'森霸', 1, N'E529', N'E529', N'林建欽', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'fDBeE3nPSxc6XRlusG9Npg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (96, N'森霸', 1, N'E623', N'E623', N'蔡定宇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'nMxCyBMz1bodzC8TLjdaGQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (97, N'森霸', 1, N'E774', N'E774', N'王新益', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'1Q4w3Qi7R/kmJ1IuJVAIkw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (98, N'森霸', 1, N'E348', N'E348', N'楊雨秦', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (99, N'森霸', 1, N'E427', N'E427', N'許金裕', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'e89sSuuh1VYODopcc5Qb9A==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (100, N'森霸', 1, N'E503', N'E503', N'楊昆桐', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (101, N'森霸', 1, N'E751', N'E751', N'陳彥諭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (102, N'森霸', 1, N'E541', N'E541', N'馬耀方', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'8eIhREdrnBLNHDagGtVotw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (103, N'森霸', 1, N'E624', N'E624', N'姚君憲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'BQRxkLwhS4zVRTf4PgXtSA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (104, N'森霸', 1, N'E359', N'E359', N'楊欽文', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (105, N'森霸', 1, N'E1057', N'E1057', N'賴易生', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (106, N'森霸', 1, N'E1054', N'E1054', N'吳建璿', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (107, N'森霸', 1, N'E360', N'E360', N'張耿華', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'VpzzNxl12Uoav/16h2cUwg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (108, N'森霸', 1, N'E773', N'E773', N'許子謙', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (109, N'森霸', 1, N'E1001', N'E1001', N'李書丞', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (110, N'森霸', 1, N'E346', N'E346', N'吳爭育', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (111, N'森霸', 1, N'E349', N'E349', N'蘇建旭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'S5AnOyOgmQLIhkmTwWlVEg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (112, N'森霸', 1, N'E345', N'E345', N'楊明德', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (113, N'森霸', 1, N'E259', N'E259', N'陳福成', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (114, N'森霸', 1, N'E246', N'E246', N'王世先', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (115, N'森霸', 1, N'E547', N'E547', N'田居正', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'ulPgIuvc0mlV9CxG0kkFnw==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (116, N'森霸', 1, N'E230', N'E230', N'林萬寶', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'Y96GEPF1jhqLnSQAc323HQ==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (117, N'森霸', 1, N'E262', N'E262', N'邱勝利', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (118, N'森霸', 1, N'E335', N'E335', N'周傳貴', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, 1, 1, NULL, N'0cyMxcve2N/uBiZVh/AFYA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (120, N'工研院', 1, N'robit', N'robit', N'蕭俊雄', CAST(N'2023-12-07' AS Date), N'A', N'True', N'True', N'True', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'', 1)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (127, N'森霸', 1, N'TZ03', N'TZ03', N'張世儀', CAST(N'2023-12-18' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'dhoAgRJ6hYQ/xEoNyQZjBg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (128, N'工研院', 1, N'laputa', N'laputa', N'賴斐瓔', CAST(N'2023-12-22' AS Date), N'A', N'True', N'True', N'True', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'7G/a9A9yjFfq4JPiOxf2kQ==', 1)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (129, N'森霸', 1, N'E1083', N'E1083', N'廖俊傑', CAST(N'2023-12-25' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (187, N'森霸', 1, N'E1091', N'E1091', N'林品睿', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (188, N'森霸', 1, N'E324', N'E324', N'薛兆明', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (189, N'森霸', 1, N'E327', N'E327', N'郭武林', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (190, N'森霸', 1, N'E239', N'E239', N'楊明堂', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (191, N'森霸', 1, N'E244', N'E244', N'曾宇正', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (192, N'森霸', 1, N'C578', N'C578', N'高詩晴', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (193, N'森霸', 1, N'E354', N'E354', N'郜祖恩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (194, N'森霸', 1, N'E809', N'E809', N'沈緯翔', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (195, N'森霸', 1, N'E070-02', N'E070-02', N'高佰文', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (196, N'森霸', 1, N'E678', N'E678', N'羅春龍', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (197, N'森霸', 1, N'E334', N'E334', N'溫永彰', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (198, N'森霸', 1, N'TZ02', N'TZ02', N'蔡小梅', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (199, N'森霸', 1, N'A027', N'A027', N'薛人豪', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (200, N'森霸', 1, N'C607', N'C607', N'李崇賓', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (201, N'森霸', 1, N'E737', N'E737', N'趙恩浩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (202, N'森霸', 1, N'C631', N'C631', N'劉少勇', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (203, N'森霸', 1, N'E661', N'E661', N'林永哲', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (204, N'森霸', 1, N'C337', N'C337', N'林家萱', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (205, N'森霸', 1, N'A003', N'A003', N'黃傳先', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (206, N'森霸', 1, N'C540', N'C540', N'黃政恭', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (207, N'森霸', 1, N'E358', N'E358', N'曾允守', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (208, N'森霸', 1, N'C575', N'C575', N'陳慰慈', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (209, N'森霸', 1, N'E330', N'E330', N'林雪蓮', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (210, N'森霸', 1, N'C346', N'C346', N'陳思明', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (211, N'森霸', 1, N'C537', N'C537', N'洪福洋', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (212, N'森霸', 1, N'E812', N'E812', N'陳彥宇', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (213, N'森霸', 1, N'E759', N'E759', N'翁偉智', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (214, N'森霸', 1, N'E288', N'E288', N'馬建華', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (215, N'森霸', 1, N'E744', N'E744', N'郭仲焜', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (216, N'森霸', 1, N'E238', N'E238', N'江志偉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (217, N'森霸', 1, N'E1071', N'E1071', N'陳茂榕', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (218, N'森霸', 1, N'E810', N'E810', N'蔡承勳', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (219, N'森霸', 1, N'E851', N'E851', N'呂麒寶', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (220, N'森霸', 1, N'E896', N'E896', N'呂沐恩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (221, N'森霸', 1, N'E958', N'E958', N'余忞學', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (222, N'森霸', 1, N'E1061', N'E1061', N'朱勇吉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (223, N'森霸', 1, N'E1065', N'E1065', N'李亭瑩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, N'uvcOLnIFTvC7ssPG9A5Hgg==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (224, N'森霸', 1, N'E344', N'E344', N'林信成', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (225, N'森霸', 1, N'E1070', N'E1070', N'曾致緯', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (226, N'森霸', 1, N'E778', N'E778', N'林家萱', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (227, N'森霸', 1, N'E1078', N'E1078', N'黃御麒', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (228, N'森霸', 1, N'E1079', N'E1079', N'鄭馭升', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (229, N'森霸', 1, N'E1080', N'E1080', N'黃憲民', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (230, N'森霸', 1, N'E332', N'E332', N'王頂標', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (231, N'森霸', 1, N'E1084', N'E1084', N'莊庚珉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (232, N'森霸', 1, N'E1090', N'E1090', N'林孟儒', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (233, N'森霸', 1, N'E1069', N'E1069', N'呂忠穎', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (234, N'森霸', 1, N'E679', N'E679', N'張季平', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (235, N'森霸', 1, N'E688', N'E688', N'蕭正佑', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (236, N'森霸', 1, N'E336', N'E336', N'劉國忠', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (237, N'森霸', 1, N'E687', N'E687', N'黃偉倫', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (238, N'森霸', 1, N'E716', N'E716', N'黃致寧', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (239, N'森霸', 1, N'C325', N'C325', N'李明庭', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (240, N'森霸', 1, N'E777', N'E777', N'黃俊銘', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (241, N'森霸', 1, N'A023', N'A023', N'李明昆', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (242, N'森霸', 1, N'E794', N'E794', N'洪筱淳', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (243, N'森霸', 1, N'E840', N'E840', N'林維則', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (245, N'森霸', 1, N'E1096', N'E1096', N'陳護仁', CAST(N'2024-03-11' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (249, N'森霸', 1, N'E1097', N'E1097', N'黃瑋輯', CAST(N'2024-03-11' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, N'9vVuUwZSBIWjWE62SBeeiA==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (250, N'森霸', 1, N'E1099', N'E1099', N'李翰彥', CAST(N'2024-03-18' AS Date), N'A', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'OazZiV4KGGqapT1hSOr46w==', NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (251, N'森霸', 1, N'Z001', N'Z001', N'郝友前', CAST(N'2024-03-25' AS Date), N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[人員資料表] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (252, N'森霸', 1, N'Z002', N'Z002', N'甄幸福', CAST(N'2024-03-26' AS Date), N'A', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[人員資料表] OFF
GO
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (1, N'台汽電', NULL, N'E215', N'E215', N'歐怡良', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (2, N'台汽電', NULL, N'E1009', N'E1009', N'吳品萱', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (3, N'森霸', 1, N'E758', N'E758', N'何建信', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (4, N'森霸', 1, N'E962', N'E962', N'陳志哲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (5, N'森霸', 1, N'E286', N'E286', N'林金梅', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (6, N'森霸', 1, N'E255', N'E255', N'蕭嘉裕', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (7, N'森霸', 1, N'E165', N'E165', N'吳榮仁', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (8, N'森霸', 1, N'E148', N'E1481', N'尤美蓮', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (9, N'森霸', 1, N'E956', N'E956', N'周芩伃', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (10, N'森霸', 1, N'E067', N'E067', N'林勇政', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (11, N'森霸', 1, N'E948', N'E9481', N'黃璿晞', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (12, N'森霸', 1, N'E924', N'E924', N'溫富發', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (13, N'森霸', 1, N'E945', N'E9451', N'鄭銘芳', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (14, N'森霸', 1, N'C583', N'C583', N'蔡國順', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (15, N'森霸', 1, N'E1005', N'E1005', N'廖欽驊', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, 1)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (16, N'森霸', 1, N'E895', N'E895', N'劉東宜', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (17, N'森霸', 1, N'E1003', N'E1003', N'林志豪', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, 1)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (18, N'森霸', 1, N'E1004', N'E1004', N'吳蕙如', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (19, N'森霸', 1, N'E955', N'E955', N'何沛軒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (20, N'森霸', 1, N'E1007', N'E1007', N'周雨蓓', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (21, N'森霸', 1, N'C572', N'C572', N'林岳昇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (22, N'森霸', 1, N'C581', N'C581', N'曾信斌', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (23, N'森霸', 1, N'C625', N'C625', N'賴振興', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (24, N'森霸', 1, N'C717', N'C717', N'歐皖麟', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (25, N'森霸', 1, N'C718', N'C718', N'王瑞全', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (26, N'森霸', 1, N'E1010', N'E1010', N'何俊穎', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (27, N'森霸', 1, N'E320-02', N'E320-02', N'許智傑', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (28, N'森霸', 1, N'E615', N'E615', N'邱凡純', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (29, N'森霸', 1, N'E600', N'E600', N'王鈞儀', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (30, N'森霸', 1, N'E703', N'E703', N'曾姿綺', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (31, N'森霸', 1, N'E314', N'E314', N'宋羽芑', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (32, N'森霸', 1, N'E535', N'E535', N'張韻華', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (33, N'森霸', 1, N'E1006', N'E1006', N'劉達融', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (34, N'森霸', 1, N'E321', N'E321', N'劉育辰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (35, N'森霸', 1, N'E338', N'E338', N'曾正旻', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (36, N'森霸', 1, N'E182', N'E182', N'吳銀豐', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (37, N'森霸', 1, N'E1031', N'E1031', N'呂吉祥', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (38, N'森霸', 1, N'E542', N'E542', N'顏明德', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (39, N'森霸', 1, N'E504', N'E504', N'蘇威羽', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (40, N'森霸', 1, N'E341', N'E341', N'黃世杰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (41, N'森霸', 1, N'E540', N'E540', N'洪閔強', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (42, N'森霸', 1, N'E710', N'E710', N'張繼育', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (43, N'森霸', 1, N'E784', N'E784', N'陳信貿', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (44, N'森霸', 1, N'E516', N'E516', N'田育安', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (45, N'森霸', 1, N'E1000', N'E1000', N'陸鈞竣', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (46, N'森霸', 1, N'E543', N'E543', N'楊家銘', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (47, N'森霸', 1, N'E942', N'E942', N'凃欽閔', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (48, N'森霸', 1, N'E343', N'E343', N'王忠輝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (49, N'森霸', 1, N'E1055', N'E1055', N'馮馳恩', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (50, N'森霸', 1, N'E1024', N'E1024', N'黃建瑋', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (51, N'森霸', 1, N'E337', N'E337', N'朱聰輝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (52, N'森霸', 1, N'E808', N'E808', N'賴冠忠', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (53, N'森霸', 1, N'E776', N'E776', N'鄭耿彬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (54, N'森霸', 1, N'E339', N'E339', N'黃榮彬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (55, N'森霸', 1, N'E461', N'E461', N'張展臺', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (56, N'森霸', 1, N'E656', N'E656', N'吳宗憲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (57, N'森霸', 1, N'E708', N'E708', N'李軒毅', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (58, N'森霸', 1, N'E350', N'E350', N'林南安', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (59, N'森霸', 1, N'E939', N'E939', N'陳智謙', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (60, N'森霸', 1, N'E772', N'E772', N'劉士敬', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (61, N'森霸', 1, N'E347', N'E347', N'蔡裕昌', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (62, N'森霸', 1, N'E1026', N'E1026', N'吳立全', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (63, N'森霸', 1, N'E1058', N'E1058', N'張煜昇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (64, N'森霸', 1, N'E1059', N'E1059', N'楊曜禎', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (65, N'森霸', 1, N'E1060', N'E1060', N'薛丞恩', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (66, N'森霸', 1, N'E351', N'E351', N'楊謦瑄', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (67, N'森霸', 1, N'E999', N'E999', N'鄭宇勝', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (68, N'森霸', 1, N'E783', N'E783', N'林裕庭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (69, N'森霸', 1, N'E431', N'E431', N'陳俊維', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (70, N'森霸', 1, N'E894', N'E894', N'許書維', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (71, N'森霸', 1, N'E183', N'E183', N'饒志中', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (72, N'森霸', 1, N'E342', N'E342', N'周宏謀', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (73, N'森霸', 1, N'E780', N'E780', N'盧銘聰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (74, N'森霸', 1, N'E1025', N'E1025', N'楊雅富', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (75, N'森霸', 1, N'E398', N'E398', N'李裕仁', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (76, N'森霸', 1, N'E333', N'E333', N'凃瓊月', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (77, N'森霸', 1, N'E548', N'E548', N'陳禹彰', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (78, N'森霸', 1, N'E395', N'E395', N'劉奕其', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (79, N'森霸', 1, N'E325', N'E325', N'潘千裡', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (80, N'森霸', 1, N'E811', N'E811', N'鄭琪玉', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (81, N'森霸', 1, N'E508', N'E508', N'沈雅琦', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (82, N'森霸', 1, N'E941', N'E941', N'吳俊龍', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (83, N'森霸', 1, N'E1002', N'E1002', N'王柏為', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (84, N'森霸', 1, N'E352', N'E352', N'郭宗文', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (85, N'森霸', 1, N'E596', N'E596', N'陳依妡', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (86, N'森霸', 1, N'E568', N'E568', N'洪志民', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (87, N'森霸', 1, N'E844', N'E844', N'翁雅筠', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (88, N'森霸', 1, N'E329', N'E329', N'許雅婷', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (89, N'森霸', 1, N'E639', N'E639', N'葉品尚', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (90, N'森霸', 1, N'E256', N'E256', N'劉煜堂', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (91, N'森霸', 1, N'E612', N'E612', N'蘇暉淵', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (92, N'森霸', 1, N'E785', N'E785', N'張高軒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (93, N'森霸', 1, N'E995', N'E995', N'洪秉賢', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (94, N'森霸', 1, N'E287', N'E287', N'陳昌儒', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (95, N'森霸', 1, N'E529', N'E529', N'林建欽', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (96, N'森霸', 1, N'E623', N'E623', N'蔡定宇', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (97, N'森霸', 1, N'E774', N'E774', N'王新益', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (98, N'森霸', 1, N'E348', N'E348', N'楊雨秦', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (99, N'森霸', 1, N'E427', N'E427', N'許金裕', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (100, N'森霸', 1, N'E503', N'E503', N'楊昆桐', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
GO
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (101, N'森霸', 1, N'E751', N'E751', N'陳彥諭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (102, N'森霸', 1, N'E541', N'E541', N'馬耀方', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (103, N'森霸', 1, N'E624', N'E624', N'姚君憲', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (104, N'森霸', 1, N'E359', N'E359', N'楊欽文', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (105, N'森霸', 1, N'E1057', N'E1057', N'賴易生', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (106, N'森霸', 1, N'E1054', N'E1054', N'吳建璿', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (107, N'森霸', 1, N'E360', N'E360', N'張耿華', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (108, N'森霸', 1, N'E773', N'E773', N'許子謙', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (109, N'森霸', 1, N'E1001', N'E1001', N'李書丞', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (110, N'森霸', 1, N'E346', N'E346', N'吳爭育', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (111, N'森霸', 1, N'E349', N'E349', N'蘇建旭', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (112, N'森霸', 1, N'E345', N'E345', N'楊明德', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (113, N'森霸', 1, N'E259', N'E259', N'陳福成', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (114, N'森霸', 1, N'E246', N'E246', N'王世先', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (115, N'森霸', 1, N'E547', N'E547', N'田居正', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (116, N'森霸', 1, N'E230', N'E230', N'林萬寶', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (117, N'森霸', 1, N'E262', N'E262', N'邱勝利', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (118, N'森霸', 1, N'E335', N'E335', N'周傳貴', CAST(N'2023-06-21' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (120, N'工研院', 1, N'robit', N'robit', N'蕭俊雄', CAST(N'2023-12-07' AS Date), N'A', N'True', N'True', N'True', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (127, N'森霸', 1, N'TZ03', N'TZ03', N'張世儀', CAST(N'2023-12-18' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (128, N'工研院', 1, N'laputa', N'laputa', N'賴斐瓔', CAST(N'2023-12-22' AS Date), N'A', N'True', N'True', N'True', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (129, N'森霸', 1, N'E1083', N'E1083', N'廖俊傑', CAST(N'2023-12-25' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (187, N'森霸', 1, N'E1091', N'E1091', N'林品睿', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (188, N'森霸', 1, N'E324', N'E324', N'薛兆明', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (189, N'森霸', 1, N'E327', N'E327', N'郭武林', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (190, N'森霸', 1, N'E239', N'E239', N'楊明堂', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (191, N'森霸', 1, N'E244', N'E244', N'曾宇正', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (192, N'森霸', 1, N'C578', N'C578', N'高詩晴', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (193, N'森霸', 1, N'E354', N'E354', N'郜祖恩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (194, N'森霸', 1, N'E809', N'E809', N'沈緯翔', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (195, N'森霸', 1, N'E070-02', N'E070-02', N'高佰文', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (196, N'森霸', 1, N'E678', N'E678', N'羅春龍', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (197, N'森霸', 1, N'E334', N'E334', N'溫永彰', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (198, N'森霸', 1, N'TZ02', N'TZ02', N'蔡小梅', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (199, N'森霸', 1, N'A027', N'A027', N'薛人豪', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (200, N'森霸', 1, N'C607', N'C607', N'李崇賓', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (201, N'森霸', 1, N'E737', N'E737', N'趙恩浩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (202, N'森霸', 1, N'C631', N'C631', N'劉少勇', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (203, N'森霸', 1, N'E661', N'E661', N'林永哲', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (204, N'森霸', 1, N'C337', N'C337', N'林家萱', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (205, N'森霸', 1, N'A003', N'A003', N'黃傳先', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (206, N'森霸', 1, N'C540', N'C540', N'黃政恭', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (207, N'森霸', 1, N'E358', N'E358', N'曾允守', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (208, N'森霸', 1, N'C575', N'C575', N'陳慰慈', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (209, N'森霸', 1, N'E330', N'E330', N'林雪蓮', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (210, N'森霸', 1, N'C346', N'C346', N'陳思明', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (211, N'森霸', 1, N'C537', N'C537', N'洪福洋', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (212, N'森霸', 1, N'E812', N'E812', N'陳彥宇', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (213, N'森霸', 1, N'E759', N'E759', N'翁偉智', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (214, N'森霸', 1, N'E288', N'E288', N'馬建華', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (215, N'森霸', 1, N'E744', N'E744', N'郭仲焜', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (216, N'森霸', 1, N'E238', N'E238', N'江志偉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (217, N'森霸', 1, N'E1071', N'E1071', N'陳茂榕', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (218, N'森霸', 1, N'E810', N'E810', N'蔡承勳', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (219, N'森霸', 1, N'E851', N'E851', N'呂麒寶', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (220, N'森霸', 1, N'E896', N'E896', N'呂沐恩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (221, N'森霸', 1, N'E958', N'E958', N'余忞學', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (222, N'森霸', 1, N'E1061', N'E1061', N'朱勇吉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (223, N'森霸', 1, N'E1065', N'E1065', N'李亭瑩', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (224, N'森霸', 1, N'E344', N'E344', N'林信成', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (225, N'森霸', 1, N'E1070', N'E1070', N'曾致緯', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (226, N'森霸', 1, N'E778', N'E778', N'林家萱', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (227, N'森霸', 1, N'E1078', N'E1078', N'黃御麒', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (228, N'森霸', 1, N'E1079', N'E1079', N'鄭馭升', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (229, N'森霸', 1, N'E1080', N'E1080', N'黃憲民', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (230, N'森霸', 1, N'E332', N'E332', N'王頂標', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (231, N'森霸', 1, N'E1084', N'E1084', N'莊庚珉', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (232, N'森霸', 1, N'E1090', N'E1090', N'林孟儒', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (233, N'森霸', 1, N'E1069', N'E1069', N'呂忠穎', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (234, N'森霸', 1, N'E679', N'E679', N'張季平', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (235, N'森霸', 1, N'E688', N'E688', N'蕭正佑', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (236, N'森霸', 1, N'E336', N'E336', N'劉國忠', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (237, N'森霸', 1, N'E687', N'E687', N'黃偉倫', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (238, N'森霸', 1, N'E716', N'E716', N'黃致寧', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (239, N'森霸', 1, N'C325', N'C325', N'李明庭', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (240, N'森霸', 1, N'E777', N'E777', N'黃俊銘', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (241, N'森霸', 1, N'A023', N'A023', N'李明昆', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (242, N'森霸', 1, N'E794', N'E794', N'洪筱淳', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
INSERT [dbo].[人員資料表_測試] ([編號], [單位名稱], [期別], [帳號], [密碼], [姓名], [修改日期], [資料狀態], [職稱], [所屬單位], [代理人], [人資管理], [人資], [請採購], [驗收], [固定資產], [庶務], [承攬商], [請修], [預防保養], [巡檢], [聯絡掛卡], [工作日誌], [營運效率], [重設密碼], [權限設定]) VALUES (243, N'森霸', 1, N'E840', N'E840', N'林維則', CAST(N'2023-12-26' AS Date), N'A', NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL)
GO
INSERT [dbo].[天氣] ([Id], [天氣狀況]) VALUES (10, N'晴')
INSERT [dbo].[天氣] ([Id], [天氣狀況]) VALUES (20, N'雨')
INSERT [dbo].[天氣] ([Id], [天氣狀況]) VALUES (30, N'陰')
GO
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'廠務室', N'090A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'董事長', N'0100000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'稽核室', N'010B000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'總經理', N'010A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'副總經理', N'010A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'行政管理部-經理', N'050A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'行政管部', N'050A100')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'財務部-經理', N'060A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'財務部', N'060A100')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'財務2部', N'060A200')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'豐德電廠', N'070A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'副廠長', N'070A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'技術', N'080A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'技術部', N'080A100')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'專案部', N'080A200')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'企劃部', N'100A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'顧問室', N'110A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課-課長', N'120A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課-副課長', N'120A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課-效率', N'120C000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課-環保', N'120D000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課-水處理', N'120E000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課A', N'120F000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課B', N'120G000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課C', N'120H000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課D', N'120J000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'運轉課E', N'120K000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-課長', N'130A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-副課長', N'130A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-電氣組', N'130C000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-儀控組', N'130D000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-機械組GT', N'130E000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'維修課-機械組ST', N'130F000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'管理課-課長', N'140A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'管理課-副課長', N'140A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'SB管理課', N'140B000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'工安課-課長', N'150A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'工安課-副課長', N'150A000')
INSERT [dbo].[組織表] ([dept_code_ref], [dept_name], [dept_code]) VALUES (NULL, N'工安課', N'150A100')
GO
ALTER TABLE [dbo].[Authorizations] ADD  CONSTRAINT [DF_Authorizations_是否可見程式選單]  DEFAULT ((0)) FOR [是否可見程式選單]
GO
ALTER TABLE [dbo].[Modules] ADD  CONSTRAINT [DF_Modules_是否啟用]  DEFAULT ((0)) FOR [是否啟用]
GO
ALTER TABLE [dbo].[Programs] ADD  CONSTRAINT [DF_Programs_是否啟用]  DEFAULT ((0)) FOR [是否啟用]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_使否啟用]  DEFAULT ((0)) FOR [是否啟用]
GO
/****** Object:  StoredProcedure [dbo].[esp_login_set]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[esp_login_set]
 @編號   varchar(20)='',
 @set    varchar(20)='',
 @field   nvarchar(20)='',
 @deptid  varchar(50)='',
 @kw      varchar(50)='',
 @mode  varchar(20)
AS
BEGIN
 


   if(@mode='List_view')
   begin
      --select * from 人員資料表
	  
	  select * from V_人員資料表_set
	  where  單位名稱<> '台汽電' 
	    and   ( @deptid ='' or [GROUP_ID]=@deptid)
        and ( @kw='' or  帳號 like '%'+@kw +'%' or 姓名 like '%'+@kw +'%' )
   end

   if(@mode='upd_set')
   begin
      if(@set='')
	  begin
	   select @set='False'
	  end

      if( @field='營運效率')
	  begin
	    update 人員資料表 set 營運效率=@set   where 編號=@編號
	  end

      if( @field='工作日誌')
	  begin
	    update 人員資料表 set 工作日誌=@set   where 編號=@編號
	  end

      if( @field='聯絡掛卡')
	  begin
	    update 人員資料表 set 聯絡掛卡=@set   where 編號=@編號
	  end
      if( @field='巡檢')
	  begin
	    update 人員資料表 set 巡檢=@set   where 編號=@編號
	  end
      if( @field='預防保養')
	  begin
	    update 人員資料表 set 預防保養=@set   where 編號=@編號
	  end
      if( @field='請修')
	  begin
	    update 人員資料表 set 請修=@set   where 編號=@編號
	  end
      if( @field='承攬商')
	  begin
	    update 人員資料表 set 承攬商=@set   where 編號=@編號
	  end
      if( @field='庶務')
	  begin
	    update 人員資料表 set 庶務=@set   where 編號=@編號
	  end
      if( @field='固定資產')
	  begin
	    update 人員資料表 set 固定資產=@set   where 編號=@編號
	  end
      if( @field='驗收')
	  begin
	    update 人員資料表 set 驗收=@set   where 編號=@編號
	  end
      if( @field='請採購')
	  begin
	    update 人員資料表 set 請採購=@set   where 編號=@編號
	  end
      if( @field='人資')
	  begin
	    update 人員資料表 set 人資=@set   where 編號=@編號
	  end
      if( @field='人資管理')
	  begin
	    update 人員資料表 set 人資管理=@set   where 編號=@編號
	  end
 
       if( @field='權限設定')
	  begin
	    update 人員資料表 set 權限設定=@set   where 編號=@編號
	  end
   end


   if(@mode='List_dep')
   begin
     SELECT  distinct Value= GROUP_ID, Text=GROUP_NAME  
	 FROM   V_人員資料表2 WHERE    (GROUP_ID IS NOT NULL) order by 2
   end
   if(@mode='retset_pwd')
   begin
     	    update 人員資料表 set [重設密碼]=''   where 編號=@編號
   end

END
GO
/****** Object:  StoredProcedure [dbo].[esp_login_set_old]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
create PROCEDURE [dbo].[esp_login_set_old]
 @編號   varchar(20)='',
 @set   varchar(20)='',
 @field nvarchar(20)='',
 @mode  varchar(20)
AS
BEGIN
 


   if(@mode='List_view')
   begin
      select * from 人員資料表
   end

   if(@mode='upd_set')
   begin
      if(@set='')
	  begin
	   select @set='False'
	  end

      if( @field='營運效率')
	  begin
	    update 人員資料表 set 營運效率=@set   where 編號=@編號
	  end

      if( @field='工作日誌')
	  begin
	    update 人員資料表 set 工作日誌=@set   where 編號=@編號
	  end

      if( @field='聯絡掛卡')
	  begin
	    update 人員資料表 set 聯絡掛卡=@set   where 編號=@編號
	  end
      if( @field='巡檢')
	  begin
	    update 人員資料表 set 巡檢=@set   where 編號=@編號
	  end
      if( @field='預防保養')
	  begin
	    update 人員資料表 set 預防保養=@set   where 編號=@編號
	  end
      if( @field='請修')
	  begin
	    update 人員資料表 set 請修=@set   where 編號=@編號
	  end
      if( @field='承攬商')
	  begin
	    update 人員資料表 set 承攬商=@set   where 編號=@編號
	  end
      if( @field='庶務')
	  begin
	    update 人員資料表 set 庶務=@set   where 編號=@編號
	  end
      if( @field='固定資產')
	  begin
	    update 人員資料表 set 固定資產=@set   where 編號=@編號
	  end
      if( @field='驗收')
	  begin
	    update 人員資料表 set 驗收=@set   where 編號=@編號
	  end
      if( @field='請採購')
	  begin
	    update 人員資料表 set 請採購=@set   where 編號=@編號
	  end
      if( @field='人資')
	  begin
	    update 人員資料表 set 人資=@set   where 編號=@編號
	  end
      if( @field='人資管理')
	  begin
	    update 人員資料表 set 人資管理=@set   where 編號=@編號
	  end
 
   end


END
GO
/****** Object:  StoredProcedure [dbo].[esp_組織查詢]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[esp_組織查詢] 
	 @單位名稱  nvarchar(50)='',
	 @代碼  varchar(50)=''
AS
BEGIN
-- esp_組織查詢  @單位名稱='運轉課'

if(@代碼 !='')
begin
   select @單位名稱 = 單位名稱  from v_組織表 where GROUP_ID=@代碼
end
if(@單位名稱 !='')
begin
	declare  @單位代碼   as table ( guid nvarchar(50) )      
	declare  @單位代碼_1 as table ( guid nvarchar(50) )   
	declare  @單位代碼_2 as table ( guid nvarchar(50) ) 
	declare  @單位代碼_3 as table ( guid nvarchar(50) ) 
	declare  @單位代碼_4 as table ( guid nvarchar(50) ) 
	declare  @單位代碼_5 as table ( guid nvarchar(50) ) 

	--select  GROUP_ID, 下階代碼  from v_組織表 where  單位名稱 = '工安課'

	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  單位名稱 collate Chinese_Taiwan_Stroke_CS_AS= @單位名稱  --自己本身
	insert @單位代碼_1 select distinct 下階代碼 from v_組織表 where  單位名稱 collate Chinese_Taiwan_Stroke_CS_AS= @單位名稱  --下一階
	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS in (select guid  from @單位代碼_1 ) --自己本身
	insert @單位代碼_2 select distinct 下階代碼 from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS in (select guid  from @單位代碼_1 ) --下一階
	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_2 ) 
	insert @單位代碼_3 select distinct 下階代碼 from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_2 ) 
	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_3 ) 
	insert @單位代碼_4 select distinct 下階代碼 from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_3 ) 
	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_4 )
	insert @單位代碼_5 select distinct 下階代碼 from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_4 ) 
	insert @單位代碼   select distinct GROUP_ID from v_組織表 where  GROUP_ID collate Chinese_Taiwan_Stroke_CS_AS  in (select guid  from @單位代碼_5 )

 
	SELECT  GROUP_ID, 單位名稱, 階層=LEV, 下階代碼, 下階單位名稱 FROM  v_組織表 
	where GROUP_ID  collate Chinese_Taiwan_Stroke_CS_AS in(select * from @單位代碼 )
    order by 3,1

end






END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserGuid]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 取得USER GUID
-- sp_GetUserGuid @email='robit62@yahoo.com.tw',@url='http://www.abc.com'
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserGuid]
	@email nvarchar(300),
	@url nvarchar(300)
AS
BEGIN
	SET NOCOUNT ON;

	declare @guid nvarchar(50)
	declare @uid nvarchar(10)
	declare @cname nvarchar(50)
	declare @body nvarchar(500)
	declare @_url nvarchar(300)
	declare @_email nvarchar(300)

    if exists(select [USER_GUID] from V_人員資料表2 where rtrim(isnull([E-MAIL],'')) = @email) 
		begin

			select	@guid = rtrim(isnull(USER_GUID,'')), 
					@cname = rtrim(isnull([姓名],'')), 
					@uid = [帳號], 
					@_email = [E-MAIL] 
			from V_人員資料表2 
			where rtrim(isnull([E-MAIL],'')) = @email


			--SELECT  @_email= EMPLOYEE_EMAIL_1 FROM [70783499].[dbo].[HRMS_EMPLOYEE]
			--where EMPLOYEE_NO=@uid

			--if(@uid = 'robit')
			--begin
			--   SELECT  @_email= 'robit62@yahoo.com.tw'
			--end


			set @_url = concat('<a href="', @url, '?guid=', @guid, '&uid=', @uid, '">', @url, '?guid=', @guid, '&uid=', @uid, '</a>')
			set @body = concat(@cname, ' 您好:<br><br>請點擊以下連結重設密碼<br>', @_url, '<br><br>***** 信件系統寄出，請勿直接回覆 *****')
			exec sp_寄信通知 @_email, '密碼重設通知', @body
			--exec sp_寄信通知 'robit62@yahoo.com.tw', '密碼重設通知', @body
			select '1'
		end
	else
		select '0'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_修改密碼]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 修改密碼
-- =============================================
CREATE PROCEDURE [dbo].[sp_修改密碼]
	@account nvarchar(10),
	@password nvarchar(100), --原密碼
	@hashpassword nvarchar(100), --hash原密碼
	@hashpassword2 nvarchar(100) --新密碼
AS
BEGIN
	SET NOCOUNT ON;   

	declare @pw nvarchar(100)
	declare @hashpw nvarchar(100)

	select @pw = [密碼], @hashpw = isnull([重設密碼], '') from [V_人員資料表2] where [帳號] = @account

	if ( (@hashpw = '' and @pw = @password) or (@hashpw = @hashpassword) )
		begin
			update [人員資料表] set [重設密碼] = @hashpassword2 where [帳號] = @account
			select '1'
		end
	else
		select '0'

END
GO
/****** Object:  StoredProcedure [dbo].[sp_寄信通知]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 寄信通知
-- =============================================
CREATE PROCEDURE [dbo].[sp_寄信通知]
	@_recipients nvarchar(300),
	@_subject nvarchar(500),
	@_body nvarchar(max)
AS
BEGIN
	 SET NOCOUNT ON;

	 --declare @sql nvarchar(max)
	 --select @sql='exec msdb.dbo.sp_send_dbmail @from_address=''sys<sys@powersunba.com.tw>'','
		--		 +'@recipients = '+ isnull(@_recipients,'') +' ,' 
		--		 +'@subject ='''+ isnull(@_subject,'') +''' ,' 
		--		 +'@body ='''+ isnull(@_body,'') +''' ,' 
		--		 +'@body_format =''HTML''' 

	 --insert mail_log (mail_sql,mail_time)
	 --select @sql,getdate()

	 exec msdb.dbo.sp_send_dbmail
	      @from_address='sys<sys@powersunba.com.tw>',
		  @recipients = @_recipients,
		  @subject = @_subject,
		  @body = @_body,
		  @body_format = 'HTML'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_密碼重設]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 密碼重設
-- =============================================
CREATE PROCEDURE [dbo].[sp_密碼重設]
	@guid nvarchar(50),
	@pw nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;   

	declare @empno nvarchar(10)
	select @empno = [帳號] from [V_人員資料表2] where isnull(USER_GUID, '') = @guid

    update [人員資料表] set [重設密碼] = @pw where [帳號] = @empno
	select '1'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_登入驗證]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 登入驗證
-- =============================================
CREATE PROCEDURE [dbo].[sp_登入驗證]
	@帳號 nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;   

    select [帳號]
          ,[姓名]
          ,[GROUP_ID] as [dept_code]
          ,[GROUP_NAME] as [dept_name]
		  ,[密碼]
		  ,[TITLE_NAME] as [title_name]
		  ,[重設密碼]
		  ,[RANK]
	from V_人員資料表2 
	where [帳號] = @帳號
END


GO
/****** Object:  StoredProcedure [dbo].[sp_登入驗證測試]    Script Date: 2024/4/8 上午 11:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author      : Cary Lin
-- Create date : <Create Date,,>
-- Description : 登入驗證
-- =============================================
CREATE PROCEDURE [dbo].[sp_登入驗證測試]
	@帳號 nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;   

    select [帳號]
          ,[姓名]
          ,[GROUP_ID] as [dept_code]
          ,[GROUP_NAME] as [dept_name]
		  ,[密碼]
		  ,[TITLE_NAME] as [title_name]
		  ,[重設密碼]
		  ,[RANK]
	from V_人員資料表_測試 
	where [帳號] = @帳號
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V_員工資料"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 282
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "人員資料表"
            Begin Extent = 
               Top = 6
               Left = 320
               Bottom = 136
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HRMS_EMPLOYEE (70783499.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "人員資料表_測試"
            Begin Extent = 
               Top = 6
               Left = 387
               Bottom = 136
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "TB_EB_GROUP (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 6
               Left = 590
               Bottom = 136
               Right = 791
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_EMPL_DEP (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_JOB_TITLE (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 138
               Left = 241
               Bottom = 268
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_USER (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 138
               Left = 452
               Bottom = 268
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表_測試'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表_測試'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表_測試'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[17] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HRMS_EMPLOYEE (70783499.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "人員資料表"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 165
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "TB_EB_GROUP (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 177
               Left = 362
               Bottom = 335
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "TB_EB_EMPL_DEP (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 8
               Left = 610
               Bottom = 166
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_JOB_TITLE (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 18
               Left = 822
               Bottom = 176
               Right = 1023
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_USER (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 13
               Left = 302
               Bottom = 171
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' ParameterDefaults = ""
      End
      Begin ColumnWidths = 26
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_人員資料表2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "vwZZ_EMPLOYEE (70783499.dbo)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 165
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TB_EB_USER (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 168
               Left = 48
               Bottom = 326
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dept"
            Begin Extent = 
               Top = 329
               Left = 48
               Bottom = 466
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_員工資料'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_員工資料'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_EB_GROUP (UOF_Training_SUNBA.dbo)"
            Begin Extent = 
               Top = 41
               Left = 185
               Bottom = 171
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_組織架構'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_組織架構'
GO
USE [master]
GO
ALTER DATABASE [SUNBA_Common] SET  READ_WRITE 
GO
