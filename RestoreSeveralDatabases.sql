drop table if exists tempdb..#temp
create table #temp (dbname varchar(20))
insert into #temp
select 'STG_Appdashboard'
union all
select 'STG_CoreAuth'
union all
select 'STG_CoreIssue'
union all
select 'STG_CoreLibrary'
union all
select 'STG_CoreMoney'
union all
select 'STG_KMM_DB'
--USE [master]
--RESTORE DATABASE [AppDashboard] FROM  DISK = N'I:\Mock Migration\AppDashboard.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

--GO



SELECT 'RESTORE DATABASE ['+dbname+'] FROM  DISK= N''I:\Mock_Migration\Staging\'+dbname+'.bak'' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5 '
FROM #temp
