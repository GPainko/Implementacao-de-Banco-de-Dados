# Consulta SQL — Banco de Dados **EMPRESA**

Este documento explica cada uma das consultas realizadas no banco de dados **EMPRESA**, detalhando a função de cada comando e o objetivo da consulta.

---

## 1. Seleção de todas as tabelas

```sql
USE EMPRESA;

SELECT * FROM FUNCIONARIO;
SELECT * FROM PROJETO;
SELECT * FROM DEPARTAMENTO;
````

**Explicação:**

* **`USE EMPRESA;`** — Define que as próximas consultas serão feitas no banco de dados **EMPRESA**.
* **`SELECT * FROM ...`** — Retorna todas as colunas (`*`) de cada tabela listada:

  * `FUNCIONARIO`
  * `PROJETO`
  * `DEPARTAMENTO`

Objetivo: visualizar todos os registros dessas tabelas.

---

## 2. Funcionários do departamento de pesquisa

```sql
SELECT F.Pnome, F.Unome, F.Endereco
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';
```

**Explicação:**

* **`FROM FUNCIONARIO AS F`** — A tabela `FUNCIONARIO` recebe o apelido `F`.
* **`INNER JOIN DEPARTAMENTO AS D`** — Faz junção com a tabela `DEPARTAMENTO` (apelidada como `D`).
* **`ON F.Dnr = D.Dnumero`** — Relaciona o número do departamento do funcionário (`Dnr`) ao número do departamento (`Dnumero`).
* **`WHERE D.Dnome = 'Pesquisa'`** — Filtra apenas os funcionários do departamento "Pesquisa".
* **`SELECT F.Pnome, F.Unome, F.Endereco`** — Mostra apenas o primeiro nome, último nome e endereço.

Objetivo: listar nome e endereço dos funcionários que trabalham no departamento **Pesquisa**.

---

## 3. Funcionários que trabalham no projeto "ProdutoX"

```sql
SELECT f.Pnome, f.Unome
FROM FUNCIONARIO AS F
INNER JOIN TRABALHA_EM AS TE ON TE.Fcpf = F.Cpf
INNER JOIN PROJETO AS P ON TE.Pnr = P.Projnumero
WHERE P.Projnome = 'ProdutoX';
```

**Explicação:**

* **`INNER JOIN TRABALHA_EM AS TE`** — Liga a tabela de funcionários à tabela de relacionamento `TRABALHA_EM`.
* **`ON TE.Fcpf = F.Cpf`** — Relaciona o CPF do funcionário com o CPF registrado na tabela `TRABALHA_EM`.
* **`INNER JOIN PROJETO AS P`** — Liga com a tabela `PROJETO`.
* **`ON TE.Pnr = P.Projnumero`** — Conecta o número do projeto na tabela de vínculo (`TRABALHA_EM`) ao número do projeto na tabela `PROJETO`.
* **`WHERE P.Projnome = 'ProdutoX'`** — Filtra apenas registros do projeto **ProdutoX**.
* **`SELECT f.Pnome, f.Unome`** — Exibe apenas o primeiro e último nome.

Objetivo: listar os nomes dos funcionários que trabalham no projeto **ProdutoX**.

---

## 4. Projetos localizados em Mauá

```sql
SELECT P.Projnumero, P.Projnome, D.Dnome, D.Dnumero, F.Unome, F.Datanasc
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D ON D.Cpf_gerente = F.Cpf
INNER JOIN PROJETO AS P ON P.Dnum = D.Dnumero
INNER JOIN LOCALIZACAO_DEP AS LD ON LD.Dnumero = D.Dnumero
WHERE LD.Dlocal = 'Mauá';
```

**Explicação:**

* **`INNER JOIN DEPARTAMENTO AS D ON D.Cpf_gerente = F.Cpf`** — Relaciona cada departamento ao gerente responsável (identificado pelo CPF).
* **`INNER JOIN PROJETO AS P ON P.Dnum = D.Dnumero`** — Relaciona os projetos aos departamentos responsáveis.
* **`INNER JOIN LOCALIZACAO_DEP AS LD ON LD.Dnumero = D.Dnumero`** — Obtém a localização física do departamento.
* **`WHERE LD.Dlocal = 'Mauá'`** — Filtra apenas departamentos localizados em **Mauá**.
* **`SELECT`** — Retorna:

  * `P.Projnumero` — número do projeto
  * `P.Projnome` — nome do projeto
  * `D.Dnome` — nome do departamento
  * `D.Dnumero` — número do departamento
  * `F.Unome` — sobrenome do gerente
  * `F.Datanasc` — data de nascimento do gerente

Objetivo: listar os projetos desenvolvidos em departamentos localizados na cidade de **Mauá**, incluindo informações sobre o gerente.

---

## Resumo das Consultas

| Consulta | Objetivo                                                          |
| -------- | ----------------------------------------------------------------- |
| 1        | Listar todos os registros das tabelas principais                  |
| 2        | Mostrar funcionários do departamento "Pesquisa"                   |
| 3        | Mostrar funcionários que trabalham no projeto "ProdutoX"          |
| 4        | Mostrar projetos localizados em "Mauá" com informações do gerente |

# Consultas SQL — Relacionamentos e Filtros Específicos

Este documento explica as consultas realizadas no banco de dados **EMPRESA**, destacando uso de **JOINs**, filtragens com **NULL** e subconsultas.

---

## 1. Funcionários sem supervisor

```sql
SELECT *
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor IS NULL;
````

