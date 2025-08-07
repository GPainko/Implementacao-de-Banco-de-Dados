# 📊 Comandos SQL no Banco de Dados FUNCIONARIO

Este documento apresenta diversos comandos SQL aplicados à tabela `FUNCIONARIO`, com exemplos e explicações.

---

## 🔍 SELECT: Selecionando todos os dados
```sql
SELECT * FROM FUNCIONARIO;
````

Seleciona todas as colunas de todos os registros da tabela `FUNCIONARIO`.

---

## ✅ DISTINCT: Valores únicos

```sql
SELECT DISTINCT FUNCIONARIO.Salario FROM FUNCIONARIO;
```

Retorna os salários distintos (sem repetição) da tabela `FUNCIONARIO`.

---

## 🎯 WHERE: Filtrando registros

### Por nome:

```sql
SELECT * FROM FUNCIONARIO WHERE Pnome = 'João';
```

Filtra funcionários cujo primeiro nome é "João".

### Por salário:

```sql
SELECT * FROM FUNCIONARIO WHERE Salario = 25000;
```

Filtra funcionários com salário igual a 25.000.

---

## 🔗 AND: Condições compostas (ambas verdadeiras)

```sql
SELECT * FROM FUNCIONARIO WHERE Sexo = 'M' AND Salario >= 30000;
```

Seleciona funcionários do sexo masculino com salário igual ou superior a 30.000.

---

## 🔀 OR: Uma das condições verdadeira

```sql
SELECT * FROM FUNCIONARIO WHERE Endereco LIKE '%São Paulo%' OR Endereco LIKE '%Curitiba%';
```

Seleciona funcionários cujo endereço contenha "São Paulo" ou "Curitiba".

---

## 🚫 NOT: Negação de condição

```sql
SELECT * FROM FUNCIONARIO WHERE NOT Endereco LIKE '%SP';
```

Retorna funcionários cujo endereço **não** termina com "SP".

---

## 📁 ORDER BY: Ordenação

### Ordem crescente:

```sql
SELECT * FROM FUNCIONARIO ORDER BY Pnome ASC;
```

### Ordem decrescente:

```sql
SELECT * FROM FUNCIONARIO ORDER BY Salario DESC;
```

---

## 🕳️ IS NULL / IS NOT NULL: Verificando valores nulos

```sql
SELECT * FROM FUNCIONARIO WHERE Cpf_supervisor IS NULL;
SELECT * FROM FUNCIONARIO WHERE Cpf_supervisor IS NOT NULL;
```

Verifica se o campo `Cpf_supervisor` está ou não definido.

---

## 🥇 SELECT TOP: Selecionar os N primeiros registros

```sql
SELECT TOP 3 * FROM FUNCIONARIO WHERE Cpf_supervisor IS NOT NULL ORDER BY Salario DESC;
```

Seleciona os 3 funcionários com maior salário e que possuem supervisor.

---

## 📉 MIN() / MAX(): Menor e maior valor

### Subconsulta:

```sql
SELECT * FROM FUNCIONARIO WHERE Salario = (SELECT MIN(Salario) FROM FUNCIONARIO);
```

### Usando variável:

```sql
DECLARE @Salario_Min DECIMAL(10,2);
SELECT @Salario_Min = MIN(Salario) FROM FUNCIONARIO;
SELECT * FROM FUNCIONARIO WHERE Salario = @Salario_Min;
```

---

## 🔢 COUNT: Contagem de registros

```sql
SELECT COUNT(*) AS 'TOTAL FUNCIONARIOS' FROM FUNCIONARIO;
```

### Contagem combinada:

```sql
SELECT 
    (SELECT COUNT(*) FROM FUNCIONARIO) +
    (SELECT COUNT(*) FROM DEPENDENTE) AS 'TOTAL PESSOAS';
```

---

## 📊 AVG: Média

```sql
SELECT AVG(Salario) FROM FUNCIONARIO;
```

---

## 💰 SUM: Soma total

```sql
SELECT SUM(Salario) FROM FUNCIONARIO;
```

---

## 📈 Diferença entre maior salário e média

```sql
SELECT 
    (SELECT MAX(Salario) FROM FUNCIONARIO) - 
    (SELECT AVG(Salario) FROM FUNCIONARIO) AS 'DESVIO ACIMA DA MÉDIA';
```

---

## 🔎 LIKE: Padrões

### Filtrando por ano de nascimento:

```sql
DECLARE @AnoNascimento DATE;
SET @AnoNascimento = (SELECT Datanasc FROM FUNCIONARIO WHERE Pnome = 'Joice');
PRINT YEAR(@AnoNascimento);
SELECT * FROM FUNCIONARIO WHERE YEAR(Datanasc) LIKE '__72';
```

Filtra funcionários nascidos em anos que terminam com "72".

---

## 📌 IN: Verificando presença em uma lista

```sql
SELECT * FROM FUNCIONARIO WHERE Salario IN (25000, 30000);
```

---

## 🔄 SUBCONSULTAS com RELACIONAMENTOS

### CPF do Fernando:

```sql
SELECT F.Cpf FROM FUNCIONARIO as F WHERE F.Pnome = 'Fernando';
```

### Horas e projetos de Fernando:

```sql
SELECT TE.HORAS, TE.Pnr FROM TRABALHA_EM AS TE
WHERE TE.Fcpf = (SELECT F.Cpf FROM FUNCIONARIO WHERE Pnome = 'Fernando');
```

---

## 🔗 JOINs: Junções entre tabelas

### Funcionários e os projetos em que trabalham:

```sql
SELECT F.* 
FROM FUNCIONARIO AS F, TRABALHA_EM AS TE
WHERE F.Cpf = TE.Fcpf;
```

### Join com múltiplos filtros:

```sql
SELECT * 
FROM FUNCIONARIO AS F
JOIN TRABALHA_EM AS TE ON TE.Fcpf = F.Cpf
WHERE TE.Pnr IN (
        SELECT Pnr FROM TRABALHA_EM WHERE Fcpf = '33344555587'
    )
AND TE.Horas IN (
        SELECT Horas FROM TRABALHA_EM WHERE Fcpf = '33344555587'
    )
AND NOT F.Pnome = 'Fernando';
```

📌 **Observação final:**
Esses comandos abrangem o uso de filtros, agregações, subconsultas, joins e ordenações, essenciais para manipulação de dados em SQL.
