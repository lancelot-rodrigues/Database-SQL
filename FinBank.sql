CREATE DATABASE FinBank;
USE Finbank;
-- Criação da tabela Departamentos
CREATE TABLE Departamentos (
    ID_Departamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Departamento VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(100) NOT NULL,
    Gerente_Departamento VARCHAR(100)
);

-- Criação da tabela Colaboradores
CREATE TABLE Colaboradores (
    ID_Colaborador INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    ID_Departamento INT,
    Data_Contratacao DATE NOT NULL,
    Cargo VARCHAR(100),
    Status ENUM('Ativo', 'Desligado') DEFAULT 'Ativo',
    FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID_Departamento)
);

-- Criação da tabela Salários
CREATE TABLE Salarios (
    ID_Salario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Colaborador INT,
    Salario_Base DECIMAL(10, 2) NOT NULL,
    Bonus DECIMAL(10, 2) DEFAULT 0.00,
    Descontos DECIMAL(10, 2) DEFAULT 0.00,
    Salario_Liquido DECIMAL(10, 2) AS (Salario_Base + Bonus - Descontos) STORED,
    Data_Pagamento DATE NOT NULL,
    FOREIGN KEY (ID_Colaborador) REFERENCES Colaboradores(ID_Colaborador)
);

INSERT INTO Departamentos (Nome_Departamento, Localizacao, Gerente_Departamento)
VALUES 
('TI', 'São Paulo', 'Maria Oliveira'),
('Finanças', 'São Paulo', 'João Mendes'),
('Marketing', 'Rio de Janeiro', 'Carla Souza'),
('Recursos Humanos', 'São Paulo', 'Ana Lima'),
('Operações', 'Belo Horizonte', 'Pedro Costa');

INSERT INTO Colaboradores (Nome, CPF, Data_Nascimento, Email, ID_Departamento, Data_Contratacao, Cargo, Status)
VALUES
('Carlos Silva', '123.456.789-00', '1990-05-15', 'carlos@finbank.com', 1, '2015-03-20', 'Analista de Sistemas', 'Ativo'),
('Fernanda Almeida', '987.654.321-00', '1988-09-22', 'fernanda@finbank.com', 2, '2013-08-15', 'Gerente Financeiro', 'Ativo'),
('Roberto Santos', '456.123.789-11', '1992-11-12', 'roberto@finbank.com', 3, '2019-01-10', 'Analista de Marketing', 'Ativo'),
('Mariana Costa', '789.456.123-22', '1995-06-08', 'mariana@finbank.com', 4, '2020-02-25', 'Especialista de RH', 'Ativo'),
('Paulo Castro', '321.987.654-34', '1985-12-30', 'paulo@finbank.com', 5, '2010-07-05', 'Coordenador de Operações', 'Ativo'),
('Luciana Menezes', '654.321.987-44', '1993-03-14', 'luciana@finbank.com', 1, '2017-05-10', 'Desenvolvedora Backend', 'Ativo'),
('Gustavo Nogueira', '789.123.456-55', '1990-09-18', 'gustavo@finbank.com', 2, '2018-06-30', 'Analista Financeiro', 'Ativo'),
('Ana Paula Souza', '456.789.123-66', '1997-02-01', 'ana@finbank.com', 3, '2021-01-15', 'Designer Gráfico', 'Ativo'),
('Ricardo Lopes', '321.456.789-77', '1988-10-10', 'ricardo@finbank.com', 4, '2016-12-20', 'Recrutador', 'Ativo'),
('Camila Duarte', '987.123.654-88', '1994-07-23', 'camila@finbank.com', 5, '2014-09-01', 'Supervisor de Operações', 'Ativo'),
('Thiago Oliveira', '123.654.987-99', '1986-05-12', 'thiago@finbank.com', 1, '2013-11-18', 'Arquiteto de Soluções', 'Ativo'),
('Isabela Fernandes', '654.987.321-00', '1995-01-19', 'isabela@finbank.com', 2, '2020-04-10', 'Analista Contábil', 'Ativo'),
('Rafael Torres', '456.321.654-11', '1991-08-25', 'rafael@finbank.com', 3, '2015-07-01', 'Especialista em SEO', 'Ativo'),
('Juliana Martins', '789.654.123-22', '1993-12-02', 'juliana@finbank.com', 4, '2017-02-28', 'Coordenadora de RH', 'Ativo'),
('André Santos', '321.987.654-33', '1990-06-06', 'andre@finbank.com', 5, '2018-08-15', 'Operador de Logística', 'Ativo'),
('Patrícia Lima', '987.654.321-44', '1992-09-13', 'patricia@finbank.com', 1, '2021-03-20', 'DevOps Engineer', 'Ativo'),
('Leonardo Almeida', '123.456.987-55', '1989-04-17', 'leonardo@finbank.com', 2, '2010-12-05', 'Analista Econômico', 'Ativo'),
('Marcela Moura', '654.321.123-66', '1996-07-29', 'marcela@finbank.com', 3, '2020-07-18', 'Analista de Comunicação', 'Ativo'),
('Bruno Ferreira', '987.123.456-77', '1992-11-20', 'bruno@finbank.com', 4, '2012-06-11', 'Gerente de Talentos', 'Ativo'),
('Renata Campos', '321.456.123-88', '1994-03-09', 'renata@finbank.com', 5, '2019-10-01', 'Supervisor de Processos', 'Ativo'),
('Victor Andrade', '654.987.456-99', '1991-01-15', 'victor@finbank.com', 1, '2018-11-10', 'Engenheiro de Dados', 'Ativo'),
('Tatiana Farias', '789.123.654-00', '1987-02-22', 'tatiana@finbank.com', 2, '2013-09-05', 'Analista de Crédito', 'Ativo'),
('Eduardo Neves', '987.456.321-11', '1995-11-25', 'eduardo@finbank.com', 3, '2017-08-30', 'Especialista de Branding', 'Ativo'),
('Clara Santos', '123.789.456-22', '1998-04-10', 'clara@finbank.com', 4, '2021-11-15', 'Assistente de RH', 'Ativo'),
('Felipe Costa', '456.123.789-33', '1994-10-21', 'felipe@finbank.com', 5, '2014-01-07', 'Supervisor de Logística', 'Ativo'),
('André Silva', '111.222.333-44', '1980-05-12', 'andre.silva@finbank.com', 1, '2015-03-01', 'Gerente de Finanças', 'Ativo'),
('Mariana Costa', '222.333.444-55', '1985-09-18', 'mariana.costa@finbank.com', 2, '2017-06-15', 'Gerente de Crédito', 'Ativo'),
('Rodrigo Almeida', '333.444.555-66', '1983-07-23', 'rodrigo.almeida@finbank.com', 3, '2016-08-20', 'Gerente de Marketing', 'Ativo'),
('Fernanda Torres', '444.555.666-77', '1978-12-05', 'fernanda.torres@finbank.com', 4, '2014-01-10', 'Gerente de RH', 'Ativo'),
('Carlos Ferreira', '555.666.777-88', '1982-03-30', 'carlos.ferreira@finbank.com', 5, '2013-11-25', 'Gerente de Logística', 'Ativo');

