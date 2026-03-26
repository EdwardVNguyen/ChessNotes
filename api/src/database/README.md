For local development, you must create a .env file that holds a Postgres DB url.

To upload schema onto local database:
    npx prisma migrate dev

For any changes in the Prisma schema:
    npx prisma generate
