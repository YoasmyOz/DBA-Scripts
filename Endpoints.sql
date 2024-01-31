--Verify ENDPOINT: 
select * from sys.database_mirroring_endpoints;
--CREATE ENDPOINT
CREATE ENDPOINT [Hadr_endpoint] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 5022, LISTENER_IP = ALL)   
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = WINDOWS NEGOTIATE
, ENCRYPTION = REQUIRED ALGORITHM AES)
--ALTER AUTHORIZATION TO SA--CHANGE OWNERSHIP
ALTER AUTHORIZATION ON ENDPOINT::Hadr_endpoint TO sa
--GRANT COONECT AS SA
GRANT CONNECT ON ENDPOINT::Hadr_endpoint TO [PREPROD\AZWCSQL] AS [sa];
--CHECK PERMISSIONS
SELECT EP.name, SP.state_desc,   
   CONVERT(nvarchar(38), suser_name(SP.grantor_principal_id))   
      AS GRANTOR,   
   SP.permission_name,
   CONVERT(nvarchar(46),suser_name(SP.grantee_principal_id))   
      AS GRANTEE   
   FROM sys.server_permissions SP , sys.endpoints EP  
   WHERE SP.major_id = EP.endpoint_id  
   and EP.name = 'Hadr_endpoint'