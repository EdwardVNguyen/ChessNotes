import type { Request, Response } from 'express'
import { getAllGames } from '../services/games.js'

export const getGames = async (req: Request, res: Response) => {
  const games = await getAllGames()
  res.json(games)
}
