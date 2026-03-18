-- CreateTable
CREATE TABLE "User_rating_info" (
    "user_rating_info_id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "bullet_rating" INTEGER NOT NULL,
    "blitz_rating" INTEGER NOT NULL,
    "rapid_rating" INTEGER NOT NULL,
    "classical_rating" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_rating_info_pkey" PRIMARY KEY ("user_rating_info_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_rating_info_userId_key" ON "User_rating_info"("userId");

-- AddForeignKey
ALTER TABLE "User_rating_info" ADD CONSTRAINT "User_rating_info_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;
