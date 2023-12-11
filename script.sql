-- 1- Criação do database
CREATE DATABASE TesteEF*/

Use TesteEF
GO

-- 2- Criação da tabela
CREATE TABLE Person (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Phone VARCHAR(11)
)

-- Habilitar o CDC
EXEC sys.sp_cdc_enable_db
GO


-- Criar o CDC para a tabela Person
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'Person',
@role_name     = N'Admin',
@supports_net_changes = 1
GO


-- SQL util para ver os registros das modificacoes
-- SELECT
--     sys.fn_cdc_map_lsn_to_time(__$start_lsn) AS ChangeTime,
--     CASE
--         WHEN __$operation = 1 THEN 'Deleted'
--         WHEN __$operation = 2 THEN 'Inserted'
--         WHEN __$operation = 3 THEN 'Updated'
--         WHEN __$operation = 4 THEN 'Previous Value for Update'
--         ELSE 'Unknown'
--     END AS OperationType,
--     * 
-- FROM
--     cdc.dbo_Person_CT
-- ORDER BY
--     __$start_lsn;