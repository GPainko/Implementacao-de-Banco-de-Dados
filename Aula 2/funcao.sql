-- Função dobrar valor

CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT
AS
BEGIN
	RETURN @Numero * 2;
END;

-- Alterar função dobrar valor

ALTER FUNCTION fn_Dobro(@Numero INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
	RETURN @Numero * 2;
END;

-- função idade

CREATE FUNCTION fn_CalculaIdade(@idade DATE)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(YEAR,@idade,GETDATE());
END;

-- alterar função idade

ALTER FUNCTION fn_CalculaIdade(@DataNasc DATE)
RETURNS INT
AS
BEGIN
	DECLARE @idade INT;
	set @idade = DATEDIFF(YEAR,@DataNasc,GETDATE());
	IF (MONTH(@DataNasc) > MONTH(GETDATE()) 
		or MONTH(@DataNasc) = MONTH(GETDATE()) and DAY(@DataNasc) > DAY(GETDATE()))
		RETURN @idade - 1
	RETURN @idade
END;

-- função funcioario departamento
CREATE FUNCTION fn_TrabalhaOnde(@departamento varchar(100))
RETURNS TABLE
AS
	RETURN
	(
	SELECT D.Dnome ,F.Pnome, f.Unome
	FROM  DEPARTAMENTO as D,FUNCIONARIO AS F
	WHERE @departamento = d.Dnome and f.Dnr = d.Dnumero
	);

-- funcao salario anual
CREATE FUNCTION fn_salarioanual(@cpf VARCHAR(11))
RETURNS @Salarioanual TABLE
(
	NomeCompleto VARCHAR(150),
	SalarioMensal DECIMAL(10,2),
	SalarioAnual DECIMAL(10,2)
)
AS
BEGIN
	INSERT INTO @Salarioanual
	SELECT 
		CONCAT(F.PNOME,' ',F.Minicial,' ',F.Unome),
		F.Salario,
		(F.Salario*13)+F.Salario*0.3
	FROM FUNCIONARIO AS F
	WHERE @cpf = F.Cpf
	RETURN;

END;

-- funão salario anula mais bonus
CREATE FUNCTION fn_SalarioAnulaeBonus(
	@salario DECIMAL(10,2),
	@bonus DECIMAL(5,2)
	)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @SalarioAnual DECIMAL(10,2);
	SET @SalarioAnual = (@salario * 12)*(1 + @bonus/100);

	RETURN @salarioAnual;

END;