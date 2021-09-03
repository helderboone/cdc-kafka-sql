-- 1- Criação do database
USE [master]
GO

CREATE DATABASE [TesteEF]
GO

USE [TesteEF]
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

insert into dbo.Person values ('Joao Silva', 'Rua Augusta, 100', '9999999999');
insert into dbo.Person values ('Marcos Santos', 'Rua Jorgina, 90', '9999999992');
insert into dbo.Person values ('Andre Marcos Souza', 'Rua Antonio Pinto, 8778', '9999999993');

