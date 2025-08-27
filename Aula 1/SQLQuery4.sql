USE EMPRESA
GO
DECLARE @nome_funcionario VARCHAR(100),
		@media_salario DECIMAL(10,2),
		@salario DECIMAL(10,2)

SET @NOME_FUNCIONARIO = 'Paulo'


SELECT @media_salario = AVG(F.Salario)
FROM FUNCIONARIO AS F
PRINT @MEDIA_SALARIO

SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_funcionario
PRINT @salario
IF @salario < @media_salario
	print 'Funcionario recebe abaixo da media'
else
	print 'Funcionario recebe acima da media'
GO

GO
DECLARE @nome_funcioario VARCHAR(100),
		@idade INT
set @nome_funcioario = 'Jennifer';
SELECT @idade = DATEDIFF(YEAR,F.Datanasc,GETDATE())
FROM FUNCIONARIO as f
WHERE f.Pnome = @nome_funcioario
PRINT @idade

IF @idade >= 60
	PRINT 'PROXIMO DA APOSENTADORIA'
ELSE
	PRINT 'SEM TEMPO DE APOSENTADORIA'

SELECT F.Pnome,F.Datanasc ,DATEDIFF(YEAR,F.Datanasc,GETDATE()) AS IDADE
FROM FUNCIONARIO AS F
GO

GO
DECLARE @nome_funcioario VARCHAR(100),
		@data DATE,
		@data_nasc DATE,
		@idade INT
set @nome_funcioario = 'Fernando';
set @data = GETDATE();

SELECT @data_nasc = F.Datanasc
FROM FUNCIONARIO AS F
where F.Pnome = @nome_funcioario
set @idade = YEAR(@data) - YEAR(@data_nasc)
SELECT @nome_funcioario AS 'Nome', @data_nasc AS 'Data_nasc',@data AS 'Data', @idade AS 'Idade'

IF MONTH(@data) < MONTH(@data_nasc)
	AND DAY(@data) < DAY(@data_nasc)
	SELECT @nome_funcioario AS 'Nome', @data_nasc AS 'Data_nasc',@data AS 'Data', @idade AS 'Idade' 
ELSE
	SELECT @nome_funcioario AS 'Nome', @data_nasc AS 'Data_nasc',@data AS 'Data', @idade - 1 AS 'Idade'
GO

