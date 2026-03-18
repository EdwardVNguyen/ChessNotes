-- CreateEnum
CREATE TYPE "Time_control" AS ENUM ('BULLET', 'BLITZ', 'RAPID', 'CLASSICAL');

-- CreateEnum
CREATE TYPE "Result_reason" AS ENUM ('CHECKMATE', 'RESIGNATION', 'TIMEOUT', 'DRAW');

-- CreateTable
CREATE TABLE "Game_info" (
    "gameInfoId" INTEGER NOT NULL,
    "whiteId" INTEGER NOT NULL,
    "white_rating" INTEGER NOT NULL,
    "blackId" INTEGER NOT NULL,
    "black_rating" INTEGER NOT NULL,
    "time_control" "Time_control" NOT NULL,
    "result_reason" "Result_reason" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Game_info_pkey" PRIMARY KEY ("gameInfoId")
);

-- AddForeignKey
ALTER TABLE "Game_info" ADD CONSTRAINT "Game_info_gameInfoId_fkey" FOREIGN KEY ("gameInfoId") REFERENCES "Games"("game_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game_info" ADD CONSTRAINT "Game_info_whiteId_fkey" FOREIGN KEY ("whiteId") REFERENCES "Users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game_info" ADD CONSTRAINT "Game_info_blackId_fkey" FOREIGN KEY ("blackId") REFERENCES "Users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;