**Explicação:**

* Seleciona todos os campos da tabela `FUNCIONARIO`.
* **`WHERE F.Cpf_supervisor IS NULL`** filtra funcionários que **não possuem supervisor cadastrado** (campo nulo).

**Objetivo:** identificar funcionários no topo da hierarquia (provavelmente gerentes ou diretores).

---

## 2. Funcionário e nome do seu gerente

```sql
SELECT F.Pnome AS 'Funcionario_Nome', G.Pnome 'Gerente_Nome'
FROM FUNCIONARIO AS F
LEFT JOIN FUNCIONARIO AS G ON F.Cpf_supervisor = G.Cpf;
```

**Explicação:**

* **`LEFT JOIN`** junta a tabela `FUNCIONARIO` (apelidada como `F`) com ela mesma (`G`) para relacionar **funcionário → gerente**.
* O relacionamento é feito por **`F.Cpf_supervisor = G.Cpf`**.
* `AS 'Funcionario_Nome'` e `AS 'Gerente_Nome'` são **aliases** para clareza.
* O uso de **LEFT JOIN** garante que todos os funcionários apareçam, mesmo os que não têm gerente (nesse caso, o campo `Gerente_Nome` ficará nulo).

**Objetivo:** listar todos os funcionários e o nome do gerente responsável.

---

## 3. Departamentos sem funcionários

```sql
SELECT *
FROM DEPARTAMENTO AS D
LEFT JOIN FUNCIONARIO AS F ON F.Dnr = D.Dnumero
WHERE F.Cpf IS NULL;
```

**Explicação:**

* **`LEFT JOIN`** retorna todos os departamentos (`D`), mesmo que não tenham correspondência na tabela `FUNCIONARIO`.
* O relacionamento é feito por **`F.Dnr = D.Dnumero`**.
* **`WHERE F.Cpf IS NULL`** filtra apenas os departamentos sem nenhum funcionário associado.

**Objetivo:** identificar departamentos que não têm funcionários alocados.

---

## 4. Funcionários sem dependentes

```sql
SELECT F.Pnome
FROM DEPENDENTE AS DE
RIGHT JOIN FUNCIONARIO AS F ON F.Cpf = DE.Fcpf
WHERE DE.Fcpf IS NULL;
```

**Explicação:**

* **`RIGHT JOIN`** garante que todos os funcionários (`F`) sejam listados, mesmo que não tenham dependentes na tabela `DEPENDENTE`.
* O relacionamento é feito por **`F.Cpf = DE.Fcpf`**.
* **`WHERE DE.Fcpf IS NULL`** filtra apenas funcionários que não possuem dependentes.

**Objetivo:** mostrar o nome dos funcionários sem nenhum dependente registrado.

---

## 5. Departamentos sem funcionários (usando subconsulta)

```sql
SELECT *
FROM DEPARTAMENTO AS D
WHERE D.Dnumero NOT IN (
    SELECT DISTINCT F.DNR
    FROM FUNCIONARIO AS F
    WHERE F.Dnr IS NOT NULL
);
```

**Explicação:**

* A **subconsulta** interna:

  ```sql
  SELECT DISTINCT F.DNR
  FROM FUNCIONARIO AS F
  WHERE F.Dnr IS NOT NULL
  ```

  retorna todos os números de departamento que têm pelo menos um funcionário.
* **`NOT IN`** no comando principal seleciona apenas os departamentos que **não** estão nessa lista.

**Objetivo:** listar departamentos que não possuem funcionários, mas usando **subconsulta** em vez de **JOIN**.

---

## Resumo das Consultas

| Consulta | Objetivo                                               |
| -------- | ------------------------------------------------------ |
| 1        | Listar funcionários sem supervisor                     |
| 2        | Listar funcionários e seus respectivos gerentes        |
| 3        | Encontrar departamentos sem funcionários (LEFT JOIN)   |
| 4        | Listar funcionários sem dependentes                    |
| 5        | Encontrar departamentos sem funcionários (Subconsulta) |

## 6. Departamentos sem funcionários (usando `NOT EXISTS`)

```sql
SELECT *
FROM DEPARTAMENTO AS D
WHERE NOT EXISTS (
    SELECT 1
    FROM FUNCIONARIO AS F
    WHERE F.Dnr = D.Dnumero
);
````

**Explicação:**

* **`NOT EXISTS`** verifica se **não existe** nenhum registro na subconsulta para aquele departamento.
* A subconsulta:

  ```sql
  SELECT 1
  FROM FUNCIONARIO AS F
  WHERE F.Dnr = D.Dnumero
  ```

  busca qualquer funcionário (`F`) cujo número de departamento (`Dnr`) seja igual ao número do departamento atual (`D.Dnumero`).
* Se **não encontrar nenhum funcionário**, o departamento será retornado na consulta principal.

**Objetivo:** listar todos os departamentos que **não possuem funcionários**, utilizando a cláusula `NOT EXISTS` como alternativa ao `LEFT JOIN ... WHERE IS NULL` ou `NOT IN`.
