-- Specify Tenant Database
USE [crmc-rcm]
GO

-- Declare variables
declare @user_name varchar(20)
declare @startdate varchar(15)
declare @enddate varchar(20)

-- Update variables below to target specific Openvista.net User Account
set @user_name = 'brian.stockell'
set @startdate = '2021-09-01'
set @enddate = '2022-01-01'

-- Query USER_LOG table for results and order by most recent LOGIN_TIME
SELECT * FROM USER_LOG
WHERE USERNAME = @user_name
AND LOGIN_TIME > @StartDate
AND LOGOUT_TIME < @EndDate
ORDER BY LOGIN_TIME DESC
