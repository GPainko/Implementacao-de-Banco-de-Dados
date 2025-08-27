-- 1. Vari�veis no SQL Server
-- 1.1. Declara��o de Vari�veis
-- Declare tr�s vari�veis no SQL Server: uma para armazenar o nome de um produto (tipo VARCHAR), 
-- outra para armazenar a quantidade em estoque (tipo INT) e a 
-- �ltima para armazenar o pre�o do produto (tipo DECIMAL(10,2)).
GO
DECLARE @produto VARCHAR(100),
		@qtd_estoque INT,
		@preco_produto DECIMAL(10,2)

-- 1.2. Atribui��o de Valores
-- Atribua os seguintes valores �s vari�veis declaradas:
-- Nome do Produto: "Notebook"
-- Quantidade em Estoque: 15
-- Pre�o do Produto: 2999.99

SET @produto = 'Notebook';
SET @qtd_estoque = 15;
SET @preco_produto = 2999.99;

-- 1.3. Exibi��o de Valores
-- Exiba os valores atribu�dos �s vari�veis utilizando 
-- tanto o comando PRINT quanto o comando SELECT.

PRINT 'Nome do Produto:' + @produto;
PRINT 'Quantidade em estoque:' + CAST(@qtd_estoque AS VARCHAR(100));
PRINT 'Pre�o do Produto:' + CAST(@preco_produto AS VARCHAR(100));

SELECT @produto AS 'Produto', @qtd_estoque as 'Estoque', @preco_produto AS 'Pre�o'
GO
-- 1.4. C�lculo utilizando Vari�veis
-- Declare tr�s vari�veis: @SalarioBase (tipo DECIMAL(10,2)), @Bonus (tipo DECIMAL(10,2)) 
-- e @SalarioTotal (tipo DECIMAL(10,2)). 
-- Atribua valores de 5000.00 e 800.00 �s vari�veis @SalarioBase e @Bonus, respectivamente
-- . Em seguida, calcule o valor total do sal�rio somando @SalarioBase e @Bonus 
-- e armazene o resultado em @SalarioTotal. Exiba o valor de @SalarioTotal.
GO
DECLARE @salario_base DECIMAL(10,2),
		@bonus DECIMAL(10,2),
		@salario_total DECIMAL(10,2)

SET @salario_base = 5000.00
SET @bonus = 800.00
SET @salario_total = @salario_base + @bonus

SELECT @salario_base AS 'Salario', @bonus AS 'Bonus', @salario_total AS 'SALARIO TOTAL'
GO

-- 2. Convers�o de Dados
-- 2.1. CAST
-- Converta a data atual (GETDATE()) para o formato VARCHAR(10) 
-- utilizando a fun��o CAST e exiba o resultado.

SELECT CAST(GETDATE() AS VARCHAR(10)) AS DataConvertida;

-- 2.2. CONVERT
-- Converta o n�mero 12345.67 para o tipo INT utilizando a fun��o CONVERT e exiba o resultado.

SELECT CONVERT(INT, 12345.67) AS NumeroConvertido;

-- 2.3. Exerc�cio Pr�tico
-- Crie uma vari�vel para armazenar um n�mero decimal 
-- e outra para armazenar um n�mero inteiro. 
-- Atribua valores a essas vari�veis e utilize CAST e CONVERT 
-- para converter o decimal para inteiro e vice-versa, exibindo os resultados.

GO

DECLARE @numero_decimal DECIMAL(10,2),
		@numero_inteiro INT;

SET @numero_decimal = 123.45;
SET @numero_inteiro = 50;

SELECT @numero_decimal AS 'NUMERO DECIMAL' , CAST(@numero_decimal AS INT) AS 'Decimal para Inteiro';

SELECT @numero_inteiro AS 'NUMERO INTEIRO', CAST(@numero_inteiro AS DECIMAL(10,2)) AS 'Inteiro para Decimal';

SELECT @numero_decimal AS 'NUMERO DECIMAL',CONVERT(INT, @numero_decimal) AS 'Decimal para Inteiro CONVERT';

SELECT @numero_inteiro AS 'NUMERO INTEIRO',CONVERT(DECIMAL(10,2), @numero_inteiro) AS 'Inteiro para Decimal CONVERT';

GO

-- 2.4. Convers�o de String para Data
-- Declare uma vari�vel @DataNascimento do tipo VARCHAR(10) 
-- e atribua a ela o valor '15/08/1990'. Em seguida, 
-- converta essa vari�vel para o tipo DATE utilizando a 
-- fun��o CONVERT e exiba o resultado.

GO
DECLARE @DataNascimento VARCHAR(10);

SET @DataNascimento = '15/08/1990';

-- Convertendo para DATE usando CONVERT
SELECT @DataNascimento AS 'VARCHAR',CONVERT(DATE, @DataNascimento, 103) AS 'DATE';

GO


