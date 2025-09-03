-- DECLARE @valor INT;

-- SET @valor = 10;

-- SELECT @VALOR = CAMPO FROM TABELA

-- IF (CONDIÇÃO)
--	BEGIN
--	END;
-- ELSE IF (CONDIÇÃO)
--	BEGIN
--	END;

-- FLOAT SOMA (FLOAT A, FLOAT B)
-- {
--	 FLOAT R = A + B;
--	 RETURN R;
-- }
-- PRINT(SOMA(3,2));

SELECT dbo.fn_Dobro(5) AS Resultado

SELECT Pnome, Unome, Salario, dbo.fn_Dobro(Salario) AS Salario_Dobrado
FROM FUNCIONARIO;
	
SELECT Pnome, Unome, Datanasc, dbo.fn_CalculaIdade(Datanasc) AS idade
FROM FUNCIONARIO;

SELECT * from dbo.fn_TrabalhaOnde('pesquisa')

SELECT * FROM dbo.fn_salarioanual('12312312311')
SELECT * FROM dbo.fn_SalarioAnulaeBonus('12312312311',2)
SELECT dbo.fn_SalarioAnulaeBonus(100,5) AS Resultado
SELECT Pnome, Unome, Salario, dbo.fn_SalarioAnulaeBonus(Salario,5) AS Salario_Dobrado
FROM FUNCIONARIO;
	
select * from FUNCIONARIO
