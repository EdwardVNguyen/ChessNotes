-- CreateTable
CREATE TABLE "_UserFollows" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_UserFollows_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_UserBlocking" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_UserBlocking_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_CollaboratorFolder" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_CollaboratorFolder_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_CollaboratorNotes" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_CollaboratorNotes_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_UserFollows_B_index" ON "_UserFollows"("B");

-- CreateIndex
CREATE INDEX "_UserBlocking_B_index" ON "_UserBlocking"("B");

-- CreateIndex
CREATE INDEX "_CollaboratorFolder_B_index" ON "_CollaboratorFolder"("B");

-- CreateIndex
CREATE INDEX "_CollaboratorNotes_B_index" ON "_CollaboratorNotes"("B");

-- AddForeignKey
ALTER TABLE "_UserFollows" ADD CONSTRAINT "_UserFollows_A_fkey" FOREIGN KEY ("A") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserFollows" ADD CONSTRAINT "_UserFollows_B_fkey" FOREIGN KEY ("B") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBlocking" ADD CONSTRAINT "_UserBlocking_A_fkey" FOREIGN KEY ("A") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBlocking" ADD CONSTRAINT "_UserBlocking_B_fkey" FOREIGN KEY ("B") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CollaboratorFolder" ADD CONSTRAINT "_CollaboratorFolder_A_fkey" FOREIGN KEY ("A") REFERENCES "Folders"("folder_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CollaboratorFolder" ADD CONSTRAINT "_CollaboratorFolder_B_fkey" FOREIGN KEY ("B") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CollaboratorNotes" ADD CONSTRAINT "_CollaboratorNotes_A_fkey" FOREIGN KEY ("A") REFERENCES "Notes"("note_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CollaboratorNotes" ADD CONSTRAINT "_CollaboratorNotes_B_fkey" FOREIGN KEY ("B") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
