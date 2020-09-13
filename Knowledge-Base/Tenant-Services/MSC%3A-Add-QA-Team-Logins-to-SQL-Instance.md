The following script will add the QA Team's medsphere.com user accounts to a new/migrated SQL instance.


```
USE [master]
GO

/****** Object:  Login [MEDSPHERE\rochelle.ohde]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\rochelle.ohde] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\jared.jonas]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\jared.jonas] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\teresita.garcia]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\teresita.garcia] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\michael.chen]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\michael.chen] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\lynne.mundi]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\lynne.mundi] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\kelli.bartholomew]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\kelli.bartholomew] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\emil.jimenez]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\emil.jimenez] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphereWS], DEFAULT_LANGUAGE=[us_english]
GO

/****** Object:  Login [MEDSPHERE\erin.stuck]    Script Date: 8/17/2020 2:05:57 PM ******/
CREATE LOGIN [MEDSPHERE\erin.stuck] FROM WINDOWS WITH DEFAULT_DATABASE=[IcsMedsphere], DEFAULT_LANGUAGE=[us_english]
GO
```


 