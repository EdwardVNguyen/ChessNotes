import { prisma } from "../database/client.js"

export const getAllGames = async () => {
  return await prisma.games.findMany()
}
