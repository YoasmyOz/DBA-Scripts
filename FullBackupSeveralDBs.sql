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

SELECT 'BACKUP DATABASE ['+dbname+']  TO  DISK = N''I:\Mock_Migration\Staging\'+dbname+'.bak'' WITH NOFORMAT, NOINIT,  NAME = N'''+dbname+' -Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10, MAXTRANSFERSIZE = 4194304, BUFFERCOUNT = 100  '
FROM #temp