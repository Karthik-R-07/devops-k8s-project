const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello from Azure DevOps Project 🚀");
});

app.listen(port, "0.0.0.0", () =>
  console.log(`Running on port ${port}`)
);