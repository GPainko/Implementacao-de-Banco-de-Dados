CREATE DATABASE Biblioteca
USE Biblioteca

/* Lógico_1: */

CREATE TABLE Livro (
    Titulo varchar(100),
    Ano Date,
    ISBN varchar(50) PRIMARY KEY,
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
    fk_Livro_ISBN varchar(50),
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
    REFERENCES Autor (ID);

ALTER TABLE Autor
ALTER COLUMN Nacionalidade varchar(50);

/*INSERINDO DADOS DA TABELA CATEGORIA */
INSERT INTO Categoria(Nome) Values('Literatura Juvenil');
INSERT INTO Categoria(Nome) Values('Humor');
INSERT INTO Categoria(Nome) Values('Ficção Cientifica');

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
INSERT INTO Livro VALUES ('Harry Potter', '2000', 8532511015,1,1);
INSERT INTO Livro VALUES ('As Crônicas de Nárnia', '2009', 9788578270698,2,1);
INSERT INTO Livro VALUES ('O Espadachim de carvão', '2013', 9788577343348,3,3);
INSERT INTO Livro VALUES ('O Papai é pop', '2015',9788581742458,4,2);
INSERT INTO Livro VALUES ('Pior que tá não fica', '2015',9788582302026,5,2);
INSERT INTO Livro VALUES ('Garota Desdobrável', '2015',9788577345670,3,1);
INSERT INTO Livro VALUES ('Harry Potter e o Prisioneiro de azhaban', '2000', 8532512061,1,1);


SELECT C.Codigo, C.Nome
FROM Categoria AS C

SELECT A.ID, A.Nome, A.Nacionalidade
FROM Autor AS A

SELECT E.ID, E.Nome
FROM Editora AS E

SELECT *
FROM Livro AS L

SELECT * 
FROM Livro
ORDER BY Titulo ASC;

SELECT L.*
FROM Livro L
JOIN Categoria C ON L.fk_Categoria_Codigo = C.Codigo
WHERE C.Nome = 'Literatura Juvenil'
ORDER BY L.Ano ASC;