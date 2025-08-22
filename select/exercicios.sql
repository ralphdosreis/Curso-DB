-- database: ./db.sqlite

/* 1 - Selecione todas as aulas do curso de html-para-iniciantes e ordene por lesson_order em ordem crescente.

2 - Somar o total de segundos das aulas do curso de css-animacoes.

3 - Contar o total de aulas e agrupar por curso.

4 - Somar o total de segundos das aulas, agrupar por curso e ordenar o total de segundos por ordem decrescente.

5 - Utilize a query 4, e filtre apenas os cursos que possuem mais de 2300 segundos de aulas. Continue ordenando.

6 - Utilize a query 4, mostre o título do curso no lugar do course_id.

7 - Selecione o ID dos certificados de mariana@email.com

8 - Selecione todas as aulas completas ou não pelo usuário lucas@email.com. Mostre o título da aula e se está completa ou não.

9 - Selecione as aulas anterior/próxima da aula funcoes-e-escopo. Retorne 3 aulas (se existirem): a anterior, a atual e a próxima. Utilize o lesson_order para isso.
*/

-- 1
SELECT * FROM "lessons" WHERE "course_id" = (SELECT "id" FROM "courses" WHERE "slug" = 'html-para-iniciantes') ORDER BY "lesson_order";

--2
SELECT SUM("seconds") FROM "lessons" WHERE "course_id" = (SELECT "id" FROM "courses" WHERE "slug" = 'css-animacoes');

--3
SELECT "course_id", COUNT(*) AS "total_aulas" FROM "lessons" GROUP BY "course_id";

--4
SELECT "course_id", SUM("seconds") AS "total_seconds" FROM "lessons" GROUP BY "course_id" ORDER BY "total_seconds" DESC;

--5
SELECT "course_id", SUM("seconds") AS "total_seconds" FROM "lessons" GROUP BY "course_id" HAVING "total_seconds" > 2300 ORDER BY "total_seconds" DESC;

--6
SELECT "c"."title", SUM("l"."seconds") AS "total_seconds" FROM "lessons" AS "l" JOIN "courses" AS "c" ON "l"."course_id" = "c"."id" GROUP BY "c"."id" ORDER BY "total_seconds" DESC;

--7
SELECT "id" FROM "certificates" WHERE "user_id" = (SELECT "id" FROM "users" WHERE "email" = 'mariana@email.com');

--8
SELECT "l"."title", "lc"."completed" FROM "lessons" AS "l" LEFT JOIN "lessons_completed" AS "lc" ON "l"."id" = "lc"."lesson_id" AND "lc"."user_id" = (SELECT "id" FROM "users" WHERE "email" = 'lucas@email.com');

--9
SELECT * FROM "lessons"
WHERE "course_id" = (SELECT "course_id" FROM "lessons" WHERE "slug" = 'funcoes-e-escopo') AND "lesson_order" IN (
    (SELECT "lesson_order" FROM "lessons" WHERE "slug" = 'funcoes-e-escopo') - 1,
    (SELECT "lesson_order" FROM "lessons" WHERE "slug" = 'funcoes-e-escopo'),
    (SELECT "lesson_order" FROM "lessons" WHERE "slug" = 'funcoes-e-escopo') + 1
)
ORDER BY "lesson_order";

--outra alternativa
WITH "current" AS (
    SELECT "course_id", "lesson_order" FROM "lessons" WHERE "slug" = 'funcoes-e-escopo'
)
SELECT * FROM "lessons"
WHERE "course_id" = (SELECT "course_id" FROM "current") AND "lesson_order" IN (
    (SELECT "lesson_order" FROM "current") - 1,
    (SELECT "lesson_order" FROM "current"),
    (SELECT "lesson_order" FROM "current") + 1
)
ORDER BY "lesson_order";