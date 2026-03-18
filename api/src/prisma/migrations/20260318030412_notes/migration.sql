-- DropForeignKey
ALTER TABLE "Folders" DROP CONSTRAINT "Folders_parentFolderId_fkey";

-- CreateTable
CREATE TABLE "Notes" (
    "note_id" SERIAL NOT NULL,
    "authorId" INTEGER NOT NULL,
    "gameId" INTEGER NOT NULL,
    "folderId" INTEGER NOT NULL,
    "note_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notes_pkey" PRIMARY KEY ("note_id")
);

-- AddForeignKey
ALTER TABLE "Folders" ADD CONSTRAINT "Folders_parentFolderId_fkey" FOREIGN KEY ("parentFolderId") REFERENCES "Folders"("folder_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Games"("game_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_folderId_fkey" FOREIGN KEY ("folderId") REFERENCES "Folders"("folder_id") ON DELETE SET NULL ON UPDATE CASCADE;
