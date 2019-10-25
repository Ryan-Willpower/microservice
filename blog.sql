-- -------------------------------------------------------------
-- TablePlus 2.10(270)
--
-- https://tableplus.com/
--
-- Database: blog
-- Generation Time: 2019-10-26 01:37:06.5250
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."comments";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS comments_postid_seq;

-- Table Definition
CREATE TABLE "public"."comments" (
    "postid" int4 NOT NULL DEFAULT nextval('comments_postid_seq'::regclass),
    "userid" uuid NOT NULL,
    "message" text NOT NULL,
    "date" timestamp DEFAULT now()
);

DROP TABLE IF EXISTS "public"."posts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_postid_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "postid" int4 NOT NULL DEFAULT nextval('posts_postid_seq'::regclass),
    "authorid" uuid NOT NULL,
    "title" text NOT NULL,
    "content" text NOT NULL,
    PRIMARY KEY ("postid")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."users" (
    "userid" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "username" text NOT NULL,
    "passwd" text NOT NULL,
    PRIMARY KEY ("userid")
);

ALTER TABLE "public"."comments" ADD FOREIGN KEY ("postid") REFERENCES "public"."posts"("postid") ON DELETE CASCADE;
ALTER TABLE "public"."comments" ADD FOREIGN KEY ("userid") REFERENCES "public"."users"("userid") ON DELETE CASCADE;
ALTER TABLE "public"."posts" ADD FOREIGN KEY ("authorid") REFERENCES "public"."users"("userid") ON DELETE CASCADE;
