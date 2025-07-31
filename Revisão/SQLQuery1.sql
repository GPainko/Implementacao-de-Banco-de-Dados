CREATE DATABASE Biblioteca

USE Biblioteca

/* Lógico_1: */

CREATE TABLE Livro (
    Titulo varchar(100),
    Ano Date,
    ISBN int PRIMARY KEY,
    fk_Editora_ID int,
    fk_Categoria_Codigo int
);

CREATE TABLE Autor (
    Nome varchar(50),
    ID int PRIMARY KEY IDENTITY,
    Nacionalidade varchar
);

CREATE TABLE Categoria (
    Nome varchar(50),
    Codigo int PRIMARY KEY IDENTITY
);

CREATE TABLE Editora (
    Nome varchar(50),
    ID int PRIMARY KEY IDENTITY
);

CREATE TABLE Livro_autor_Escrito (
    fk_Livro_ISBN int,
    fk_Autor_IDautor int
);
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Editora_ID)
    REFERENCES Editora (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_3
    FOREIGN KEY (fk_Categoria_Codigo)
    REFERENCES Categoria (Codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Livro_autor_Escrito ADD CONSTRAINT FK_Livro_autor_Escrito_1
    FOREIGN KEY (fk_Livro_ISBN)
    REFERENCES Livro (ISBN);
 
ALTER TABLE Livro_autor_Escrito ADD CONSTRAINT FK_Livro_autor_Escrito_2
    FOREIGN KEY (fk_Autor_IDautor)
    REFERENCES Autor (IDautor);

ALTER TABLE Autor
ALTER COLUMN Nacionalidade varchar(50);

/*INSERINDO DADOS DA TABELA CATEGORIA */
INSERT INTO Categoria(Nome) Values('Literatura Juvenil');
INSERT INTO Categoria(Nome) Values('Humor');

/*INSERINDO DADOS DA TABELA AUTOR */
INSERT INTO Autor VALUES ('J.K.ROWLING','Ingalterra');
INSERT INTO Autor VALUES ('Clive Staples Lewis','Ingalterra');
INSERT INTO Autor VALUES ('Affonso Solano','Brasil');
INSERT INTO Autor VALUES ('Marcos Piangers','Brasil');
INSERT INTO Autor VALUES ('Ciro Botelho','Brasil');
INSERT INTO Autor VALUES ('Bianca Mol','Brasil');

/*INSERINDO DADOS DA TABELA Editora */

INSERT INTO Editora(Nome) VALUES ('Rocco');
INSERT INTO Editora(Nome) VALUES ('Wmf Martins Fontes');
INSERT INTO Editora(Nome) VALUES ('Casa da palavra');
INSERT INTO Editora(Nome) VALUES ('Belas letras');
INSERT INTO Editora(Nome) VALUES ('Matrix');

/*INSERINDO DADOS DA TABELA Livro */

INSERT INTO Livro VALUES (;

SELECT C.Codigo, C.Nome
FROM Categoria AS C
WHERE C.Nome LIKE '%JUVE%'

SELECT A.ID, A.Nome, A.Nacionalidade
FROM Autor AS A

SELECT E.ID, E.Nome
FROM Editora AS E

SELECT *
FROM Livro AS L