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

CREATE TABLE "usuarios" (
    "id" INTEGER PRIMARY KEY,
    "email" TEXT NOT NULL COLLATE NOCASE UNIQUE, /* UNIQUE deixa como único o dado inserido, não deixando assim que seja inserido duas ou mais vezes o mesmo dado */
    "nome" TEXT NOT NULL
) STRICT;

INSERT INTO "usuarios" ("email", "nome")
VALUES
    ('ralph@email.com', 'Ralph');

INSERT INTO "usuarios" ("email", "nome")
VALUES
    ('Ralph@email.com', 'Ralph'); /* Erro pois o dado de email está igual ao já inserido, pois na criação da coluna foi colocado COLLATE NOCASE que deixa a coluna case sense */

DROP TABLE "usuarios";

SELECT * FROM "usuarios";

CREATE TABLE "certificados" (
    "id" INTEGER PRIMARY KEY,
    "usuario_id" INTEGER NOT NULL,
    "curso_id" INTEGER NOT NULL,
    UNIQUE ("usuario_id", "curso_id") /* Restringe a uma única vez a inserção do mesmo conjunto de dados */
) STRICT;

INSERT INTO "certificados" ("usuario_id", "curso_id")
VALUES
    (1,1);

SELECT * FROM "certificados";

/*
CREATE TABLE "usuario" (
    "id" INTEGER PRIMARY KEY,
    "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL DEFAULT 'usuario' CHECK ("tipo" IN ('usuario', 'admin')), /* DEFAULT deixa como o padrão se não houver a declaração o valor especificado */
    "vitalicio" TEXT DEFAULT 0 CHECK ("vitalicio" IN (0,1)), /* CHECK verifica se o dado inserido é igual a alguma das opções informados, se não for dará erro */
    "criado" TEXT DEFAULT CURRENT_TIMESTAMP /* CURRENT_TIMESTAMP deixa como padrão se não houver a declaração a data de inserção do dado */
) STRICT; */

DROP TABLE "usuario";

SELECT * FROM "usuario";

INSERT INTO "usuario" ("email", "nome")
VALUES
    ('luiz@email.com', 'Luiz');

INSERT INTO "usuario" ("email", "nome", "tipo", "vitalicio", "criado")
VALUES
    ('ralph@email.com', 'Ralph', 'admin', 1, '03-05-1999');

/* Normalizado (1FN) */
CREATE TABLE "produtos" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
) STRICT;

CREATE TABLE "pedidos" (
    "id" INTEGER PRIMARY KEY,
    "criado" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

CREATE TABLE "pedido_produtos" (
    "pedido_id" INTEGER,
    "produto_id" INTEGER,
    FOREIGN KEY ("pedido_id") REFERENCES "pedidos" ("id"),
    FOREIGN KEY ("produto_id") REFERENCES "produtos" ("id")
) STRICT;

INSERT INTO "produtos" ("nome") VALUES ('Smartphone'), ('Notebook');

INSERT INTO "pedidos" ("id") VALUES (1);

INSERT INTO "pedido_produtos" ("pedido_id", "produto_id") VALUES (1,1), (1,2);

/* Normalizado (2FN) */

DROP TABLE "usuarios";
CREATE TABLE "usuarios" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
) STRICT;

DROP TABLE "cursos";

CREATE TABLE "cursos" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
) STRICT;

DROP TABLE "certificados";

CREATE TABLE "certificados" (
    "usuario_id" INTEGER,
    "curso_id" INTEGER,
    FOREIGN KEY ("usuario_id") REFERENCES "usuarios" ("id"),
    FOREIGN KEY ("curso_id") REFERENCES "cursos" ("id"),
    PRIMARY KEY ("usuario_id", "curso_id")
) STRICT;


DROP TABLE "usuarios";

-- normalizado (3FN)
CREATE TABLE "usuarios" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT,
    "tipo_id" INTEGER,
    FOREIGN KEY ("tipo_id") REFERENCES "tipos" ("id")
) STRICT;

CREATE TABLE "tipos" (
    "id" INTEGER PRIMARY KEY,
    "tipo" TEXT UNIQUE,
    "leitura" INTEGER CHECK ("leitura" IN (0, 1)),
    "escrita" INTEGER CHECK ("escrita" IN (0,1))
) STRICT;


-- Quando temos uma coluna que possui valores geralmente fixos e repetidos, como estados, tipos de usuários, status de pedidos e etc podemos criar uma tabela de referência
CREATE TABLE "status_pedido" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT UNIQUE NOT NULL,
    "cor" TEXT NOT NULL,
    "encerrado" INTEGER NOT NULL CHECK ("encerrado" IN (0,1))
) STRICT;

INSERT INTO "status_pedido" ("nome", "cor", "encerrado")
VALUES
    ('aguardando', '#FFC107', 0),
    ('pago', '#17A2B8', 0),
    ('separado', '#007BFF', 0),
    ('enviado', '#6610F2', 0),
    ('entregue', '#28A745', 1),
    ('cancelado', '#DC3545', 1);