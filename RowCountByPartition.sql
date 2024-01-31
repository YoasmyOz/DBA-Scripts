--Row count for Partition

SELECT 
    p.partition_number AS [Partition], 
    fg.name AS [Filegroup], 
    p.Rows
FROM sys.partitions p
    INNER JOIN sys.allocation_units au
    ON au.container_id = p.hobt_id
    INNER JOIN sys.filegroups fg
    ON fg.data_space_id = au.data_space_id
WHERE p.object_id = OBJECT_ID('UniqueIDDetail')
ORDER BY [Partition];