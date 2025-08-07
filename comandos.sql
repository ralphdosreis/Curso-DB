-- database: ./db.sqlite

CREATE TABLE usuarios (id, nome);

INSERT INTO usuarios (id, nome) VALUES (1,'Ralph');

SELECT * FROM usuarios;


CREATE TABLE cursos (id, titulo);

INSERT INTO cursos (id, titulo) VALUES (1, 'CSS');


DROP TABLE usuarios; /* Deleta a tabela */

DROP TABLE cursos;

CREATE TABLE cursos (id, nome, aulas);

DROP TABLE cursos;

CREATE TABLE cursos ( /* Cria a tabela com as colunas com o dados passados, do tipos passados.
INTEGER == número; TEXT == texto e NOT NULL == Não pode ser inválido */
    id INTEGER NOT NULL, nome TEXT NOT NULL, aulas INTEGER
);


PRAGMA table_info('cursos'); /* Verifica as características da tabela */

CREATE TABLE pessoas (id, nome);

SELECT * FROM cursos; /* Seleciona todas as colunas * da tabela */

SELECT * FROM pessoas;

DROP TABLE pessoas;

DROP TABLE usuarios;

CREATE TABLE usuarios (id, nome);

SELECT * FROM usuarios;

INSERT INTO cursos (id, nome, aulas) VALUES (1, 'HTML', 10); /* Insere os valores nas colunas corespondentes da tabela */

SELECT * FROM cursos;


/* Aspas simples '' são usadas para strings, aspas duplas "" para identificadores como nomes de colunas ou tabelas. Números são definidos sem aspas. */

INSERT INTO "cursos" ("id", "nome", "aulas") VALUES (2, 'JavaScript', 10);

INSERT INTO "cursos" ("id", "nome", "aulas") VALUES (3, 'CSS', 20), (4, 'React', 30), (5, 'SQLite', 15); /* Insere múltiplos registros na tabela */

DELETE FROM "cursos"; /* Deleta todas as linhas da tabela */

INSERT INTO "cursos" ("id", "nome", "aulas") VALUES (1, 'HTML', 10), (2,'CSS', 15), (3, 'JavaScript', 25), (4, 'React', 20);

DELETE FROM "cursos" WHERE "id" = 1; /* Deleta a linha onde o dado correspondente é igual ao passado */

SELECT "id", "nome" FROM "cursos";  /* Seleciona as colunas solicitadas da tabela */

INSERT INTO "cursos" ("id", "nome", "aulas") VALUES (1, 'HTML', 10);

SELECT "id", "nome" FROM "cursos" LIMIT 3; /* Limita a Query à quantidade de itens informados */


SELECT * FROM "cursos";

SELECT * FROM "cursos" WHERE "id" = 1; /* Filtra as linhas da tabela com base na condição passada. Ex.: >, <, =, >=, <=, != */

SELECT * FROM "cursos" WHERE "id" = 2 AND "aulas" > 10; /* AND todas as condições devem ser verdadeiras */

SELECT * FROM "cursos" WHERE "id" = 2 OR "aulas" > 10; /* OR pelo menos uma das condições deve ser verdadeira */

UPDATE "cursos" SET "nome" = 'HTML para iniciantes', "aulas" = 20 WHERE "id" = 1; /* Atualiza as colunas "nome" e "aulas" da tabela cursos onde o id é igual a 1 */