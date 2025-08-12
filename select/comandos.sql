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
('Roteador WiFi 6E','rede',64900,0,75,0,'2049-12-06 11:11:11');-C','acessorio',9900,0,200,0,'2048-03-11 08:47:13'),
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