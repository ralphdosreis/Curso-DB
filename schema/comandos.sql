-- database: ./db.sqlite
/*
CREATE TABLE "produtos" (
    "id" INT,
    "descontinuado" TYNYINT,
    "nome" VARCHAR(100),
    "preco" DECIMAL(10,2),
    "descricao" TEXT,
    "data_criacao" DATETIME
);

INSERT INTO "produtos" ("id", "descontinuado", "nome", "preco", "descricao", "data_criacao")
VALUES
    (1,0,'Notebook', 200.5, null, '24-10-2049');

SELECT "id", typeof("descontinuado"), typeof("nome") FROM "produtos"; /* Conversão de tipos com base na afinidade da coluna. https://www.sqlite.org/datatype3.html */

SELECT * FROM "produtos";


INSERT INTO "produtos" ("id", "descontinuado", "nome", "preco", "descricao", "data_criacao")
VALUES
    ('1', '0', 999, '200.5', 100, 2049);

SELECT * FROM "produtos";

SELECT typeof("id"), typeof("descontinuado"), typeof("nome"), typeof("preco"), typeof("descricao"), typeof("data_criacao") FROM "produtos"; /* Conversão de tipos com base no tipo de dados inserido */

CREATE TABLE "cursos" (
    "id" INTEGER,
    "nome" TEXT,
    "preco" INTEGER
) STRICT; /* No modo strict o SQLite impõe regras mais rígidas sobre os tipos de dados */

INSERT INTO "cursos" ("id", "nome", "preco")
VALUES
    ('a', 'HTML', 1000); /* Erro 'a' não é integer */
/* Aceita somente 
INT = Números inteiros
INTEGER = Números inteiros
TEXT = Texto
REAL = Números flutuantes
BLOB = Dados binários
ANY = Qualquer tipo de dado */


CREATE TABLE "cursos2" (
    "id" INTEGER PRIMARY KEY, /* Deve ser única e não nula */
    "nome" TEXT,
    "preco" INTEGER
) STRICT;

INSERT INTO "cursos2" ("nome", "preco")
VALUES
    ('HTML', 1000);

SELECT * FROM "cursos2";

CREATE TABLE "aulas" (
    "curso_id" INTEGER,
    "nome" TEXT
);

INSERT INTO "aulas" ("curso_id", "nome")
VALUES
    (1, 'Fundamentos do CSS');
/* Toda tabela tem uma coluna oculta chamada rowid, que é um identificador único para cada linha.
Se não definir uma chave primária, o SQLite cria automaticamente uma coluna rowid.
Se definir uma coluna como INTEGER PRIMARY KEY, ela se torna um alias para a coluna rowid, isso não acontee caso use INT */

*/
PRAGMA foreign_keys; /* Verifica se a função de chave estrangeria está habilitada para que seja possivel relacionar dados de diferentes tabelas */

CREATE TABLE "cursos" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
) STRICT;

CREATE TABLE "aulas" (
    "id" INTEGER PRIMARY KEY,
    "curso_id" INTEGER,
    "nome" TEXT,
    FOREIGN KEY ("curso_id") REFERENCES "cursos" ("id")
) STRICT;

DROP TABLE "aulas";

INSERT INTO "cursos" ("nome") VALUES ('HTML');

INSERT INTO "aulas" ("curso_id", "nome") VALUES (1, 'Fundamentos do HTML'); /* Procura na tabela referenciada o dado que foi passado aqui.
Neste caso foi passado "curso_id" 1 faz referência ao "id" de "cursos", como os dois são iguais o dado foi inserido */

INSERT INTO "aulas" ("curso_id", "nome") VALUES (5, 'Fundamentos do Javascript'); /* Erro pois não foi encontrado o dado correspondente na tabela de referência */

DROP TABLE "cursos"; /* Erro pois para remover uma tabela que possui chaves estrangeiras, primeiro se deve remover as tabelas pendentes */


CREATE TABLE "aulas" (
    "id" INTEGER PRIMARY KEY,
    "curso_id" INTEGER,
    "nome" TEXT,
    FOREIGN KEY ("curso_id") REFERENCES "cursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE /* Use o CASCADE para remover/atualizar automaticamente
    as linhas dependentes ao remover/atualizar uma linha referenciada */
) STRICT;

DELETE FROM "cursos" WHERE "id" = 1;

UPDATE "cursos" SET "id" = 2 WHERE "id" = 1;