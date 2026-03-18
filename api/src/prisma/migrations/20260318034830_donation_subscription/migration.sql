/*
  Warnings:

  - You are about to alter the column `comment` on the `Annotations` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(4095)`.
  - You are about to alter the column `folder_name` on the `Folders` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `note_name` on the `Notes` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `username` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `biography` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(4095)`.

*/
-- CreateEnum
CREATE TYPE "Subscription_status" AS ENUM ('ACTIVE', 'INACTIVE', 'ONE_TIME_PAYMENT');

-- AlterTable
ALTER TABLE "Annotations" ALTER COLUMN "comment" SET DATA TYPE VARCHAR(4095);

-- AlterTable
ALTER TABLE "Folders" ALTER COLUMN "folder_name" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Notes" ALTER COLUMN "note_name" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Users" ALTER COLUMN "username" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "biography" SET DATA TYPE VARCHAR(4095);

-- CreateTable
CREATE TABLE "Donation_subscriptions" (
    "donation_subscription_id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "currency" CHAR(3) NOT NULL,
    "amount" DECIMAL(10,2) NOT NULL,
    "number_of_payments" INTEGER NOT NULL DEFAULT 1,
    "status" "Subscription_status" NOT NULL DEFAULT 'INACTIVE',
    "processor" TEXT NOT NULL,
    "processor_sub_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "current_period_end" TIMESTAMP(3) NOT NULL,
    "cancelled_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Donation_subscriptions_pkey" PRIMARY KEY ("donation_subscription_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Donation_subscriptions_processor_sub_id_key" ON "Donation_subscriptions"("processor_sub_id");

-- AddForeignKey
ALTER TABLE "Donation_subscriptions" ADD CONSTRAINT "Donation_subscriptions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;
