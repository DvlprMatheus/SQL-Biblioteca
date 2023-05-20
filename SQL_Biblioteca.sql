-- Criação do Banco de Dados
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca;

-- Seleção do Banco de Dados
USE biblioteca;

-- Criação da Tabela "Livros"
CREATE TABLE Livros (
    livros_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(40)
);

-- Alteração da tabela
ALTER TABLE Livros DROP COLUMN autor;
ALTER TABLE Livros DROP COLUMN editora;
ALTER TABLE Livros ADD COLUMN id_autores INT;
ALTER TABLE Livros ADD COLUMN id_editoras INT;

-- Inserção de dados na tabela de livros
INSERT INTO Livros (titulo, ano_publicacao, isbn, id_autores, id_editoras) VALUES 
('A Culpa é das Estrelas', 2012, '978-85-805-7346-6', 1, 1),
('Harry Potter e a Pedra Filosofal', 1997, '978-85-325-1101-0', 2, 2),
('O Senhor dos Anéis: A Sociedade do Anel', 1954, '978-85-336-0314-9', 3, 3),
('The Catcher in the Rye', '1951', '978-03-167-6948-8', 4, 4),
('1984', 1949, '978-85-221-0616-9', 5, 5),
('Percy Jackson e o Ladrão de Raios', 2005, '978-85-980-7835-5', 6, 1);

-- Criação da Tabela "Autores"
CREATE TABLE Autores (
	autores_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_autores VARCHAR(255) NOT NULL
);

-- Criação da Tabela "Editoras"
CREATE TABLE Editoras (
	editoras_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_editoras VARCHAR(255) NOT NULL
);

-- Inserção de dados na tabela de autores
INSERT INTO Autores (nome_autores) VALUES 
('John Green'),
('J.K. Rowling'),
('J.R.R. Tolkien'),
('J.D. Salinger'),
('George Orwell'),
('Rick Riordan');

-- Inserção de dados na tabela editoras
INSERT INTO Editoras (nome_editoras) VALUES
('Intrínseca'),
('Rocco'),
('Martins Fontes'),
('Little, Brown and Company'),
('Companhia Editora Nacional');

-- Adição de mais conteúdo
INSERT INTO  Livros (titulo, ano_publicacao, isbn, id_autores, id_editoras) VALUES 
('Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 7, 6),
('Memórias Póstumas de Brás Cubas' , 1881, '978-85-359-1066-3', 8, 7),
('Vidas Secas', 1938, '978-85-723-2697-2', 9, 8),
('O Alienista', 1882, '978-85-723-2742-9', 8, 9),
('O Cortiço', 1890, '978-85-790-2704-8', 10, 10),
('Dom Casmurro', 1899, '978-85-838-6209-3', 8, 10),
('Macunaíma', 1928, '978-85-030-1230-2', 11, 8);

INSERT INTO Autores (nome_autores) VALUES
('João Guimarães Rosa'),
('Machado de Assis'),
('Graciliano Ramos'),
('Aluísio Azevedo'),
('Mário de Andrade');

INSERT INTO Editoras (nome_editoras) VALUES
('Nova Fronteira'),
('Companhia das Letras'),
('Companhia Editora Nacional'),
('Martin Claret'),
('Penguin Companhia');

-- Adição das chaves estrangeiras
ALTER TABLE Livros ADD FOREIGN KEY (id_autores) references Autores (autores_id) on delete cascade on update cascade;
ALTER TABLE Livros ADD FOREIGN KEY (id_editoras) references Editoras (editoras_id) on delete cascade on update cascade;

SELECT * FROM Livros;