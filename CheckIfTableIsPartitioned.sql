SELECT
    t.name AS [Table],
    i.name AS [Index],
    i.type_desc,
    i.is_primary_key,
    ps.name AS [Partition Scheme]
FROM sys.tables t
INNER JOIN sys.indexes i
    ON t.object_id = i.object_id
    AND i.type IN (0,1)
INNER JOIN sys.partition_schemes ps   
    ON i.data_space_id = ps.data_space_id
WHERE t.name in ('AuditLog'
,'UniqueIDDetail'
,'TCIVrRequest'
,'SystemAuditLog'
,'InvoiceActivityLog'
,'VISASMSReport'
,'FinancialTxnRecord_V22'
,'FinancialTxnRcd_V22226'
,'MultiCurrency_V22260'
,'FinancialTxnFee_V22261'
,'VSDCSpecific_V22280'
,'VSDCSpecific_V22281'
,'VSDCSpecific_V22282'
,'IncomingMsgWarehouse'
,'PaymentService_V22230'
,'ATMSpecific_V22250')
 