INSERT INTO Salarios (ID_Colaborador, Salario_Base, Bonus, Descontos, Data_Pagamento)
VALUES
(1, 8000.00, 1000.00, 500.00, '2024-01-10'),
(2, 12000.00, 2000.00, 700.00, '2024-01-10'),
(3, 7000.00, 800.00, 300.00, '2024-01-10'),
(4, 6000.00, 500.00, 200.00, '2024-01-10'),
(5, 10000.00, 1500.00, 800.00, '2024-01-10'),
(6, 9500.00, 1200.00, 400.00, '2024-01-10'),
(7, 7000.00, 800.00, 300.00, '2024-01-10'),
(8, 6500.00, 500.00, 200.00, '2024-01-10'),
(9, 5500.00, 400.00, 150.00, '2024-01-10'),
(10, 8500.00, 1000.00, 500.00, '2024-01-10'),
(11, 12000.00, 2000.00, 700.00, '2024-01-10'),
(12, 7500.00, 900.00, 400.00, '2024-01-10'),
(13, 9000.00, 1000.00, 600.00, '2024-01-10'),
(14, 7000.00, 800.00, 300.00, '2024-01-10'),
(15, 5500.00, 400.00, 150.00, '2024-01-10'),
(16, 8500.00, 1000.00, 500.00, '2024-01-10'),
(17, 12000.00, 2000.00, 700.00, '2024-01-10'),
(18, 7500.00, 900.00, 400.00, '2024-01-10'),
(19, 9000.00, 1000.00, 600.00, '2024-01-10'),
(20, 7000.00, 800.00, 300.00, '2024-01-10'),
(21, 8500.00, 1200.00, 500.00, '2024-01-10'),
(22, 6500.00, 800.00, 450.00, '2024-01-10'),
(23, 7200.00, 1000.00, 400.00, '2024-01-10'),
(24, 3500.00, 500.00, 300.00, '2024-01-10'),
(25, 5800.00, 900.00, 350.00, '2024-01-10'),
(26, 15000.00, 3000.00, 1000.00, '2024-01-10'),
(27, 14000.00, 2500.00, 900.00, '2024-01-10'),
(28, 13500.00, 2000.00, 850.00, '2024-01-10'),
(29, 13000.00, 2200.00, 800.00, '2024-01-10'),
(30, 14500.00, 2800.00, 950.00, '2024-01-10');



INSERT INTO colaboradores (nome, cpf, data_nascimento, email, id_departamento, data_contratacao, cargo, status)
VALUES ('Lucas Silva', '123.456.789-10', '1985-06-15', 'lucas.silva@email.com', 
        (SELECT id_departamento FROM departamentos WHERE nome_departamento = 'TI'), 
        '2025-01-16', 'Analista de TI', 'Ativo');
        
INSERT INTO salarios (id_colaborador, salario_base, bonus, descontos, data_pagamento)
VALUES ((SELECT id_colaborador FROM colaboradores WHERE nome = 'Lucas Silva'), 4000, 500, 200, '2025-02-01');


DELETE FROM salarios WHERE id_colaborador = (SELECT id_colaborador FROM colaboradores WHERE nome = 'Lucas Silva');
DELETE FROM colaboradores WHERE nome = 'Lucas Silva';






