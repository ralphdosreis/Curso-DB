-- database: ./db.sqlite

CREATE TABLE "produtos" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "categoria" TEXT,
    "preco" INTEGER NOT NULL,
    "taxa_importacao" INTEGER NOT NULL DEFAULT 0,
    "estoque" INTEGER NOT NULL DEFAULT 0,
    "lancamento" INTEGER DEFAULT 1 CHECK ("lancamento" IN (0,1)),
    "criado" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "produtos" ("nome","categoria","preco","taxa_importacao","estoque","lancamento","criado") VALUES
('Fone Bluetooth','audio',19900,0,150,0,'2048-01-16 10:12:34'),
('Teclado Mecânico','periferico',34900,6500,20,0,'2048-02-02 09:45:10'),
('Mouse Gamer Pro','periferico',24900,0,120,0,'2048-02-21 14:05:28'),
('Monitor 27 4K','monitor',219900,9000,40,0,'2048-03-06 11:23:57'),
('Hub USB-C','acessorio',9900,0,200,0,'2048-03-11 08:47:13'),
('Webcam 1080p','video',17900,3500,110,0,'2048-04-01 16:32:40'),
('SSD NVMe 1TB','armazenamento',57900,0,70,0,'2048-04-19 13:21:05'),
('Cadeira Ergonômica',null,139900,12000,0,0,'2048-05-03 09:14:22'),
('Notebook 14 1TB','notebook',429900,0,30,0,'2048-05-16 10:55:31'),
('Ring Light LED',null,8900,0,5,0,'2049-06-02 12:06:09'),
('Smartwatch',null,79900,8000,90,0,'2049-06-21 15:44:18'),
('Carregador GaN','energia',15900,0,140,0,'2049-07-06 11:12:47'),
('Notebook 16 2TB','notebook',529900,0,37,0,'2049-05-16 10:55:31'),
('Power Bank 20000 mAh','energia',22900,0,130,1,'2049-07-23 17:03:59'),
('Óculos 3D Pro','acessorio',21900,0,110,1,'2049-07-26 17:03:59'),
('Headset ANC Pro','audio',99900,11000,60,1,'2049-08-11 10:28:36'),
('Placa-mãe Z790','hardware',189900,0,35,1,'2049-09-02 09:49:52'),
('Processador X9-5600','hardware',159900,9500,50,0,'2049-09-19 14:17:08'),
('Processador X11-5600','hardware',199900,9500,50,0,'2049-10-01 14:17:08'),
('Impressora 3D Mini','impressora',249900,0,20,0,'2049-10-06 08:38:41'),
('Alto-falante WiFi Pro','audio',34900,0,100,0,'2049-11-02 16:25:55'),
('Câmera de Ação 4K','video',89900,7000,45,0,'2049-11-21 13:56:12'),
('Roteador WiFi 6E','rede',64900,0,75,0,'2049-12-06 11:11:11'),
('Webcam 1080p','video',17900,3500,110,0,'2048-04-01 16:32:40'),
('SSD NVMe 1TB','armazenamento',57900,0,70,0,'2048-04-19 13:21:05'),
('Cadeira Ergonômica',null,139900,12000,0,0,'2048-05-03 09:14:22'),
('Notebook 14 1TB','notebook',429900,0,30,0,'2048-05-16 10:55:31'),
('Ring Light LED',null,8900,0,5,0,'2049-06-02 12:06:09'),
('Smartwatch',null,79900,8000,90,0,'2049-06-21 15:44:18'),
('Carregador GaN','energia',15900,0,140,0,'2049-07-06 11:12:47'),
('Notebook 16 2TB','notebook',529900,0,37,0,'2049-05-16 10:55:31'),
('Power Bank 20000 mAh','energia',22900,0,130,1,'2049-07-23 17:03:59'),
('Óculos 3D Pro','acessorio',21900,0,110,1,'2049-07-26 17:03:59'),
('Headset ANC Pro','audio',99900,11000,60,1,'2049-08-11 10:28:36'),
('Placa-mãe Z790','hardware',189900,0,35,1,'2049-09-02 09:49:52'),
('Processador X9-5600','hardware',159900,9500,50,0,'2049-09-19 14:17:08'),
('Processador X11-5600','hardware',199900,9500,50,0,'2049-10-01 14:17:08'),
('Impressora 3D Mini','impressora',249900,0,20,0,'2049-10-06 08:38:41'),
('Alto-falante WiFi Pro','audio',34900,0,100,0,'2049-11-02 16:25:55'),
('Câmera de Ação 4K','video',89900,7000,45,0,'2049-11-21 13:56:12'),
('Roteador WiFi 6E','rede',64900,0,75,0,'2049-12-06 11:11:11');

