EXEC sp_changedbowner 'sa'
ALTER DATABASE [Demo] SET trustworthy ON

EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

EXEC  sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO

EXEC  sp_configure 'show advanced options', 0;
GO
RECONFIGURE;
GO


IF EXISTS(Select 1 From sys.assemblies Where [name]='Generator')
BEGIN
	Drop Assembly Generator
END
-- Create Assembly from the DLL
CREATE  ASSEMBLY Generator
FROM 'C:\DLLs\Generator\Generator.dll'
WITH PERMISSION_SET =  EXTERNAL_ACCESS;
GO


-- Create a function to generate random numbers using the DLL
CREATE Or Alter FUNCTION dbo.GenerateRandomNumber()
RETURNS INT
AS EXTERNAL NAME Generator.[Generator.NumberGenerator].GenerateNumber;
GO

Select dbo.GenerateRandomNumber() as RandomNumber
Go

-- Create a function to generate random guid using the DLL
CREATE Or Alter FUNCTION dbo.GenerateGUID()
RETURNS nvarchar(250)
AS EXTERNAL NAME Generator.[Generator.GuidGenerator].GeneratorGuid;
GO

---- Clean up
--DROP FUNCTION dbo.GenerateRandomNumber;
--DROP FUNCTION dbo.GenerateGUID;
--DROP ASSEMBLY Generator;
