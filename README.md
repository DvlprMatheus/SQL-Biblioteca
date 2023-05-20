# <div align=center> Limpeza no Banco de Dados de uma Biblioteca? </div>
Neste projeto, foi disponibilizado um banco que continha dados de livros de uma biblioteca, e o nosso trabalho era consertar os bugs e fazer uma limpeza para que o sistema seja mais organizado. Contudo, foi utilizado o MySQL Workbench e poderá acompanhar tanto o problema solucionado, quanto o bruto.

## Sumário

- [Coódigo ⭐️](#parte-1)
- [Atividades 🌻](#parte-2)
- [Adicionais ⭐️](#parte-3)

## Parte 1

Aqui é possível visualizar o código bruto sem correções e como foi recebido para poder trabalhar em cima de acordo com o que será pedido nas próximas atividades, confira abaixo:

```
CREATE TABLE Livros (
    livros_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(13),
);

INSERT INTO Livros (id, titulo, autor, editora, ano_publicacao, isbn) VALUES 
(1, 'A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '978-85-8057-346-6'),
(2, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
(3, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
(5, '1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
(6, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');
```

## Parte 2

Após a correção inicial para que ele seja um código testável, você está apto para prosseguir nas atividades de organização e limpeza, dentre elas estão:
 
- Adicione a regra AUTO_INCREMENT para a chave primária remova os dados referentes ao ID dos livros do script de inserção.
- Crie uma tabela para 'Autores' e outra para 'Editoras', para separar essas informações. Elas devem conter chaves primárias para gerar relacionamentos.
- Utilizando ALTER TABLE, elimine as colunas 'autor' e 'editora' da tabela 'Livros' e adicione as colunas 'autor_id' e 'editora_id' para fazer a referências como chave estrangeiras das referidas tabelas.
- Retire os valores para autores e para as editoras do script inicial e insira-os nas novas tabelas.

## Parte 3

Por fim, o script abaixo seria para adicionar novos livros na sua biblioteca, mas com as mudanças feitas para normalização e higienização da base é necessário reestruturar a base para evitar problemas.

```
INSERT INTO 
Livros (identificador, titulo, autor, editora, ano_publicacao, isbn, autor_id, editora_id) 
VALUES 
(7, 'Grande Sertão: Veredas', 'João Guimarães Rosa', 'Nova Fronteira', 1956, '978-85-209-2325-1', 1, 1),
(8, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Companhia das Letras', 1881, '9788535910663', 2, 2),
(9, 'Vidas Secas', 'Graciliano Ramos', 'Companhia Editora Nacional', 1938, '9788572326972', 3, 3),
(10, 'O Alienista', 'Machado de Assis', 'Martin Claret', 1882, '9788572327429', 2, 4),
(11, 'O Cortiço', 'Aluísio Azevedo', 'Penguin Companhia', 1890, '9788579027048', 4, 5),
(12, 'Dom Casmurro', 'Machado de Assis', 'Penguin Companhia', 1899, '9788583862093', 2, 5),
(13, 'Macunaíma', 'Mário de Andrade', 'Companhia Editora Nacional', 1928, '9788503012302', 6, 3);
```
