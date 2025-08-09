-- database: ./db.sqlite

CREATE TABLE "users" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
  "create" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "users" ("name", "password", "email")
VALUES
  ('André', 'senha123', 'andre@email.com');

SELECT * FROM "users";


CREATE TABLE "courses" (
  "id" INTEGER PRIMARY KEY,
  "slug" TEXT NOT NULL COLLATE NOCASE UNIQUE,
  "title" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "aulas" INTEGER NOT NULL,
  "horas" INTEGER NOT NULL,
  "create" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "courses" ("slug", "title", "description", "aulas", "horas")
VALUES
  ('javascript-basico', 'JavaScript Básico', 'Aprenda os fundamentos da linguagem JavaScript,', 20, 5);

SELECT * FROM "courses";


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

INSERT INTO "lessons" ("course_id", "slug", "title", "materia", "materia_slug", "seconds", "video", "description", "lesson_order", "free")
VALUES
  (1, 'variaveis-let-const', 'Variáveis: let e const', 'Fundamentos', 'fundamentos', 400, 'variaveis.mp4', 'Entenda a diferença entre let, const e var', 3, 1);

SELECT * FROM "lessons";

CREATE TABLE "lessons-completed" (
  "user_id" INTEGER NOT NULL,
  "course_id" INTEGER NOT NULL,
  "lesson_id" INTEGER NOT NULL,
  "completed" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "course_id", "lesson_id"),
  FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id"),
  FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
  FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO "lessons-completed" ("user_id", "course_id", "lesson_id")
VALUES
  (1, 1, 1);

SELECT * FROM "lessons-completed";

CREATE TABLE "certificates" (
  "id" TEXT PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "course_id" INTEGER NOT NULL,
  "completed" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE ("user_id", "course_id"),
  FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("course_id") REFERENCES "courses" ("id")
) STRICT;

INSERT INTO "certificates" ("id", "user_id", "course_id")
VALUES
  ('aq32scsqd', 1, 1);

SELECT * FROM "certificates";