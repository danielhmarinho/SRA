CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "places" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "place_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_types_on_place_id" ON "types" ("place_id");
CREATE TABLE "pessoas" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "as_pessoa_id" integer, "as_pessoa_type" varchar(255), "name" varchar(255), "identificacao" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "professors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "matricula" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "atendimentos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "pessoa_id" integer, "data" datetime, "place_id" integer, "type_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_atendimentos_on_pessoa_id" ON "atendimentos" ("pessoa_id");
CREATE INDEX "index_atendimentos_on_place_id" ON "atendimentos" ("place_id");
CREATE INDEX "index_atendimentos_on_type_id" ON "atendimentos" ("type_id");
CREATE TABLE "alunos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "matricula" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "servidors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "matricula" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comunidades" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "identificacao" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20131029172405');

INSERT INTO schema_migrations (version) VALUES ('20131029172539');

INSERT INTO schema_migrations (version) VALUES ('20131029173902');

INSERT INTO schema_migrations (version) VALUES ('20131029174209');

INSERT INTO schema_migrations (version) VALUES ('20131029175655');

INSERT INTO schema_migrations (version) VALUES ('20131101013145');

INSERT INTO schema_migrations (version) VALUES ('20131104174208');

INSERT INTO schema_migrations (version) VALUES ('20131104210819');