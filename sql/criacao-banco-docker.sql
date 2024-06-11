-- 1- Criação do database
USE [master]
GO

WAITFOR DELAY '00:00:02'

CREATE DATABASE [TesteEF]
GO

PRINT N'TesteEF created successfully';
WAITFOR DELAY '00:00:02'

USE [TesteEF]
GO

-- 2- Criação da tabela
CREATE TABLE Person (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Phone VARCHAR(11)
)

CREATE TABLE Car (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Brand VARCHAR(100) NOT NULL,
    Color VARCHAR(200) NOT NULL,
    DateModification DateTime
)

PRINT N'Person table created successfully';

-- Habilitar o CDC
EXEC sys.sp_cdc_enable_db
GO

PRINT N'CDC enabled';

-- Criar o CDC para a tabela Person
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'Person',
@role_name     = N'Admin',
@supports_net_changes = 1
GO

EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'Car',
@role_name     = N'Admin',
@supports_net_changes = 1
GO

PRINT N'CDC enabled for Person Table';

insert into dbo.Person values ('Joao Silva', 'Rua Augusta, 100', '9999999999');
insert into dbo.Car values ('Mercedez', 'Grey', GETDATE());
-- insert into dbo.Person values ('Marcos Santos', 'Rua Jorgina, 90', '9999999992');
-- insert into dbo.Person values ('Andre Marcos Souza', 'Rua Antonio Pinto, 8778', '9999999993');

PRINT N'Data sample inserted';

