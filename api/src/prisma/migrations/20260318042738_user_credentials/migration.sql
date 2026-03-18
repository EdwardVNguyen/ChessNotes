-- CreateTable
CREATE TABLE "User_credentials" (
    "userId" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_credentials_pkey" PRIMARY KEY ("userId","email")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_credentials_userId_key" ON "User_credentials"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_credentials_email_key" ON "User_credentials"("email");

-- AddForeignKey
ALTER TABLE "User_credentials" ADD CONSTRAINT "User_credentials_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
