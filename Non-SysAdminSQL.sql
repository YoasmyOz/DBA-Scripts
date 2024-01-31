CMD ADMIN: sqlservr.exe -m -sSQLSERVER2012
 
CMD ADMIN: sqlcmd -S SQLSERVER2012
 
CREATE LOGIN [PREPROD\grpDBAProject] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [PREPROD\grpDBAProject]
GO
 
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO
 
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQLServer', N'LoginMode', REG_DWORD, 2
GO