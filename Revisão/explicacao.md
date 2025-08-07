# 📚 Banco de Dados: Biblioteca

Este script cria e popula um banco de dados fictício chamado **Biblioteca**, com informações sobre livros, autores, editoras e categorias.

---

## 🏗️ Criação do Banco e Seleção

```sql
CREATE DATABASE Biblioteca
USE Biblioteca
````

Cria o banco de dados `Biblioteca` e define que ele será utilizado nas próximas operações.

---

## 🧱 Criação das Tabelas

### 📘 Livro

```sql
CREATE TABLE Livro (
    Titulo varchar(100),
    Ano Date,
    ISBN varchar(50) PRIMARY KEY,
    fk_Editora_ID int,
    fk_Categoria_Codigo int
);
```

Armazena dados dos livros, com chave primária sendo o `ISBN`.

---

### 👤 Autor

```sql
CREATE TABLE Autor (
    Nome varchar(50),
    ID int PRIMARY KEY IDENTITY,
    Nacionalidade varchar
);
```

Armazena autores. `ID` é gerado automaticamente (`IDENTITY`).

---

### 🏷️ Categoria

```sql
CREATE TABLE Categoria (
    Nome varchar(50),
    Codigo int PRIMARY KEY IDENTITY
);
```

Define categorias literárias, com `Codigo` como chave primária.

---

### 🏢 Editora

```sql
CREATE TABLE Editora (
    Nome varchar(50),
    ID int PRIMARY KEY IDENTITY
);
```

Contém editoras cadastradas.

---

### ✍️ Livro\_autor\_Escrito

```sql
CREATE TABLE Livro_autor_Escrito (
    fk_Livro_ISBN varchar(50),
    fk_Autor_IDautor int
);
```

Tabela associativa entre livros e autores (muitos-para-muitos).

---

## 🔗 Relacionamentos (FOREIGN KEYS)

```sql
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Editora_ID) REFERENCES Editora(ID) ON DELETE CASCADE;

ALTER TABLE Livro ADD CONSTRAINT FK_Livro_3
    FOREIGN KEY (fk_Categoria_Codigo) REFERENCES Categoria(Codigo) ON DELETE CASCADE;

ALTER TABLE Livro_autor_Escrito ADD CONSTRAINT FK_Livro_autor_Escrito_1
    FOREIGN KEY (fk_Livro_ISBN) REFERENCES Livro(ISBN);

ALTER TABLE Livro_autor_Escrito ADD CONSTRAINT FK_Livro_autor_Escrito_2
    FOREIGN KEY (fk_Autor_IDautor) REFERENCES Autor(ID);
```

Define chaves estrangeiras com **deleção em cascata** para manter integridade referencial.

---

### 🛠️ Correção de Tipo

```sql
ALTER TABLE Autor
ALTER COLUMN Nacionalidade varchar(50);
```

Corrige o tipo da coluna `Nacionalidade`.

---

## ✍️ Inserção de Dados

### 📂 Categoria

```sql
INSERT INTO Categoria(Nome) Values('Literatura Juvenil');
INSERT INTO Categoria(Nome) Values('Humor');
INSERT INTO Categoria(Nome) Values('Ficção Cientifica');
```

---

### 👤 Autor

```sql
INSERT INTO Autor VALUES ('J.K.ROWLING','Inglaterra');
INSERT INTO Autor VALUES ('Clive Staples Lewis','Inglaterra');
INSERT INTO Autor VALUES ('Affonso Solano','Brasil');
INSERT INTO Autor VALUES ('Marcos Piangers','Brasil');
INSERT INTO Autor VALUES ('Ciro Botelho','Brasil');
INSERT INTO Autor VALUES ('Bianca Mol','Brasil');
```

---

### 🏢 Editora

```sql
INSERT INTO Editora(Nome) VALUES ('Rocco');
INSERT INTO Editora(Nome) VALUES ('Wmf Martins Fontes');
INSERT INTO Editora(Nome) VALUES ('Casa da palavra');
INSERT INTO Editora(Nome) VALUES ('Belas letras');
INSERT INTO Editora(Nome) VALUES ('Matrix');
```

---

### 📘 Livro

```sql
INSERT INTO Livro VALUES ('Harry Potter', '2000', 8532511015, 1, 1);
INSERT INTO Livro VALUES ('As Crônicas de Nárnia', '2009', 9788578270698, 2, 1);
INSERT INTO Livro VALUES ('O Espadachim de carvão', '2013', 9788577343348, 3, 3);
INSERT INTO Livro VALUES ('O Papai é pop', '2015', 9788581742458, 4, 2);
INSERT INTO Livro VALUES ('Pior que tá não fica', '2015', 9788582302026, 5, 2);
INSERT INTO Livro VALUES ('Garota Desdobrável', '2015', 9788577345670, 3, 1);
INSERT INTO Livro VALUES ('Harry Potter e o Prisioneiro de Azkaban', '2000', 8532512061, 1, 1);
```

---

## 🔎 Consultas

### 📚 Listar Categorias

```sql
SELECT C.Codigo, C.Nome
FROM Categoria AS C;
```

---

### 👤 Listar Autores

```sql
SELECT A.ID, A.Nome, A.Nacionalidade
FROM Autor AS A;
```

---

### 🏢 Listar Editoras

```sql
SELECT E.ID, E.Nome
FROM Editora AS E;
```

---

### 📘 Listar Todos os Livros

```sql
SELECT * FROM Livro AS L;
```

---

### 📘 Livros Ordenados por Título

```sql
SELECT * FROM Livro
ORDER BY Titulo ASC;
```

---

### 📚 Livros da Categoria "Literatura Juvenil"

```sql
SELECT L.*
FROM Livro L
JOIN Categoria C ON L.fk_Categoria_Codigo = C.Codigo
WHERE C.Nome = 'Literatura Juvenil'
ORDER BY L.Ano ASC;
```

---

## ✅ Observações

* O modelo segue o estilo **relacional normalizado**, com uso de tabelas associativas para representar relacionamentos N\:N.
* A cláusula `ON DELETE CASCADE` garante que, ao remover uma `Editora` ou `Categoria`, os livros associados também serão removidos automaticamente.
* O relacionamento entre `Livro` e `Autor` é feito através da tabela `Livro_autor_Escrito`.
