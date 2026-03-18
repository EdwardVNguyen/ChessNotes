-- CreateEnum
CREATE TYPE "Game_type" AS ENUM ('USER', 'IMPORTED');

-- CreateEnum
CREATE TYPE "Visibilities" AS ENUM ('PUBLIC', 'PRIVATE', 'UNLISTED');

-- CreateEnum
CREATE TYPE "Permissions" AS ENUM ('NOBODY', 'ONLY_ME', 'CONTRIBUTORS', 'EVERYONE');

-- CreateTable
CREATE TABLE "Games" (
    "game_id" SERIAL NOT NULL,
    "pgn" TEXT NOT NULL,
    "starting_fen" TEXT NOT NULL DEFAULT '',
    "type" "Game_type" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Games_pkey" PRIMARY KEY ("game_id")
);

-- CreateTable
CREATE TABLE "Folders" (
    "folder_id" SERIAL NOT NULL,
    "authorId" INTEGER NOT NULL,
    "parentFolderId" INTEGER,
    "folder_name" TEXT NOT NULL,
    "visibility" "Visibilities" NOT NULL DEFAULT 'PRIVATE',
    "clone_permission" "Permissions" NOT NULL DEFAULT 'ONLY_ME',
    "export_permission" "Permissions" NOT NULL DEFAULT 'ONLY_ME',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Folders_pkey" PRIMARY KEY ("folder_id")
);

-- AddForeignKey
ALTER TABLE "Folders" ADD CONSTRAINT "Folders_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Folders" ADD CONSTRAINT "Folders_parentFolderId_fkey" FOREIGN KEY ("parentFolderId") REFERENCES "Folders"("folder_id") ON DELETE SET NULL ON UPDATE CASCADE;
