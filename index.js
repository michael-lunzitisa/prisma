const express = require("express");
const app = express();

app.use(express.json());
app.use(express.urlencoded());
app.get("/", (req, res) => {
    return res.send("Hello World!");
});

import routes from "./routes/index";

app.use(routes);
app.listen(3000, () => {
    console.log("Serveur Express en écoute sur le port 3000");
});