SELECT * FROM "produtos";

SELECT * FROM "produtos" WHERE "preco" < 50000;

SELECT * FROM "produtos" WHERE "lancamento" != 0;

SELECT * FROM "produtos" WHERE ("preco" + "taxa_importacao") < 40000; -- Operações matemáticas com dados da tabela

SELECT * FROM "produtos" WHERE "id" = 3;

SELECT * FROM "produtos" WHERE "criado" > '2049'; /* Permite comparar datas diretamente, desde que estejam no formato
correto (geralmente YYYY-MM-DD ou YYYY-MM-DD HH:MM:SS) */

SELECT * FROM "produtos" WHERE "criado" > '2049-08';

SELECT "nome", "criado" FROM "produtos" WHERE "criado" > '2049-08-03';

SELECT "nome", "criado" FROM "produtos" WHERE "criado" > '2049-08-11 14';

SELECT * FROM "produtos" WHERE "nome" = 'Impressora 3D Mini'; /* Deve se colocar extamente como está na tabela, mas se quiser
selecionar mesmo com diferenças de caixa alta ou não é só colocar COLLATE NOCASE dps do dado que será pesquisado */

SELECT * FROM "produtos" WHERE "nome" = 'Óculos 3d pro' COLLATE NOCASE; /* Para procurar com Case sensitive desativado a letra pesquisada
não pode ter aceto */

SELECT * FROM "produtos";

SELECT * FROM "produtos" WHERE "categoria" is NULL; /* IS e IS NOT verifica se os valores são nulos e booleanos */

SELECT * FROM "produtos" WHERE "categoria" is NOT NULL;

SELECT * FROM "produtos" WHERE "lancamento" is TRUE;

SELECT * FROM "produtos" WHERE "lancamento" is FALSE;

SELECT * FROM "produtos" WHERE "nome" LIKE 'impressora 3d mini'; /* LIKE e NOT LIKE é usado para comparar padrões em strings.
Por padrão ele não é sensível a maiúsculas e minúsculas */

SELECT * FROM "produtos" WHERE "nome" LIKE 'notebook%'; -- % Representa zero ou mais caracteres

SELECT * FROM "produtos" WHERE "nome" NOT LIKE '%pro';

SELECT * FROM "produtos" WHERE "nome" LIKE '%3d%';

SELECT * FROM "produtos" WHERE "nome" LIKE '% _TB%'; -- _ Representa exatamente um caractere

SELECT * FROM "produtos" WHERE "nome" LIKE '%notebook%' OR "nome" LIKE '%process%';

SELECT * FROM "produtos" WHERE "preco" BETWEEN 10000 AND 20000; /* É usando para verificar se um determinado valor está entre os
intervalos declarados, incluido os limites */

SELECT * FROM "produtos" WHERE "criado" BETWEEN '2049-08' AND '2049-11';

SELECT * FROM "produtos" WHERE "criado" NOT BETWEEN '2049-06' AND '2049-08';

SELECT * FROM "produtos" WHERE "categoria" IN ('notebook', 'hardware'); /* IN e NOT IN verifica se um valor está ou não dentro 
de um intervalo específico */

SELECT * FROM "produtos" WHERE "categoria" NOT IN ('notebook', 'hardware');

SELECT * FROM "produtos" WHERE "id" IN (1,5,7);

SELECT * FROM "produtos" WHERE "id" NOT IN (1,5,7);

SELECT COUNT(*) FROM "produtos"; -- Conta o número de linhas

SELECT COUNT("categoria") FROM "produtos"; -- Retorna a quantidade de produtos com a categoria não nula

SELECT SUM("estoque") FROM "produtos"; -- Me retorna a soma dos valores da coluna selecionada

SELECT SUM("estoque") AS "total_estoque" FROM "produtos"; -- AS renomeia a coluna retornada para o que foi passado

