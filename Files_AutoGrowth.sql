
select DB_NAME(database_id) AS [Database],
type_desc AS [File Type],
name AS [Logical Name],
size AS [Size (MB)],
CASE max_size
WHEN -1
THEN N'Unlimited'
ELSE CONVERT(NVARCHAR(16), CONVERT(bigint, max_size/128.0)) END AS [Maxsize (MB)],
CASE is_percent_growth
WHEN 1
THEN CONVERT(nvarchar(16), growth) + N'%'
ELSE CONVERT(nvarchar(16), CONVERT(bigint, growth/128.0)) + N' MB' END AS [Autogrowth],
physical_name
from sys.master_files
ORDER BY database_id ASC, FILE_ID ASC