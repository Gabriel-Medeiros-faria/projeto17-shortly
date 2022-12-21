import express from "express"
import usersRoutes from "./Routes/users.Routes.js"
import urlsRoutes from "./Routes/urls.Routes.js"
import sessionRoutes from "./Routes/session.Routes.js"

const app = express()
app.use(express.json())
app.use(usersRoutes)
app.use(urlsRoutes)
app.use(sessionRoutes)

app.listen(4000, ()=> console.log("Server running in port: 4000"))
