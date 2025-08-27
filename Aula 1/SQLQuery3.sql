USE EMPRESA

GO
DECLARE @dtp_numero INT


SET @dtp_numero = 4;

SELECT *
FROM DEPARTAMENTO AS D
WHERE D.Dnumero = @dtp_numero
GO

GO
DECLARE @nome_funcionario VARCHAR(100),
		@salario DECIMAL(10,2),
		@aumento DECIMAL(10,2),
		@novo_salario DECIMAL(10,2)

SET @nome_funcionario = 'Jorge'
SET @aumento = 10;
-- SELECT para colocar variaveis em uma variavel 

select @salario = F.Salario
from FUNCIONARIO as F
WHERE F.Pnome = @nome_funcionario;
SET @novo_salario = @salario * (1+(@aumento/100));
SELECT @nome_funcionario AS 'Nome', @salario AS 'Salario', 
	   @aumento AS '%', @novo_salario AS 'Salario.A';
GO

GO
DECLARE @nome_funcioario VARCHAR(100),
		@data DATE,
		@data_nasc DATE,
		@idade INT
set @nome_funcioario = 'Jennifer';
set @data = GETDATE();

SELECT @data_nasc = F.Datanasc
FROM FUNCIONARIO AS F
where F.Pnome = @nome_funcioario
set @idade = YEAR(@data) - YEAR(@data_nasc)
SELECT @nome_funcioario AS 'Nome', @data_nasc AS 'Data_nasc',@data AS 'Data', @idade AS 'Idade'
GO

GO
SELECT CONVERT(VARCHAR(10),F.Datanasc,103) AS 'DATA'
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer'
GO

GO
SELECT CONCAT(F.Pnome, ' ',F.Minicial,' ',F.Unome) AS 'NOME_COMPELTO'
FROM FUNCIONARIO AS F
GO