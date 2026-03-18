-- CreateEnum
CREATE TYPE "Player_color" AS ENUM ('BLACK', 'WHITE');

-- CreateTable
CREATE TABLE "Annotations" (
    "annotation_id" SERIAL NOT NULL,
    "authorId" INTEGER NOT NULL,
    "noteId" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "move_number" INTEGER NOT NULL,
    "color" "Player_color" NOT NULL,
    "glyph" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Annotations_pkey" PRIMARY KEY ("annotation_id")
);

-- AddForeignKey
ALTER TABLE "Annotations" ADD CONSTRAINT "Annotations_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Annotations" ADD CONSTRAINT "Annotations_noteId_fkey" FOREIGN KEY ("noteId") REFERENCES "Notes"("note_id") ON DELETE CASCADE ON UPDATE CASCADE;
