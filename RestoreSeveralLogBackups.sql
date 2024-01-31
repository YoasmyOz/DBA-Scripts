sp_configure 'show advanced options', 1
reconfigure
GO

sp_configure 'xp_cmdshell', 1
reconfigure
GO

-------------------------------------------------------------


DROP TABLE if exists tempdb..#ResultadoCommand
GO

CREATE TABLE #ResultadoCommand(
                [Archivo] [varchar](250) NULL
) ON [PRIMARY]

GO
INSERT #ResultadoCommand exec master.sys.xp_cmdshell 'dir /b /o:n I:\Mock_Migration\Logs_Backup\KMM_DB\'
SELECT * FROM #ResultadoCommand
DECLARE @COMANDO VARCHAR(250), @LogFile VARCHAR(250)

DECLARE CursorLogs CURSOR FOR
SELECT * FROM #ResultadoCommand
      OPEN CursorLogs 
      FETCH NEXT FROM CursorLogs INTO @LogFile
      WHILE @@FETCH_STATUS = 0
      BEGIN
            --insert code here
            SET @COMANDO = 'RESTORE LOG [KMM_DB] FROM DISK = ''I:\Mock_Migration\Logs_Backup\KMM_DB\'+@LogFile+''' WITH NORECOVERY'  + CHAR(10) + 'GO'
            --EXEC @COMANDO
            PRINT @COMANDO
            FETCH NEXT FROM CursorLogs INTO @LogFile --do not forget this line. Will cause an infinite loop.
      END
      
CLOSE CursorLogs 
DEALLOCATE CursorLogs

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'#ResultadoCommand') AND type in (N'U'))
DROP TABLE #ResultadoCommand
GO

-------------------------------------------------------------

sp_configure 'xp_cmdshell', 0
reconfigure
GO

sp_configure 'show advanced options', 0
reconfigure
GO
