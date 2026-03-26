import 'dotenv/config'
import express from 'express'
import type { Application, Request, Response } from 'express'

// import routes
import gameRoutes from './routes/games.js'

// create express application
const app: Application = express()

// middleware
app.use(express.json())

// routes
app.use('/user', gameRoutes) // TODO: have to be for a specified user

export default app
