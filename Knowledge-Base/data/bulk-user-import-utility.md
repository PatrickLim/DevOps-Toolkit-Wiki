USE [master]
GO

/****** Object:  Database [gmh-rcm-userbulk]    Script Date: 7/29/2020 10:15:06 PM ******/
--DROP DATABASE [gmh-rcm-userbulk]
--GO

/****** Object:  Database [gmh-rcm-userbulk]    Script Date: 7/29/2020 10:15:06 PM ******/
CREATE DATABASE [gmh-rcm-userbulk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gmh-rcm-userbulk', FILENAME = N'M:\gmh\gmh-rcm-userbulk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gmh-rcm-userbulk_log', FILENAME = N'L:\gmh\gmh-rcm-userbulk.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gmh-rcm-userbulk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ARITHABORT OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET  DISABLE_BROKER 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET RECOVERY FULL 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET  MULTI_USER 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [gmh-rcm-userbulk] SET DB_CHAINING OFF 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [gmh-rcm-userbulk] SET QUERY_STORE = OFF
GO

ALTER DATABASE [gmh-rcm-userbulk] SET  READ_WRITE 
GO


use [gmh-rcm-userbulk]
go

create user userschemaowner without login
GO
CREATE SCHEMA [userschema] AUTHORIZATION [userschemaowner]
GO
create synonym [userschema].[USER_MSTR] for [gmh-rcm].[dbo].[USER_MSTR]
GO