SELECT AVG("preco") AS "media_valores" FROM "produtos"; -- Retorna a média dos valores passados

SELECT ROUND(AVG("preco")) AS "media_arredondada_valores" FROM "produtos"; -- ROUND arredonda os valor retornado

SELECT MIN("preco") AS "produto_valor_minimo", "nome" FROM "produtos"; -- Retorna o menor valor encontrado

SELECT MAX("preco") AS "produto_valor_maximo", "nome" FROM "produtos"; -- Retorna o maior valor encontrado

SELECT LENGTH("nome") AS "tamanho", "nome" FROM "produtos" WHERE "tamanho" > 10; -- LENGTH Retorna a quantidade de caracteres no item selecionado

SELECT LOWER("nome") AS "nome_min", "nome" FROM "produtos" WHERE "nome_min" = LOWER('Fone bluetooth'); -- Converte uma string para minúsculas

SELECT TRIM(LOWER("nome")) AS "nome_min", "nome" FROM "produtos" WHERE "nome_min" = TRIM(LOWER('    Fone bluetooth    ')); -- Remove espaços em branco do início e do fim de uma string

SELECT SUBSTR("nome", 1, 5) FROM "produtos"; -- Retorna a parte selecionada da string

SELECT DATE('now', '-03:00'); -- Retorna a data atual ou converte uma string em data. O now é sempre me relação ao UTC 00

SELECT TIME('now', '-03:00'); -- Retorna a hora atual ou converte uma string em hora. O -03:00 é para retornar o horário de Brasilia, que por definição é 3h em relação ao UTC 00

SELECT TIME('now', 'localtime'); -- O localtime retorna o horário do local onde o SQL está sendo executado

SELECT DATETIME('now', '-03:00'); -- Retorna a data e hora atual ou converte uma string em data e hora

SELECT CURRENT_TIMESTAMP; -- Retorna a data e hora atual de acordo com UTC 00

SELECT STRFTIME('%Y-%m-%d %H:%M:%S', 'now', '-03:00'); -- Formata uma data e hora em uma string

SELECT * FROM "produtos" ORDER BY "preco" ASC; -- Ordena os resultados da consulta, a forma padrão é acendente(menor para maior)

SELECT * FROM "produtos" ORDER BY "preco" DESC; -- Ordena de forma descente(maior para menor)

SELECT * FROM "produtos" ORDER BY "categoria" ASC, "preco" ASC; -- Ordena primeiro a categoria e depois o preço

SELECT * FROM "produtos" ORDER BY "criado" DESC; -- Ordena por data

SELECT "categoria", COUNT(*) AS "total" FROM "produtos" GROUP BY "categoria"; -- Agrupa por categoria e soma o total de cada categoria e retorna em ordem crescente

SELECT "categoria", COUNT(*) AS "total" FROM "produtos" GROUP BY "categoria" ORDER BY "total" DESC; -- Para selecionar a ordem de ordenação usa-se em conjunto ORDER BY, pois por padrão GROUP BY ordena de forma crescente

SELECT STRFTIME('%Y', "criado") AS "ano", COUNT(*) AS "total" FROM "produtos" GROUP BY "ano"; -- Agrupa por ano e retorna no total a quantidade de cada grupo de anos

SELECT "categoria", COUNT(*) AS "total" FROM "produtos" GROUP BY "categoria" HAVING "total" > 1; -- HAVING funciona como WHERE após o GROUP BY

SELECT "categoria", AVG("preco") AS "preco_medio" FROM "produtos" GROUP BY "categoria" HAVING "preco_medio" > 70000; -- Retorna as categorias de produtos que as somas de seus valores foram superiores a 70000

SELECT * FROM "produtos" WHERE "preco" > (SELECT AVG("preco") FROM "produtos"); -- Uso de Sbquery para selecionar os produtos com preco maior que a média de precos

SELECT * FROM "produtos" WHERE "preco" > (SELECT AVG("preco") FROM "produtos"); -- Usa-se uma Subquery para filtrar os produtos que possuem os preços menores que a média de preços

WITH "preco_medio" AS (
    SELECT AVG("preco") AS "media" FROM "produtos"
) -- Cria-se uma subquery temporaria, que pode ser referenciada na query principal. Não se fecha com ; pois a continuação dela vem abaixo

