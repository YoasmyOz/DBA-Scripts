drop table if exists tempdb..#orphans
create table #orphans(databaseName varchar(128), Username varchar(128), UserSID varbinary(85))
select 'use ' +name+ '
insert into #orphans(Username,UserSID)
EXEC sp_change_users_login ''Report'';
update #orphans
set 
databaseName = DB_name()
where databaseName is null
' FROM sysdatabases WHERE dbid > 4