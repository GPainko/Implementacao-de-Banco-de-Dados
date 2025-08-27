-- Execute estes comando para a aula de IF/ELSE
-- Adicionando a coluna Bonus
ALTER TABLE FUNCIONARIO
ADD Bonus DECIMAL(10, 2) NULL;

-- Adicionando a coluna Data_Admissao
ALTER TABLE FUNCIONARIO
ADD Data_Admissao DATE NULL;


-- Inserindo novos registros com valores para as colunas Bonus e Data_Admissao
INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Data_Admissao, Bonus)
VALUES
('Carlos', 'A', 'Silva', '98765432100', '1985-04-12', 'Rua A, 123', 'M', 4500.00, NULL, 1, '2023-03-01', 1000.00),
('Ana', 'B', 'Sousa', '98765432200', '1990-06-23', 'Rua B, 456', 'F', 6500.00, '98765432100', 1, '2022-01-15', 0.00),
('Maria', 'C', 'Oliveira', '98765432300', '1978-09-17', 'Rua C, 789', 'F', 7500.00, '98765432200', 5, '2024-02-01', 1500.00),
('Paulo', 'D', 'Silva', '98765432400', '1982-11-05', 'Rua D, 101', 'M', 7000.00, '98765432300', 4, '2024-05-15', 500.00);