SELECT * FROM "produtos" WHERE "preco" > (SELECT "media" FROM "preco_medio");

CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "create" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "users" ("name", "password", "email", "create")
VALUES
    ('Carlos Silva', '123456', 'carlos@email.com', '2048-01-15 08:30:00'),
    ('João Perreira', '123456', 'joao@email.com', '2048-03-08 11:45:00'),
    ('Pedro Alves', '123456', 'pedro@email.com', '2048-05-20 14:10:00'),
    ('Lucas Souza', '123456', 'lucas@email.com', '2048-07-30 09:25:00'),
    ('Matheus Lima', '123456', 'matheus@email.com', '2048-10-12 16:05:00'),
    ('Ana Costa', '123456', 'ana@email.com', '2049-02-04 13:50:00'),
    ('Fernanda Rocha', '123456', 'fernanda@email.com', '2049-04-16 10:20:00'),
    ('Mariana Gomes', '123456', 'mariana@email.com', '2049-06-28 18:40:00'),
    ('Renata Dias', '123456', 'renata@email.com', '2049-09-09 07:15:00'),
    ('Beatriz Melo', '123456', 'beatriz@email.com', '2049-12-21 12:55:00');

CREATE TABLE "courses" (
    "id" INTEGER PRIMARY KEY,
    "slug" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "aulas" INTEGER NOT NULL,
    "horas" INTEGER NOT NULL,
    "create" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "courses" ("slug", "title", "description", "aulas", "horas", "create")
VALUES
    ('html-para-iniciantes', 'HTML para Iniciantes', 'Aprendenda a linguagem de marcação que é a base da web, começando do zero até páginas completas.', 40, 10, '2048-02-10 09:00:00'),
    ('css-animacoes', 'CSS - Animações', 'Domine transições, transforms e keyframes para criar efeitos de movimento modernos em sites.', 35, 8,'2048-06-22 14:30:00'),
    ('javascript-completo', 'JavaScript Completo', 'Do básico ao avançado: sintaxe, DOM, ES modules, APIs Web e programação assíncrona.', 120, 25, '2049-01-18 11:15:00'),
    ('sqlite-fundamentos', 'SQLite - Fundamentos', 'Entenda a instalação, comandos essenciais, consultas e boas práticas com banco de dados embarcado.', 50, 12, '2049-05-05 16:45:00');

CREATE TABLE "lessons" (
    "id" INTEGER PRIMARY KEY,
    "course_id" INTEGER NOT NULL,
    "slug" TEXT NOT NULL COLLATE NOCASE,
    "title" TEXT NOT NULL,
    "materia" TEXT NOT NULL,
    "materia_slug" TEXT NOT NULL,
    "seconds" INTEGER NOT NULL,
    "video" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "lesson_order" INTEGER NOT NULL,
    "free" INTEGER NOT NULL DEFAULT 0 CHECK ("free" IN (0,1)),
    "create" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
    UNIQUE("course_id", "slug")
) STRICT;

INSERT INTO "lessons" ("course_id", "slug", "title", "materia", "materia_slug", "seconds", "video", "description", "lesson_order", "free", "create")
VALUES
(1,'introducao-ao-html','Introdução ao HTML','Fundamentos','fundamentos',300,'html01.mp4','Visão geral do HTML e configuração do ambiente.',1,1,'2048-02-15 09:00:00'),
(1,'tags-basicas','Tags Básicas','Fundamentos','fundamentos',420,'html02.mp4','Uso das principais tags de estrutura.',2,0,'2048-02-17 09:00:00'),
(1,'atributos-e-semantica','Atributos e Semântica','Fundamentos','fundamentos',360,'html03.mp4','Atributos globais e boas práticas semânticas.',3,0,'2048-02-19 09:00:00'),
(1,'imagens-e-links','Imagens e Links','Multimídia','multimidia',480,'html04.mp4','Inserindo imagens responsivas e links internos/externos.',4,0,'2048-02-21 09:00:00'),
(1,'conclusao','Conclusão','Estrutura','estrutura',540,'html05.mp4','Criando tabelas acessíveis e formulários semânticos.',5,0,'2048-02-23 09:00:00'),

(2,'transicoes-css','Transições CSS','Fundamentos','fundamentos',360,'css01.mp4','Introdução às propriedades de transição.',1,1,'2048-06-25 14:30:00'),
(2,'transforms-2d-e-3d','Transforms 2D e 3D','Fundamentos','fundamentos',420,'css02.mp4','Aplicando transformações de escala, rotação e translação.',2,0,'2048-06-27 14:30:00'),
(2,'keyframes-na-pratica','@keyframes na prática','Animações','animacoes',480,'css03.mp4','Criando animações complexas com keyframes.',3,0,'2048-06-29 14:30:00'),
(2,'propriedades-de-animacao','Propriedades de Animação','Animações','animacoes',450,'css04.mp4','Controlando timing, delay e iteration count.',4,0,'2048-07-01 14:30:00'),
(2,'conclusao','Conclusão','Avançado','avancado',540,'css05.mp4','Disparando animações via Intersection Observer.',5,0,'2048-07-03 14:30:00'),

(3,'introducao-ao-javascript','Introdução ao JavaScript','Fundamentos','fundamentos',300,'js01.mp4','História, versões ES e configuração do ambiente.',1,1,'2049-01-20 11:15:00'),
(3,'variaveis-e-tipos','Variáveis e Tipos','Fundamentos','fundamentos',420,'js02.mp4','let, const, tipos primitivos e conversões.',2,0,'2049-01-22 11:15:00'),
(3,'funcoes-e-escopo','Funções e Escopo','Fundamentos','fundamentos',480,'js03.mp4','Declaração, arrow functions e closures.',3,0,'2049-01-24 11:15:00'),
(3,'dom-manipulation','DOM Manipulation','DOM','dom',540,'js04.mp4','Selecionando e alterando elementos HTML.',4,0,'2049-01-26 11:15:00'),
(3,'fetch-api','Fetch API','Async','async',600,'js05.mp4','Requisições assíncronas com fetch e async/await.',5,0,'2049-01-28 11:15:00'),

(4,'introducao-ao-sqlite','Introdução ao SQLite','Fundamentos','fundamentos',300,'sqlite01.mp4','O que é SQLite e onde usar.',1,1,'2049-05-08 16:45:00'),
(4,'criacao-de-tabelas','Criação de Tabelas','DDL','ddl',420,'sqlite02.mp4','Sintaxe CREATE TABLE e tipos de dados.',2,0,'2049-05-10 16:45:00'),
(4,'select-e-where','SELECT e WHERE','DML','dml',480,'sqlite03.mp4','Consultas básicas e filtros.',3,0,'2049-05-12 16:45:00'),
(4,'insert-update-delete','INSERT, UPDATE, DELETE','DML','dml',540,'sqlite04.mp4','Manipulação de dados na prática.',4,0,'2049-05-14 16:45:00'),
(4,'indices-e-otimizacao','Índices e Otimização','Performance','performance',600,'sqlite05.mp4','Criação de índices e análise de desempenho.',5,0,'2049-05-16 16:45:00');


CREATE TABLE "lessons_completed" (
    "user_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,
    "lesson_id" INTEGER NOT NULL,
    "completed" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("user_id", "course_id", "lesson_id"),
    FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id"),
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
)STRICT;

INSERT INTO "lessons_completed" ("user_id", "course_id", "lesson_id", "completed")
VALUES
(1,1,1,'2048-03-01 10:00:00'),
(1,1,2,'2048-03-02 10:00:00'),
(1,1,3,'2048-03-03 10:00:00'),
(1,1,4,'2048-03-04 10:00:00'),
(1,1,5,'2048-03-05 10:00:00'),
(1,2,6,'2048-03-06 10:00:00'),
(1,2,7,'2048-03-07 10:00:00'),
(1,2,8,'2048-03-08 10:00:00'),
(1,2,9,'2048-03-09 10:00:00'),
(1,2,10,'2048-03-10 10:00:00'),
(2,3,11,'2048-04-01 11:00:00'),
(2,3,12,'2048-04-02 11:00:00'),
(2,3,13,'2048-04-03 11:00:00'),
(2,3,14,'2048-04-04 11:00:00'),
(2,3,15,'2048-04-05 11:00:00'),
(2,4,16,'2048-04-06 11:00:00'),
(2,4,17,'2048-04-07 11:00:00'),
(2,4,18,'2048-04-08 11:00:00'),
(2,4,19,'2048-04-09 11:00:00'),
(2,4,20,'2048-04-10 11:00:00'),
(3,1,1,'2048-05-01 12:00:00'),
(3,1,2,'2048-05-02 12:00:00'),
(3,1,3,'2048-05-03 12:00:00'),
(3,1,4,'2048-05-04 12:00:00'),
(3,1,5,'2048-05-05 12:00:00'),
(3,2,6,'2048-05-06 12:00:00'),
(3,2,7,'2048-05-07 12:00:00'),
(3,2,8,'2048-05-08 12:00:00'),
(3,2,9,'2048-05-09 12:00:00'),
(3,2,10,'2048-05-10 12:00:00'),
(4,3,11,'2048-06-01 13:00:00'),
(4,3,12,'2048-06-02 13:00:00'),
(4,3,13,'2048-06-03 13:00:00'),
(4,3,14,'2048-06-04 13:00:00'),
(4,3,15,'2048-06-05 13:00:00'),
(4,4,16,'2048-06-06 13:00:00'),
(4,4,17,'2048-06-07 13:00:00'),
(4,4,18,'2048-06-08 13:00:00'),
(4,4,19,'2048-06-09 13:00:00'),
(4,4,20,'2048-06-10 13:00:00'),
(5,1,1,'2048-07-01 14:00:00'),
(5,1,2,'2048-07-02 14:00:00'),
(5,1,3,'2048-07-03 14:00:00'),
(5,1,4,'2048-07-04 14:00:00'),
(5,1,5,'2048-07-05 14:00:00'),
(5,2,6,'2048-07-06 14:00:00'),
(5,2,7,'2048-07-07 14:00:00'),
(5,2,8,'2048-07-08 14:00:00'),
(5,2,9,'2048-07-09 14:00:00'),
(5,2,10,'2048-07-10 14:00:00'),
(6,3,11,'2048-08-01 15:00:00'),
(6,3,12,'2048-08-02 15:00:00'),
(6,3,13,'2048-08-03 15:00:00'),
(6,3,14,'2048-08-04 15:00:00'),
(6,3,15,'2048-08-05 15:00:00'),
(6,4,16,'2048-08-06 15:00:00'),
(6,4,17,'2048-08-07 15:00:00'),
(6,4,18,'2048-08-08 15:00:00'),
(6,4,19,'2048-08-09 15:00:00'),
(6,4,20,'2048-08-10 15:00:00'),
(7,1,1,'2049-01-01 10:00:00'),
(7,1,2,'2049-01-02 10:00:00'),
(7,1,3,'2049-01-03 10:00:00'),
(7,1,4,'2049-01-04 10:00:00'),
(7,1,5,'2049-01-05 10:00:00'),
(7,2,6,'2049-01-06 10:00:00'),
(7,2,7,'2049-01-07 10:00:00'),
(7,2,8,'2049-01-08 10:00:00'),
(7,2,9,'2049-01-09 10:00:00'),
(7,2,10,'2049-01-10 10:00:00'),
(8,3,11,'2049-02-01 11:00:00'),
(8,3,12,'2049-02-02 11:00:00'),
(8,3,13,'2049-02-03 11:00:00'),
(8,3,14,'2049-02-04 11:00:00'),
(8,3,15,'2049-02-05 11:00:00'),
(8,4,16,'2049-02-06 11:00:00'),
(8,4,17,'2049-02-07 11:00:00'),
(8,4,18,'2049-02-08 11:00:00'),
(8,4,19,'2049-02-09 11:00:00'),
(8,4,20,'2049-02-10 11:00:00'),
(9,1,1,'2049-03-01 12:00:00'),
(9,1,2,'2049-03-02 12:00:00'),
(9,1,3,'2049-03-03 12:00:00'),
(9,1,4,'2049-03-04 12:00:00'),
(9,1,5,'2049-03-05 12:00:00'),
(9,2,6,'2049-03-06 12:00:00'),
(9,2,7,'2049-03-07 12:00:00'),
(9,2,8,'2049-03-08 12:00:00'),
(9,2,9,'2049-03-09 12:00:00'),
(9,2,10,'2049-03-10 12:00:00'),
(10,3,11,'2049-04-01 13:00:00'),
(10,3,12,'2049-04-02 13:00:00'),
(10,3,13,'2049-04-03 13:00:00'),
(10,3,14,'2049-04-04 13:00:00'),
(10,3,15,'2049-04-05 13:00:00'),
(10,4,16,'2049-04-06 13:00:00'),
(10,4,17,'2049-04-07 13:00:00'),
(10,4,18,'2049-04-08 13:00:00'),
(10,4,19,'2049-04-09 13:00:00'),
(10,4,20,'2049-04-10 13:00:00');

CREATE TABLE "certificates" (
    "id" TEXT PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "course_id" INTEGER NOT NULL,
    "completed" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE("user_id", "course_id"),
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO "certificates" ("id", "user_id", "course_id", "completed")
VALUES
    ('bcg0zqum',1,1,'2048-03-11 10:30:00'),
('4k49owcs',1,2,'2048-03-12 10:30:00'),
('uf5w7zlm',2,3,'2048-04-11 11:30:00'),
('9oumw1fi',2,4,'2048-04-12 11:30:00'),
('cl1514p9',3,1,'2048-05-11 12:30:00'),
('m4w3lemj',3,2,'2048-05-12 12:30:00'),
('4ptlrhqc',4,3,'2048-06-11 13:30:00'),
('iiw3qj1v',4,4,'2048-06-12 13:30:00'),
('ligrezky',5,1,'2048-07-11 14:30:00'),
('mntsizdm',5,2,'2048-07-12 14:30:00'),
('rmw7nfc7',6,3,'2048-08-11 15:30:00'),
('o2d5epud',6,4,'2048-08-12 15:30:00'),
('1jtfu95z',7,1,'2049-01-11 10:30:00'),
('noghxkv1',7,2,'2049-01-12 10:30:00'),
('71ino092',8,3,'2049-02-11 11:30:00'),
('n385kool',8,4,'2049-02-12 11:30:00'),
('df00tns4',9,1,'2049-03-11 12:30:00'),
('fpsyspuw',9,2,'2049-03-12 12:30:00'),
('s8jjeccz',10,3,'2049-04-11 13:30:00'),
('zr5qee0t',10,4,'2049-04-12 13:30:00');

SELECT * FROM "lessons_completed" JOIN "users" ON "lessons_completed"."user_id" = "users"."id"; /* Agrega dados de duas ou mais tabelas com base em uma condição.
O padrão do JOIN é INNER JOIN, que retorna apenas as linhas que têm correspondência em ambas as tabelas. */

SELECT "users"."name", "lessons_completed"."lesson_id" FROM "lessons_completed"
JOIN "users" ON "lessons_completed"."lesson_id" = "users"."id"; -- Retorna o nome correspondentes a os users_id de lessons_completed

SELECT "u"."name", "lc"."lesson_id" FROM "lessons_completed" AS "lc"
JOIN "users" AS "u" ON "lc"."lesson_id" = "u"."id"; -- Faz a mesma coisa do código acima, porém neste caso foi usada abreviações dos nomes das tabelas

-- Multiplos JOINs
SELECT "u"."name", "l"."title" AS "title_lesson", "c"."title" AS "title_course"
FROM "lessons_completed" AS "lc"
JOIN "users" AS "u" ON "lc"."user_id" = "u"."id"
JOIN "lessons" AS "l" ON "lc"."lesson_id" = "l"."id"
JOIN "courses" AS "c" ON "lc"."course_id" = "c"."id"; -- Retorna uma tabela com o nome do usuário, a lição concluída e o titulo do curso desta lição

SELECT "lc"."user_id", "l"."title", "lc"."completed" FROM "lessons" AS "l"
LEFT JOIN "lessons_completed" AS "lc"
ON "lc"."lesson_id" = "l"."id" AND "lc"."user_id" = 1; -- Retorna todas as lições, mesmo as não completadas pelo usuário

SELECT "a"."id", "a"."slug"
FROM "lessons" AS "a"
JOIN "lessons" AS "b"
ON "a"."slug" = "b"."slug"
WHERE "a"."id" != "b"."id"; -- é um JOIN de uma tabela consigo mesma. É útil para comparar linhas dentro da mesma tabela e encontrar valores duplicados.