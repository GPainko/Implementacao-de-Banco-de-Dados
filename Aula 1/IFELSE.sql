-- DECLARE
-- Declarando variaveis
DECLARE @valor INT,
		@texto VARCHAR(40),
		@data DATE,
		@dinheiro MONEY
-- SET
-- Setando os valores das variaveis
SET @valor = 37;
SET @texto = 'Guilherme';
SET @data = GETDATE();
SET @dinheiro = 50.50;

-- SELECT 
-- Exibir os valores armazenados nas variáveis
SELECT @valor AS 'Idade', 
	   @texto AS 'Nome', 
	   @data AS 'U_Acesso',
	   @dinheiro AS 'V_Compra';
	
-- PRINT 
PRINT ' O valor contido na variavel @texto é: ' + @texto;
PRINT ' O valor contido na variavel @valor é: ' + 
		CAST(@valor AS VARCHAR(10));